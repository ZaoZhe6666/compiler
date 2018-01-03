#include<iostream>
#include<fstream>
#include<string>
#include"error.h"

using namespace std;

#define ERRORNUM 200

char *ErrorList[ERRORNUM]={
//0 正确,占位用字符
"Right",
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
"Illigal character",

//7 8 9占位字符
"","","",

//10 case语句缺少常数,已到达文件结尾
"Missing in case sentense(Reached EOF)",
//11 INT型常量定义中存在非法字符
"Illigal Sym in Const_Define(INT DEFINE)",
//12 INT型常量定义中int后接不为标识符
"Need IDENT in Const_Define(INT DEFINE)",
//13 CHAR型常量定义中赋值不为char型
"Illigal assignment in Const_Define(CHAR DEFINE)",
//14 CHAR型常量定义中存在非法字符
"Illigal Sym in Const_Define(CHAR DEFINE)",
//15 CHAR型常量定义中未赋初值
"Missing INIT in Const_Define(CHAR DEFINE)",
//16 CHAR型常量定义中char后接不为标识符
"Need IDENT in Const_Define(CHAR DEFINE)",
//17 非法的const初值
"Illigal Const Init Num",
//18
"",
//19 过多的加减号
"Too many SUB or PLUS symbol",
//20 过多的关系符
"Too many Relate symbol",
//21 过多的乘除号
"Too many MUL or DIV symbol",
//22 过多的标识符
"Too many IDENT",
//23 过多的数字
"Too many NUMBER",
//24 过多的字符
"Too many CHAR",
//25 缺少算符连接符的左括号
"Missing Calcular Symbol",
//26 项中出现非法字符
"Illigal Sym in Factor",
//27 需要NUMBER的位置出现了正负号与非法字符的组合
"Illigal Sym when need NUMBER(with +/-)",
//28 需要NUMBER的位置出现了非法字符
"Illigal Sym when need NUMBER(without +/-)",
//29 需要乘除号的位置出现了非法字符
"Illigal Sym when need MUL/DIV",
//30 需要NUMBER的位置出现了非法字符
"Illigal Sym when need NUMBER",
//31 数字存在前导零
"Forward Zero",
//32 void函数调用左括号缺失
"Missing Left Parent",
//33 void函数调用,void后不为IDENT或MAIN
"Need IDENT/MAIN(when calling void func)",
//34 由函数定义跳转到的void函数调用左括号缺失
"Missing Left Parent(from var def)",
//35 需要非零数字的地方出现了非数字
"Illigal Sym when need NUMBER(without zero)",
//36 非零数字时读到0
"Illigal Zero when need NUMBER(without zero)",
//37 参数表中,逗号后接右括号
"Missing Para(between ',' and ')')",
//38 参数表中,连续两个参数间无分隔
"Missing ','(between para)",
//39 参数表中出现非法字符
"Illigal Sym in Para Table",
//40 需要加减号的位置出现了非法字符
"Illigal Sym when need PLUS/SUB",
//41 Print语句中右括号缺失
"Missing Right Parent(in Print Sentense)",
//42 程序体中定义函数体类型时读到非法前缀
"Illigal Sym when need INT/CHAR/VOID(init func)",
//43 Read语句中将被赋值标识符不为变量
"Illigal IDENT (Do not Varify in Read Sentense,first var)",
//44 Read语句中逗号后不为标识符
"Illigal Sym when need IDENT(in Read Sentense,after the ',')",
//45 Read语句右括号缺失
"Missing Right Parent(in Read Sentense)",
//46 有返回值函数调用语句缺少左括号
"Missing Left Parent(when calling function with return value)",
//47 Main函数设置了返回值类型
"Main Func Do not need Return Value",
//48 有返回值函数调用语句int/char后不为标识符
"Illigal Sym when need IDENT(in RFunc,after func type int/char')",
//49 由IDENT开头的语句非法,无有效命令
"Illigal Sym after IDENT(in Senten,could not get next order)",
//50 非法的语句开头
"Illigal Sym(The first word in Senten,could not get next order)",
//51 需要字符串的地方出现了非字符串
"Illigal Sym when need STRING",
//52 变量数组定义,中括号中不为无符号整数(一行中至少定义到第2个变量)
"Illigal Sym when need NoSymbol NUMBER(in var array define,not first)",
//53 变量数组定义,右中括号缺失(一行中至少定义到第2个变量)
"Missing Right Brack(in var array define,not first)",
//54 变量定义时,逗号后不为IDENT(一行中至少定义到第2个变量)
"Illigal Sym when need IDENT(not first,in var def,after ',')",
//55 变量定义时,变量后接不合法字符(一行中至少定义到第2个变量)
"Illigal Sym in var def(not first,could not get next order)",
//56 变量数组定义,中括号中不为无符号整数(一行中至少定义到第2个变量)
"Illigal Sym when need NoSymbol NUMBER(in var array define,the first)",
//57 变量数组定义,右中括号缺失(一行中至少定义到第2个变量)
"Missing Right Brack(in var array define,the first)",
//58 变量定义时,逗号后不为IDENT(一行中至少定义到第2个变量)
"Illigal Sym when need IDENT(not first,in var def,after ',')",
//59 由变量定义转到的void函数调用,void后不为IDENT或MAIN
"Need IDENT/MAIN(when calling void func,judt after var def)",

//100 当前读到字符与需求字符不符
"Illigal Input",
//101 当前读到符号已换行，未读到需求字符
"Illigal Input(Reached Next Line)",

//300 常量存在同名常量
"Illigal Const Name(Same Name)",
//301 参数存在同名参数
"Illigal Para Name(Same Name)",
//302 函数调用标识符不为函数
"Illigal Function Calling(IDENT do not func,=f())",
//303 Read语句中变量赋值目标不为变量
"Illigal IDENT (Do not Varify in Read Sentense,after at least one ',')",
//304 数组调用标识符不为数组
"Illigal Array Calling(IDENT do not Array,=[])",
//305 变量赋值语句中目标不为变量
"Illigal IDENT(IDENT do not Var in assign senten)",
//306 变量未定义
"Illigal IDENT(IDENT do not init)",
//307 函数调用标识符不为函数
"Illigal Function Calling(IDENT do not func,f())",
//308 数组赋值语句中标识符不为数组
"Illigal Array Calling(IDENT do not Array,[]=)",

//600 参数过多
"Too much Para",
//601 参数过少
"Too few Para",

//606 数组元素调用时，数组越界
"ARRAY INDEX OUT OF RANGE(when =[])",
//607 给数组元素赋值时，数组越界
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