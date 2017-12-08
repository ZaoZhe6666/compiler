#include<iostream>
#include<string>
#include"yffx.h"
#include"error.h"

using namespace std;

Error error;
int main(){
	string filename;
	cout << "Please enter the file path of your input:";
	cin >> filename;
	YF yf(filename);

	yf.program();
	cout<< "Suceed!"<<endl;
	cin >> filename;
	return 0;
}