#include<iostream>
#include<fstream>
#include<string>
#include"error.h"

using namespace std;

#define ERRORNUM 200

char *ErrorList[ERRORNUM]={
//0 ��ȷ,ռλ���ַ�
"Right",
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
"Illigal character",

//7 8 9ռλ�ַ�
"","","",

//10 case���ȱ�ٳ���,�ѵ����ļ���β
"Missing in case sentense(Reached EOF)",
//11 INT�ͳ��������д��ڷǷ��ַ�
"Illigal Sym in Const_Define(INT DEFINE)",
//12 INT�ͳ���������int��Ӳ�Ϊ��ʶ��
"Need IDENT in Const_Define(INT DEFINE)",
//13 CHAR�ͳ��������и�ֵ��Ϊchar��
"Illigal assignment in Const_Define(CHAR DEFINE)",
//14 CHAR�ͳ��������д��ڷǷ��ַ�
"Illigal Sym in Const_Define(CHAR DEFINE)",
//15 CHAR�ͳ���������δ����ֵ
"Missing INIT in Const_Define(CHAR DEFINE)",
//16 CHAR�ͳ���������char��Ӳ�Ϊ��ʶ��
"Need IDENT in Const_Define(CHAR DEFINE)",
//17 �Ƿ���const��ֵ
"Illigal Const Init Num",
//18
"",
//19 ����ļӼ���
"Too many SUB or PLUS symbol",
//20 ����Ĺ�ϵ��
"Too many Relate symbol",
//21 ����ĳ˳���
"Too many MUL or DIV symbol",
//22 ����ı�ʶ��
"Too many IDENT",
//23 ���������
"Too many NUMBER",
//24 ������ַ�
"Too many CHAR",
//25 ȱ��������ӷ���������
"Missing Calcular Symbol",
//26 ���г��ַǷ��ַ�
"Illigal Sym in Factor",
//27 ��ҪNUMBER��λ�ó�������������Ƿ��ַ������
"Illigal Sym when need NUMBER(with +/-)",
//28 ��ҪNUMBER��λ�ó����˷Ƿ��ַ�
"Illigal Sym when need NUMBER(without +/-)",
//29 ��Ҫ�˳��ŵ�λ�ó����˷Ƿ��ַ�
"Illigal Sym when need MUL/DIV",
//30 ��ҪNUMBER��λ�ó����˷Ƿ��ַ�
"Illigal Sym when need NUMBER",
//31 ���ִ���ǰ����
"Forward Zero",
//32 void��������������ȱʧ
"Missing Left Parent",
//33 void��������,void��ΪIDENT��MAIN
"Need IDENT/MAIN(when calling void func)",
//34 �ɺ���������ת����void��������������ȱʧ
"Missing Left Parent(from var def)",
//35 ��Ҫ�������ֵĵط������˷�����
"Illigal Sym when need NUMBER(without zero)",
//36 ��������ʱ����0
"Illigal Zero when need NUMBER(without zero)",
//37 ��������,���ź��������
"Missing Para(between ',' and ')')",
//38 ��������,���������������޷ָ�
"Missing ','(between para)",
//39 �������г��ַǷ��ַ�
"Illigal Sym in Para Table",
//40 ��Ҫ�Ӽ��ŵ�λ�ó����˷Ƿ��ַ�
"Illigal Sym when need PLUS/SUB",
//41 Print�����������ȱʧ
"Missing Right Parent(in Print Sentense)",
//42 �������ж��庯��������ʱ�����Ƿ�ǰ׺
"Illigal Sym when need INT/CHAR/VOID(init func)",
//43 Read����н�����ֵ��ʶ����Ϊ����
"Illigal IDENT (Do not Varify in Read Sentense,first var)",
//44 Read����ж��ź�Ϊ��ʶ��
"Illigal Sym when need IDENT(in Read Sentense,after the ',')",
//45 Read���������ȱʧ
"Missing Right Parent(in Read Sentense)",
//46 �з���ֵ�����������ȱ��������
"Missing Left Parent(when calling function with return value)",
//47 Main���������˷���ֵ����
"Main Func Do not need Return Value",
//48 �з���ֵ�����������int/char��Ϊ��ʶ��
"Illigal Sym when need IDENT(in RFunc,after func type int/char')",
//49 ��IDENT��ͷ�����Ƿ�,����Ч����
"Illigal Sym after IDENT(in Senten,could not get next order)",
//50 �Ƿ�����俪ͷ
"Illigal Sym(The first word in Senten,could not get next order)",
//51 ��Ҫ�ַ����ĵط������˷��ַ���
"Illigal Sym when need STRING",
//52 �������鶨��,�������в�Ϊ�޷�������(һ�������ٶ��嵽��2������)
"Illigal Sym when need NoSymbol NUMBER(in var array define,not first)",
//53 �������鶨��,��������ȱʧ(һ�������ٶ��嵽��2������)
"Missing Right Brack(in var array define,not first)",
//54 ��������ʱ,���ź�ΪIDENT(һ�������ٶ��嵽��2������)
"Illigal Sym when need IDENT(not first,in var def,after ',')",
//55 ��������ʱ,������Ӳ��Ϸ��ַ�(һ�������ٶ��嵽��2������)
"Illigal Sym in var def(not first,could not get next order)",
//56 �������鶨��,�������в�Ϊ�޷�������(һ�������ٶ��嵽��2������)
"Illigal Sym when need NoSymbol NUMBER(in var array define,the first)",
//57 �������鶨��,��������ȱʧ(һ�������ٶ��嵽��2������)
"Missing Right Brack(in var array define,the first)",
//58 ��������ʱ,���ź�ΪIDENT(һ�������ٶ��嵽��2������)
"Illigal Sym when need IDENT(not first,in var def,after ',')",
//59 �ɱ�������ת����void��������,void��ΪIDENT��MAIN
"Need IDENT/MAIN(when calling void func,judt after var def)",

//100 ��ǰ�����ַ��������ַ�����
"Illigal Input",
//101 ��ǰ���������ѻ��У�δ���������ַ�
"Illigal Input(Reached Next Line)",

//300 ��������ͬ������
"Illigal Const Name(Same Name)",
//301 ��������ͬ������
"Illigal Para Name(Same Name)",
//302 �������ñ�ʶ����Ϊ����
"Illigal Function Calling(IDENT do not func,=f())",
//303 Read����б�����ֵĿ�겻Ϊ����
"Illigal IDENT (Do not Varify in Read Sentense,after at least one ',')",
//304 ������ñ�ʶ����Ϊ����
"Illigal Array Calling(IDENT do not Array,=[])",
//305 ������ֵ�����Ŀ�겻Ϊ����
"Illigal IDENT(IDENT do not Var in assign senten)",
//306 ����δ����
"Illigal IDENT(IDENT do not init)",
//307 �������ñ�ʶ����Ϊ����
"Illigal Function Calling(IDENT do not func,f())",
//308 ���鸳ֵ����б�ʶ����Ϊ����
"Illigal Array Calling(IDENT do not Array,[]=)",

//600 ��������
"Too much Para",
//601 ��������
"Too few Para",

//606 ����Ԫ�ص���ʱ������Խ��
"ARRAY INDEX OUT OF RANGE(when =[])",
//607 ������Ԫ�ظ�ֵʱ������Խ��
"ARRAY INDEX OUT OF RANGE(when []=)",
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

//	count++;
//	if(count>10){
//		cin >> count;
//		exit(0);
//	}
//	return;
	/*
	[0,59]		<=>		[0,59]
	[100,101]	<=>		[60,61]
	[300,308]	<=>		[62,70]
	[600,601]	<=>		[71,72]
	[606,607]	<=>		[73,74]
	*/
	if(errorID >=100 && errorID <= 101){
		errorID -= 40;
	}
	else if(errorID >=300 && errorID <= 308){
		errorID -= 238;
	}
	else if(errorID >=600 && errorID <= 601){
		errorID -= 529;
	}
	else if(errorID >=606 && errorID <= 607){
		errorID -= 533;
	}

	cout << "[line: " << line << " column:" << column << "] Error reason:" << ErrorList[errorID] << endl;
	error_log << "[line: " << line << " column:" << column << "] Error reason:" << ErrorList[errorID] << endl;
	return;
}