import os
import sys
import numpy as np
import matplotlib.pyplot as plt

caffe_root = '/home/computer/LCY/caffe-master/caffe-master'
sys.path.insert(0,caffe_root+'python')

import caffe

MODEL_FILE = '/home/computer/LCY/caffe-master/caffe-master/examples/ResnetCrowd/resnetcrowd_deploy.prototxt'
PRETRAINED = '/home/computer/LCY/caffe-master/caffe-master/examples/ResnetCrowd/rescrowd_iter_5000.caffemodel'
IMAGE_FILE = '/home/computer/LCY/caffe-master/caffe-master/examples/ResnetCrowd/images/detect_3.jpg'

input_image = caffe.io.load_image(IMAGE_FILE,color=False)
print(input_image)

net = caffe.Classifier(MODEL_FILE,PRETRAINED)
prediction = net.predict([input_image],oversample=False)
caffe.set_mode_gpu()
print 'predicted class:',prediction[0].argmax()
