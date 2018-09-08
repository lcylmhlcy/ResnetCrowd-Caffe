#coding:utf8

import os;

i = 0
path="/home/computer/LCY/caffe-master/caffe-master/examples/ResnetCrowd/val/no-violence";
filelist=os.listdir(path)#该文件夹下所有的文件（包括文件夹）
for files in filelist:#遍历所有文件
     i=i+1
     Olddir=os.path.join(path,files);#原来的文件路径                
     if os.path.isdir(Olddir):#如果是文件夹则跳过
             continue;
     filename=os.path.splitext(files)[0];#文件名
     filetype=os.path.splitext(files)[1];#文件扩展名
     Newdir=os.path.join(path,str(i)+filetype);#新的文件路径
     os.rename(Olddir,Newdir)#重命名
