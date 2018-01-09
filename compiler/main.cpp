#include<iostream>
#include<string>
#include"yffx.h"
#include"table.h"
#include"error.h"

using namespace std;

Error error;
FT ft;
ST st;
DT dt;
int main(){
	string filename;
	cout << "Please enter the file path of your input:";
	getline(cin,filename);
	YF yf(filename);

	yf.program();
	cout<< "Suceed!"<<endl;
	cin >> filename;
	return 0;
}