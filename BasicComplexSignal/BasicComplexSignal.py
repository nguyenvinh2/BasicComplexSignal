import numpy
import scipy
import os

numpy.set_printoptions(threshold=numpy.nan)
setPath = '../assets/assignment-01-2017.dat'

def computeSignal(setPath):
  dir = os.path.dirname(__file__)
  filename = os.path.join(dir, setPath)
  dataComplex = numpy.fromfile(filename, dtype='int16').reshape(2048,2)
  size = dataComplex.shape
  print(dataComplex)
  print(size)
  return;

computeSignal(setPath)