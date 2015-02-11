//
//  ViewController.m
//  cameraTest
//
//  Created by Groby Lington on 2015/02/11.
//  Copyright (c) 2015年 systems-power. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
<AVCaptureVideoDataOutputSampleBufferDelegate, AVAudioPlayerDelegate>
{
    BOOL isRequireTakePhoto;
    BOOL isProcessing;
    void *bitmap;
    CGFloat orgVolume;
}
@property (nonatomic, strong) UIImage *imageBuffer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sLabel.hidden=YES;
    
    // Do any additional setup after loading the view, typically from a nib.
    // バッファ作成
    size_t width = 640;
    size_t height = 480;
    size_t captureSize = width * height * 4;
    bitmap = malloc(captureSize);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGDataProviderRef dataProviderRef = CGDataProviderCreateWithData(NULL,
                                                                     bitmap,
                                                                     captureSize,
                                                                     NULL);
    CGBitmapInfo bitmapInfo
    = kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst;
    CGImageRef cgImage = CGImageCreate(width,
                                       height,
                                       8,
                                       32,
                                       width * 4,
                                       colorSpace,
                                       bitmapInfo,
                                       dataProviderRef,
                                       NULL,
                                       0,
                                       kCGRenderingIntentDefault);
    self.imageBuffer = [UIImage imageWithCGImage:cgImage];
    CGColorSpaceRelease(colorSpace);
    CGDataProviderRelease(dataProviderRef);
    
    // セッションオブジェクトを生成
    AVCaptureSession *captureSession = [[AVCaptureSession alloc] init];
    
    // 入力デバイスとしてビデオを選択
    AVCaptureDevice *captureDevice;
    captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    AVCaptureInput *captureInput;
    captureInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice
                                                         error:&error];
    [captureSession addInput:captureInput];
    
    // セッションのプリセットを設定
    [captureSession beginConfiguration];
    captureSession.sessionPreset = AVCaptureSessionPreset640x480;
    [captureSession commitConfiguration];
    
    // 出力を初期化
    AVCaptureVideoDataOutput *videoOutput;
    videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    videoOutput.videoSettings
    = @{(id)kCVPixelBufferPixelFormatTypeKey: @(kCVPixelFormatType_32BGRA)};
    videoOutput.alwaysDiscardsLateVideoFrames = YES;
    [captureSession addOutput:videoOutput];
    
    // 出力のデリゲートを設定
    dispatch_queue_t queue = dispatch_queue_create("com.shu223.myQueue", NULL);
    [videoOutput setSampleBufferDelegate:self
                                   queue:queue];
    //dispatch_release(queue);
    
    // プレビュー表示
    AVCaptureVideoPreviewLayer *previewLayer;
    previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    previewLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:previewLayer atIndex:0];
    
    // セッション開始
    [captureSession startRunning];
    
    
    // オーディオセッションカテゴリを変更する
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                           error:nil];
    
    // シャッター音
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shutter"
                                                     ofType:@"wav"];
    NSURL *url = [NSURL URLWithString:path];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                              error:nil];
    self.audioPlayer.delegate = self;
    
    
    // 見えないMPVolumeView オブジェクトを貼付けておく
    CGRect frame = CGRectZero;
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:frame];
    NSArray *windows = [[UIApplication sharedApplication] windows];
    [[windows objectAtIndex:0] addSubview:volumeView];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // プレビューレイヤーのframeを再設定
    for (CALayer *aSublayer in self.view.layer.sublayers) {
        
        if ([aSublayer isKindOfClass:[AVCaptureVideoPreviewLayer class]]) {
            
            aSublayer.frame = self.view.bounds;
            
            break;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection
{
    if (!isRequireTakePhoto) {
        
        return;
    }
    
    isRequireTakePhoto = NO;
    isProcessing = YES;
    
    
    // 設定してあったシステムボリュームを退避しておく
    orgVolume = [MPMusicPlayerController applicationMusicPlayer].volume;
    
    // システムボリュームを一時的に変更
    [MPMusicPlayerController applicationMusicPlayer].volume = 0.1f;
    
    // AVAudioPlayerでシャッター音を再生
    [self.audioPlayer play];
    
    
    CVPixelBufferRef pixbuff = CMSampleBufferGetImageBuffer(sampleBuffer);
    
    if(CVPixelBufferLockBaseAddress(pixbuff, 0) == kCVReturnSuccess){
        
        memcpy(bitmap, CVPixelBufferGetBaseAddress(pixbuff), 640 * 480 * 4);
        
        // メタデータ取得＆orientation情報追記
        NSMutableDictionary *metadata;
        metadata = [NSMutableDictionary dictionaryWithCapacity:0];
        
        // ここではorientaionは一定（6）とする
        [metadata setObject:[NSNumber numberWithInt:6]
                     forKey:(NSString *)kCGImagePropertyOrientation];
        
        // フォトアルバムに保存
        ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
        
        [library writeImageToSavedPhotosAlbum:self.imageBuffer.CGImage
                                     metadata:metadata
                              completionBlock:^(NSURL *assetURL,
                                                NSError *error) {
                                  
                                  if (error) {
                                      NSLog(@"error:%@", error);
                                  }
                                  
                                  isProcessing = NO;
                              }];
        
        CVPixelBufferUnlockBaseAddress(pixbuff, 0);
    }
}


#pragma mark -------------------------------------------------------------------
#pragma mark AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    // 退避しておいたシステムボリュームを元に戻す
    [MPMusicPlayerController applicationMusicPlayer].volume = orgVolume;
}


#pragma mark -------------------------------------------------------------------
#pragma mark IBAction

- (IBAction)pressShutter {
    _sLabel.hidden=NO;
    if (!isProcessing) {
        
        isRequireTakePhoto = YES;        
    }
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    _sLabel.hidden=YES;
}

@end
