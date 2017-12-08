#include<iostream>
#include<fstream>
#include<string>
#include"error.h"

using namespace std;

#define ERRORNUM 20

char *ErrorList[ERRORNUM]={"Right",
//1 !不可单独出现
"! should not appear without =",
//2 标识符不可以数字或下划线开头
"Ident must begin with word a~z",
//3 字符变量为单字符
"Char shoule be single char",
//4 字符变量只可为规定ASCLL码范围内字符
"Char should be in the table",
//5 右侧双引号缺失
"\" is missing",
//6 非法字符
"Illigal character"
};
int count=0;
Error::Error(){
	error_log.open("Error_log.txt");
}

void Error::PrintError(int errorID,int line,int column){
	if(errorID >= 0){
		cout << "Illegal errorID in error.cpp :" << errorID << " line: " << line << " column:" << column << endl;
		error_log << "Illegal errorID in error.cpp :" << errorID << " line: " << line << " column:" << column << endl;
		return;
	}
	errorID *= -1;
	error_log << "[line: " << line << " column:" << column << "] Error reason: #" << errorID << endl;
	cout << "[line: " << line << " column:" << column << "] Error reason: #" << errorID << endl;
	count++;
	if(count>10){
		cin >> count;
		exit(0);
	}
	return;
	cout << "[line: " << line << " column:" << column << "] Error reason:" << ErrorList[errorID] << endl;
	error_log << "[line: " << line << " column:" << column << "] Error reason:" << ErrorList[errorID] << endl;
	return;
}