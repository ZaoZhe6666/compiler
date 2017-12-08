#pragma once

#include<iostream>
#include<fstream>
#include<string>
#include"metaphysics.h"
#include"error.h"

enum mem{
	//Error Deal
	ERROR3 = -3,	ERROR2 = -2,	ERROR1 = -1,
	//const		int			char
	CONSTSY,	INTSY,		CHARSY,
	//void		main		do
	VOIDSY,		MAINSY,		DOSY,
	//while		switch		case		if
	WHILESY,	SWITCHSY,	CASESY,		IFSY,
	//scanf		printf		return
	SCANFSY,	PRINTFSY,	RETURNSY,
	//+			-			*
	PLUSSY,		SUBSY,		MULTSY,
	//div		>			<
	DIVSY,		GREATSY,	LESSSY,
	//>=		<=			==
	GESY,		LESY,		EQUALSY,
	//!=		,			;
	NESY,		COMMASY,	SEMISY,
	//=			'			"
	ASSIGNSY,	SQUTASY,	DQUTASY,
	//:			number		string
	COLONSY,	NUMBERSY,	STRINGSY,
	//(			)			[
	LPARENTSY,	RPARENTSY,	LBRACKSY,
	//]			{			}
	RBRACKSY,	LBRACESY,	RBRACESY,
	//ident
	IDENTSY
};

class CF{
	private:
		std::ifstream inf;
		std::ofstream outf;
		char ch;
		int line_num,column_num,line_point,symID;
		std::string token;
	public:
		CF(std::string filename);
		int cutword(char c);
		bool isspace();
		bool ischar();
		bool isascll();
		std::string getSym();
		void getchar_cf();
		int getSymID();
		int getline();
		int getcolumn();
};