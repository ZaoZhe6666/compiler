#include<iostream>
#include<fstream>
#include<string>
#include"error.h"

using namespace std;

#define ERRORNUM 20

char *ErrorList[ERRORNUM]={"Right",
//1 !���ɵ�������
"! should not appear without =",
//2 ��ʶ�����������ֻ��»��߿�ͷ
"Ident must begin with word a~z",
//3 �ַ�����Ϊ���ַ�
"Char shoule be single char",
//4 �ַ�����ֻ��Ϊ�涨ASCLL�뷶Χ���ַ�
"Char should be in the table",
//5 �Ҳ�˫����ȱʧ
"\" is missing",
//6 �Ƿ��ַ�
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