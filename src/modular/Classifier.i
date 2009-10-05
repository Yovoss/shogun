/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 2009 Soeren Sonnenburg
 * Copyright (C) 2009 Fraunhofer Institute FIRST and Max-Planck-Society
 */

%define DOCSTR
"The `Classifier` module gathers all classifiers available in the SHOGUN toolkit."
%enddef

%module(docstring=DOCSTR) Classifier

/* Documentation */
%feature("autodoc","0");

#ifdef HAVE_DOXYGEN
%include "Classifier_doxygen.i"
#endif

#ifdef HAVE_PYTHON
%feature("autodoc", "get_w(self) -> [] of float") get_w;
%feature("autodoc", "get_support_vectors(self) -> [] of int") get_support_vectors;
%feature("autodoc", "get_alphas(self) -> [] of float") get_alphas;
#endif

/* Include Module Definitions */
%include "SGBase.i"
%{
 #include <shogun/features/Labels.h>
 #include <shogun/classifier/Classifier.h>
 #include <shogun/classifier/svm/GMNPSVM.h>
 #include <shogun/classifier/svm/GNPPSVM.h>
 #include <shogun/classifier/svm/GPBTSVM.h>
 #include <shogun/classifier/KernelPerceptron.h> 
 #include <shogun/classifier/DistanceMachine.h>
 #include <shogun/classifier/KNN.h>
 #include <shogun/classifier/LDA.h>
 #include <shogun/classifier/svm/LibLinear.h>
 #include <shogun/classifier/svm/MCSVM.h>
 #include <shogun/classifier/svm/LibSVM.h>
 #include <shogun/classifier/svm/LibSVMMultiClass.h>
 #include <shogun/classifier/svm/LibSVMOneClass.h>
 #include <shogun/classifier/LinearClassifier.h> 
 #include <shogun/classifier/LPBoost.h> 
 #include <shogun/classifier/LPM.h>
 #include <shogun/classifier/svm/MPDSVM.h>
 #include <shogun/classifier/svm/MultiClassSVM.h>
 #include <shogun/classifier/Perceptron.h> 
 #include <shogun/classifier/SubGradientLPM.h>
 #include <shogun/classifier/svm/SubGradientSVM.h>
 #include <shogun/classifier/svm/SVM.h>
 #include <shogun/classifier/svm/SVMLin.h>
 #include <shogun/classifier/Classifier.h>
 #include <shogun/classifier/KernelMachine.h>
 #include <shogun/classifier/svm/SVMOcas.h>
 #include <shogun/classifier/svm/SVMSGD.h>
 #include <shogun/classifier/svm/WDSVMOcas.h>
 #include <shogun/classifier/PluginEstimate.h> 
 #include <shogun/classifier/mkl/MKL.h>
 #include <shogun/classifier/mkl/MKLClassification.h>
 #include <shogun/classifier/mkl/MKLOneClass.h>
#ifdef USE_SVMLIGHT
 #include <shogun/classifier/svm/SVM_light.h>
#endif //USE_SVMLIGHT
%}

/* Typemaps */
%apply (float64_t** ARGOUT1, int32_t* DIM1) {(float64_t** dst_w, int32_t* dst_dims)};
%apply (float64_t* IN_ARRAY1, int32_t DIM1) {(float64_t* src_w, int32_t src_w_dim)};
%apply (int32_t** ARGOUT1, int32_t* DIM1) {(int32_t** svs, int32_t* num)};
%apply (float64_t** ARGOUT1, int32_t* DIM1) {(float64_t** alphas, int32_t* d1)};
%apply (float64_t* IN_ARRAY1, int32_t DIM1) {(float64_t* alphas, int32_t d)};
%apply (int32_t* IN_ARRAY1, int32_t DIM1) {(int32_t* svs, int32_t d)};
%apply (float64_t* IN_ARRAY1, int32_t DIM1) {(float64_t* lterm, int32_t num)};


