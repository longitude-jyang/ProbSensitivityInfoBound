# An information upper bound for probability sensitivity 
# 1. Introduction 


Consider a function <img src="https://latex.codecogs.com/gif.latex?\inline&space;y=h(x)"/> where the input is uncertain. Probabilistic sensitivity analysis identifies the influential inputs to guide decision makings. Of practical concern is the probability that the output would, or would not, exceed a threshold, and the probability sensitivity depends on this threshold that is often uncertain. We present a mathematical proof that the information theoretical metrics provide upper bound for the probability sensitivity, i.e. 



$$\begin{array}{l}
\\
{\left\|\frac{\partial P_{{\mathrm{f}}} \left(b,z\right)}{\partial b}\right\|}^2 \le {\mathrm{t}\mathrm{r}}\left\lbrace F\left(b\right)\right\rbrace \\
\end{array}$$



where <img src="https://latex.codecogs.com/gif.latex?\inline&space;\mathbf{b}"/> is the parameter of the uncertain inputs and <img src="https://latex.codecogs.com/gif.latex?\inline&space;P_{\textrm{f}}"/> is the failure (or acceptance) probability that depends on the threshold <img src="https://latex.codecogs.com/gif.latex?\inline&space;z"/>. The matrix <img src="https://latex.codecogs.com/gif.latex?\inline&space;\mathbf{F}"/> is the symmetric semi-positive definite Fisher Information Matrix (FIM) . The proof is elementary, relying only on a special version of the Cauchy-Schwarz inequality called Titu’s lemma. The proof presented makes no assumption of the functional form of the probability measure. Nevertheless, in the simple but common case where the probability of interest is simply the (complementary) cumulative distribution function, the bound for the perturbation of the probability by the K-L divergence is found to be a consequence of the well-known Pinsker’s inequality. The details of the mathematical proof can be found in the paper. 




Using the information processing inequality, the sensitivity bound for the probability has been extended to the Fisher information of both the uncertain input and output. The Fisher information of the input is shown as the weaker bound. The extended inequality has been demonstrated with a few numerical examples, where an efficient Monte Carlo based Likelihood Ratio method has been applied for the sensitivity computation. 


# 2. Demonstration examples 
  
## 2.1 Case-1 


Case 1 considers a trivial function <img src="https://latex.codecogs.com/gif.latex?\inline&space;y=x"/>, where the random variables follow the Normal distribution, i.e. <img src="https://latex.codecogs.com/gif.latex?\inline&space;y=x\sim&space;\mathcal{N}(\mu&space;,\sigma^2&space;)"/>


## 2.2 Case-2


Case-2 considers a simple harmonic oscillator (SHO), e.g., a mass on spring or a simple pendulum




![image_0.png](callCases_images/image_0.png)




This is subject to a harmonic driving force, its frequency response function can be described non-dimensionally as 



$$\begin{array}{l}
\\
H={\left\lbrack 1-\beta^2 +i2\zeta \beta \right\rbrack }^{-1} \\
\end{array}$$



where <img src="https://latex.codecogs.com/gif.latex?\inline&space;\beta&space;=\omega&space;/\omega_n"/> is the ratio between the forcing frequency <img src="https://latex.codecogs.com/gif.latex?\inline&space;\omega&space;\;"/>and the natural frequency of the SHO <img src="https://latex.codecogs.com/gif.latex?\inline&space;\omega_n"/>, and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\zeta&space;\;"/> is the non-dimensional viscous damping factor. In this example, both <img src="https://latex.codecogs.com/gif.latex?\inline&space;\beta&space;\;"/> and <img src="https://latex.codecogs.com/gif.latex?\inline&space;\zeta&space;\;"/>are considered to be random and follow the Normal distribution.  


## 2.3 Case-3


Case-3 considers a cantilever beam that is subject to a bandlimited white noise excitation, where only the first three modes are excited, at the middle span position. 




![image_1.png](callCases_images/image_1.png)




In this case, the outputs of interest are the peak r.m.s acceleration and strain responses along the beam, where the r.m.s response, for both acceleration and strain, can be obtained as 



$$\begin{array}{l}
\\
y\left(\xi \right)=\sqrt{\sum 2S\left(\xi ,\omega \right){\mathrm{d}}\omega }\\
\end{array}$$



where <img src="https://latex.codecogs.com/gif.latex?\inline&space;S"/> is the response spectrum. 


# 3. Call_TEDS

```matlab:Code
caseNo = 3
```


```text:Output
caseNo = 3
```


```matlab:Code
[yExLevel,RandV,Opts] = call_case (caseNo); 
[Fraw,PfSen_v_norm,ListPar]   = call_TEDS (Opts,RandV,yExLevel,caseNo);
```


```text:Output
Monte Carlo Analysis Starts: ...
```


![figure_0.png](callCases_images/figure_0.png)


```text:Output
Analysis Completed:103.73[s]
Estimating Fisher: ...
Fisher EigenAnalysis Completed:0.11[s]
```

# 4. Display

```matlab:Code
figName = disp_case (Fraw,PfSen_v_norm,RandV,ListPar,Opts,yExLevel,caseNo)
```


```text:Output
figName = 'cantilever'
```


```matlab:Code
% export figures
isExportFig = 1;
paperPath = 'C:\Users\jy419\OneDrive - University Of Cambridge\Project\1.Working\1.DT-Overview\Papers\Fisher Sensitivity\Covariance sensitivity\figs';
exportFig(isExportFig,paperPath,figName);
```


![figure_1.eps](callCases_images/figure_1.eps)

