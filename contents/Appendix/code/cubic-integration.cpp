#include <iostream>
#include <cmath>
#include <Eigen/Sparse>
#include <Eigen/SparseLU>

double CubicInt(Eigen::VectorXd xvar, Eigen::VectorXd yvar, double xstep){
	// 获取二阶导
	Eigen::VectorXd ypprime = getSectodDerivative(xvar, yvar, xstep);

	int dim = xvar.rows();  // 获取离散坐标的数量
	
	double sumyvar = 0;
	double sumypprime = 0;
	
	sumyvar = yvar[0] + y[dim - 1];             // 累加$y_0$和$y_n$
	sumypprime = ypprime[0] + ypprime[dim - 1]; // 累加$M_0$和$M_n$
	for(int i = 1; i < dim - 1; i++){
		sumyvar += 2. * yvar(i);                // 累加2 * y_i
		sumypprime += 2. * ypprime(i);          // 累加2 * M_i
	}

	double intvalue;
	int value = sumyvar * xstep * 0.5 - sumypprime * pow(xstep, 3) / 24.;
}
