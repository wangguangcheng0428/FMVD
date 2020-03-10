clc;
clear all;
%load CASIA_test.mat
for cnt=1:1:400
    cnt
    imageName1=strcat(num2str(cnt),'.avi');   
    %imageName2=strcat('F:\smad_2020_1_10\SMAD_MTCNN\SPOOF\',imageName1);
    imageName2=strcat('C:\Users\user\Desktop\TIE_CODE\FMVD\',imageName1);
    xyloObj = VideoReader(imageName2);
    %��ȡ��Ƶ��Ϣ��֡�����߶ȣ���ȣ�
    nFrames = xyloObj.NumberOfFrames;
    vidHeight = xyloObj.Height;
    vidWidth = xyloObj.Width;
    % ���������һ��2ά����double���͵�
    data1=rand(vidHeight, vidWidth);
    %����ʹ��zeros����,�ȽϽ�ʡ�ڴ棺 data=zeros(vidHeight, vidWidth,'uint8');
    % ��ȡ��k֡��ת��Ϊ�Ҷ�ͼ����չΪ��ά����
    feat1=[];
    for k = 1:20
        imgdata=read(xyloObj,k);
        imgdata=double(rgb2gray(imgdata));
        feature=vsfm_feature(imgdata);
        feat1=[feat1 feature];
    end
   %spoof111_updated_SLBP_SMAD_6(cnt,:)=feat1;
   smad_vsfm_feature(cnt,:)=feat1;
end