import numpy
import scipy
import matplotlib.pyplot as plt
import os

numpy.set_printoptions(threshold=numpy.nan)
setPath = '../assets/sample_data.dat'

def computeSignal(setPath):
  dir = os.path.dirname(__file__)
  filename = os.path.join(dir, setPath)
  dataComplex = numpy.fromfile(filename, dtype='int16')
  dataComplex = 1.0*dataComplex[::2]+1.0j*dataComplex[1::2]
  dataStrength = numpy.square(numpy.abs(dataComplex))
  dataReshape = numpy.reshape(dataStrength, (16,128))
  dataSize = numpy.size(dataReshape)
  dataMean = numpy.mean(dataReshape,axis=0)
  print(dataSize)
  plt.plot(dataMean)
  plt.title('Signal Strength of Returning Objects')
  plt.xlabel('Range: x150m')
  plt.ylabel('Signal Strength')
  plt.show()
  return;

computeSignal(setPath)