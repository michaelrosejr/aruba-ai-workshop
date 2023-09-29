
import cv2
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model  # type: ignore

# gpus = tf.config.experimental.list_physical_devices('GPU')
# for gpu in gpus:
#   tf.config.experimental.set_memory_growth(gpu, True)

gpu_number = 0

img = cv2.imread('test_images/test_switch-1.png')
resize = tf.image.resize(img, (256, 256))

with tf.device(f'/GPU:{gpu_number}'):
    model = load_model('models/imageclassifier.keras')
    model_array = model.predict(np.expand_dims(resize/255, 0))  # type: ignore
    # print(model_array)
    
    yhat = model.predict(np.expand_dims(resize/255, 0))  # type: ignore

if yhat > 0.5:
    print('## The predicted class of image is a: <span style="color: #14B326">Switch</span>')
else:
    print('## The predicted class of image is an: <span style="color: #14B326">Access Point</span>')