/* Remove C Prefix */
%rename(Classifier) CClassifier;
%rename(GMNPSVM) CGMNPSVM;
%rename(GNPPSVM) CGNPPSVM;
%rename(GPBTSVM) CGPBTSVM;
%rename(KernelPerceptron) CKernelPerceptron;
%rename(KNN) CKNN;
%rename(LDA) CLDA;
%rename(LibLinear) CLibLinear;
%rename(MCSVM) CMCSVM;
%rename(LibSVM) CLibSVM;
%rename(LibSVMMultiClass) CLibSVMMultiClass;
%rename(LibSVMOneClass) CLibSVMOneClass;
%rename(LinearClassifier) CLinearClassifier;
%rename(LPBoost) CLPBoost;
%rename(LPM) CLPM;
%rename(MPDSVM) CMPDSVM;
%rename(MultiClassSVM) CMultiClassSVM;
%rename(Perceptron) CPerceptron;
%rename(SubGradientLPM) CSubGradientLPM;
%rename(SubGradientSVM) CSubGradientSVM;
#ifndef HAVE_PYTHON
%rename(SVM) CSVM;
#endif
%rename(SVMLin) CSVMLin;
%rename(SVMOcas) CSVMOcas;
%rename(SVMSGD) CSVMSGD;
%rename(WDSVMOcas) CWDSVMOcas;
%rename(PluginEstimate) CPluginEstimate;
%rename(MKL) CMKL;
%rename(MKLClassification) CMKLClassification;
%rename(MKLOneClass) CMKLOneClass;
#ifdef USE_SVMLIGHT
%rename(SVMLight) CSVMLight;
#endif //USE_SVMLIGHT

/* These functions return new Objects */
%newobject classify;
%newobject CClassifier::classify(CLabels* output);

/* Include Class Headers to make them visible from within the target language */
%include <shogun/classifier/Classifier.h>
%include <shogun/classifier/KernelMachine.h>
%include <shogun/classifier/DistanceMachine.h>
%include <shogun/classifier/svm/SVM.h>
%include <shogun/classifier/svm/MultiClassSVM.h>
%include <shogun/classifier/LinearClassifier.h> 
%include <shogun/classifier/svm/GMNPSVM.h>
%include <shogun/classifier/svm/GNPPSVM.h>
%include <shogun/classifier/svm/GPBTSVM.h>
%include <shogun/classifier/KernelPerceptron.h> 
%include <shogun/classifier/KNN.h>
%include <shogun/classifier/LDA.h>
%include <shogun/classifier/svm/LibLinear.h>
%include <shogun/classifier/svm/MCSVM.h>
%include <shogun/classifier/svm/LibSVM.h>
%include <shogun/classifier/svm/LibSVMMultiClass.h>
%include <shogun/classifier/svm/LibSVMOneClass.h>
%include <shogun/classifier/LPBoost.h> 
%include <shogun/classifier/LPM.h>
%include <shogun/classifier/svm/MPDSVM.h>
%include <shogun/classifier/Perceptron.h> 
%include <shogun/classifier/SubGradientLPM.h>
%include <shogun/classifier/svm/SubGradientSVM.h>
%include <shogun/classifier/svm/SVMLin.h>
%include <shogun/classifier/svm/SVMOcas.h>
%include <shogun/classifier/svm/SVMSGD.h>
%include <shogun/classifier/svm/WDSVMOcas.h>
%include <shogun/classifier/PluginEstimate.h> 
%include <shogun/classifier/mkl/MKL.h>
%include <shogun/classifier/mkl/MKLClassification.h>
%include <shogun/classifier/mkl/MKLOneClass.h>

#ifdef HAVE_PYTHON
%pythoncode %{
  class SVM(CSVM):
      def __init__(self, kernel, alphas, support_vectors, b):
          assert(len(alphas)==len(support_vectors))
          num_sv=len(alphas)
          CSVM.__init__(self, num_sv)
          self.set_alphas(alphas)
          self.set_support_vectors(support_vectors)
          self.set_kernel(kernel)
          self.set_bias(b)
%}
#endif //HAVE_PYTHON


#ifdef USE_SVMLIGHT

%ignore VERSION;
%ignore VERSION_DATE;
%ignore MAXSHRINK;
%ignore SHRINK_STATE;
%ignore MODEL;
%ignore LEARN_PARM;
%ignore TIMING;

%include <shogun/classifier/svm/SVM_light.h>
#endif //USE_SVMLIGHT
