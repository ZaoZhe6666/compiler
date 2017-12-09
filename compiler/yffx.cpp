#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"yffx.h"
#include"error.h"

using namespace std;

YF::YF(string filename){
	cf = new CF(filename);
	st = new ST();
	ft = new FT();
	vt = new VT();
	zj = new ZJ();
	outf.open("out_yf.txt");
	ch=' ';
	line=1;
	curline = 1;
	symID=0;
	parID=0;
	column=1;
	token="";
	pairstack[0] = '\0';
	pstnum = 0;
	count = 0;
}

void YF::getSym(){
	curline = line;
	if(cf->getSymID() != -1){
		token = cf->getSym();
		symID = cf->getSymID();
		while(symID < 0 && symID != -1){
			token = cf->getSym();
			symID = cf->getSymID();
		}
	}
	line = cf->getline();
	column = cf->getcolumn();
}

void YF::p(std::string word){
	outf << "This is a " << word << endl;
}

void YF::error(int errorID){
	extern Error error;
	error.PrintError(errorID,curline,column);
}

void YF::mustread(int sym){
	if(symID == -1){
		return;
	}
	while(symID != sym && line == curline){
		error(-100);
		cout << "Need #"<< sym << "   Have #" << symID <<endl;
		getSym();
	}
	if(symID == sym){
		getSym();
	}
	else{
		error(-101);
		cout<< "Need #"<< sym << endl;
	}
}

void YF::case3sen(){
	p("Son of Case Sentense");
	if(symID == -1){
		return;
	}
	consty();
}

void YF::casesen(){
	p("Case Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	express(0);
	mustread(RPARENTSY);
	mustread(LBRACESY);
	casetab();
	mustread(RBRACESY);
}

void YF::casetab(){
	p("Table of Case");
	if(symID == -1){
		return;
	}
	if(symID == CASESY){
		getSym();
		case3sen();
		mustread(COLONSY);
		senten();
		casetab();
	}
}

int YF::chara(){
	p("Charactor");
	if(symID == -1){
		return 0;
	}
	if(symID != SQUTASY){
		return 0;
	}
	return 1;
}

void YF::condef(int type = 0){
	p("Const Definition");
	if(symID == -1){
		return;
	}
	if(symID == INTSY || type == 1){
		getSym();
		if(symID == IDENTSY){
			std::string const_name;
			const_name = token;
			getSym();
			mustread(ASSIGNSY);
			int num = inty();
			if(num!=0){
				num *= std::stoi(token);
				if(!st->st_push(const_name,0,3,num)){
					error(-300);
				}
				zj->midcode("const",0,num,const_name);
			}
			getSym();
			if(symID == COMMASY){
				condef(1);
			}
			else if(symID == SEMISY){
			}
			else{
				error(-88);
			}
		}
		else{
			error(-57);
		}
	}
	else if(symID == CHARSY || type == 2){
		getSym();
		if(symID == IDENTSY){
			std::string const_name = token;
			getSym();
			if(symID == ASSIGNSY){
				getSym();
				if(!chara()){
					error(-93);
				}
				else{
					if(!st->st_push(const_name,0,4,token[0])){
						error(-300);
					}
					zj->midcode("const",1,token[0],const_name);
				}
				getSym();
				if(symID == COMMASY){
					condef(2);
				}
				else if(symID == SEMISY){
				}
				else{
					error(-87);
				}
			}
			else if(symID == COMMASY){
				condef(2);
			}
			else if(symID == SEMISY){
			}
			else{
				error(-58);
			}
		}
		else{
			error(-59);
		}
	}
}

void YF::condit(int label){
	p("Condition");
	if(symID == -1){
		return;
	}
	int cond = express(0);
	zj->midcode("jmp",cond,0,label);
}

void YF::condsen(){
	p("Condition Sentense");
	if(symID == -1){
		return;
	}
	int label = ++zj->label_num;
	mustread(LPARENTSY);
	condit(label);
	mustread(RPARENTSY);
	senten();
	zj->midcode("label",0,0,label);
}

void YF::conexp(){
	p("Const Expression");
	if(symID == -1){
		return;
	}
	getSym();
	condef();
	mustread(SEMISY);
}

void YF::conplex(){
	p("Conplex Sentense");
	if(symID == -1){
		return;
	}
	while(symID == CONSTSY){
		conexp();
	}
	varexp(3);
	senlist();
}

void YF::consty(){
	p("Const");
	if(symID == -1){
		return;
	}
	if(symID == SQUTASY){
		getSym();
	}
	else if(symID == PLUSSY || symID == SUBSY){
		getSym();
		if(symID == NUMBERSY){
			getSym();
		}
		else{
			error(-98);
		}
	}
	else if(symID == NUMBERSY){
		getSym();
	}
	else{
		error(-99);
	}
}

void YF::evalue(){
	p("Assign Sentense");
	if(symID == -1){
		return;
	}
	express(0);
	mustread(RBRACKSY);
	mustread(ASSIGNSY);
	express(0);
}

int YF::express(int ident = 0){
	p("Express");
//	cout<<"express"<<endl;
	if(symID == -1){
	 	return -1;
	}
	int left = count;
	int right=0;
	int symbol = 1;
	if(ident == 0){
		left = ++count;
		zj->midcode("=",left,0,0);
	}
	if(symID == PLUSSY || symID == SUBSY){
		if(ident > 1){
			error(-41);
		}
		if(symID == SUBSY){
			symbol = 2;
		}
		getSym();
	}
	else if(relate()){
		std::string symb = token;
		getSym();
		right = express();
		zj->midcode(symb,left,0,right);
	}

	if(symID == IDENTSY || symID == NUMBERSY || symID ==SQUTASY
		|| symID == MULTSY || symID == DIVSY || relate() || symID == LPARENTSY){
		right = factor(0);
		zj->midcode("=",left,symbol,right);
		count--;
		right = express(1);
	}
	if(ident == 0){
		count--;
	}
	return left;
}

int YF::factor(int ident = 0){
	p("Factor");
	cout << "factor"<<endl;
	if(symID == -1){
		return -1;
	}
	int left =count;
	int right = 0;
	int symbol = 3;
	cout << left << endl;
	if(ident == 0){
		left = ++count;
		zj->midcode("=",left,0,1);
	}

	if(symID == PLUSSY || symID == SUBSY){
		if(ident == 0){
			error(-43);
		}
		return left;
	}
	else if(relate()){
		if(ident == 0){
			error(-47);
		}
		return left;
	}
	else if(symID == MULTSY || symID == DIVSY){
		if(ident == 0){
			error(-44);
		}
		if(symID == DIVSY){
			symbol = 4;
		}
		getSym();
		ident = 0;
	}

	if(symID == IDENTSY){
		std::string ident_name = token;
		if(ident != 0){
			error(-42);
		}
		getSym();
		if(symID == LPARENTSY){
			int ident_type = ft->ft_conf(ident_name);
			if(!ident_type){
				cout << "error 302 : ident is " << ident_type << endl;
				error(-302);
			}
			getSym();
			zj->midcode("=()",left,0,0);
			cout << "3	T" << left << symbol << " = calling function " << ident_name <<endl;
			rfcall();
			factor(1);
			return left;
		}
		else if(symID == LBRACKSY){
			int ident_type = st->st_seek(ident_name);
			if(ident_type <8 || ident_type >9){
				cout << "error 304 : ident do not shuzu  "<< ident_type << endl;
				error(-304);
			}
			getSym();
			int offset = express();
			zj->midcode("=[]",left,0,0);
			cout << "3	T" << left << symbol << " = " << ident_name << "[ T" << offset << " ]" <<endl;
			mustread(RBRACKSY);
			factor(1);
			return left;
		}
		else{
			int ident_type = st->st_seek(ident_name);
			if(ident_type <6 || ident_type >7){
				cout << "error 306 : ident do not init  "<< ident_type << endl;
				error(-306);
			}
			zj->midcode("=",left,symbol,ident_name);
			factor(1);
			return left;
		}
	}
	else if(symID == NUMBERSY){
		zj->midcode("=",left,symbol,token);
		if(ident != 0){
			error(-45);
		}
		getSym();
		factor(1);
//		cout << "4	T" << left << symbol << "=" << " T" << right <<endl;
		return left;
	}
	else if(symID == SQUTASY){
		zj->midcode("=",left,symbol,token);
		if(ident != 0){
			error(-42);
		}
		getSym();
		factor(1);
		return left;
	}
	else if(symID == LPARENTSY){
		if(ident != 0){
			error(-42);
		}
		getSym();
		right = express();
		zj->midcode("=",left,symbol,right);
		mustread(RPARENTSY);
		factor(1);
		return left;
	}
	else if(symID == RPARENTSY || symID == RBRACKSY){
		return left;
	}
	else if(symID == SEMISY || symID == COMMASY){
		return left;
	}
	else{
		error(-666);
		return left;
	}
}

int YF::inty(){
	p("Int Number");
	if(symID == -1){
		return 0;
	}
	if(symID == PLUSSY || symID == SUBSY){
		int sym = (symID == SUBSY)?-1:1;
		getSym();
		if(symID == NUMBERSY){
			return sym;
		}
		else{
			error(-61);
		}
	}
	else if(symID == NUMBERSY){
		return 1;
	}
	else{
		error(-62);
	}
	return 0;
}

void YF::letter(){
	p("Letter");
	if(symID == -1){
		return;
	}
	getSym();
}

void YF::loopsen(){
	p("Loop Sentense");
	if(symID == -1){
		return;
	}
	int label = ++zj->label_num;
	senten();
	mustread(WHILESY);
	mustread(LPARENTSY);
	condit(label);
	mustread(RPARENTSY);
}

void YF::mfunc(){
	p("Main Function");
	if(symID == -1){
		return;
	}
	getSym();
	mustread(LPARENTSY);
	mustread(RPARENTSY);
	mustread(LBRACESY);
	conplex();
	mustread(RBRACESY);
}

void YF::mult(){
	p("Mult");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != PLUSSY && symID != SUBSY){
		error(-63);
	}
}

void YF::num(){
	p("Number");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != NUMBERSY){
		error(-64);
	}
}

int YF::nfint(){
	p("No Symbol Int Number");
	if(symID == -1){
		return 0;
	}
	if(symID == NUMBERSY){
		if(token.c_str()[0] == 0 && token.length()>1){
			error(-15);
		}
		else{
			return 1;
		}
	}
	return 0;
}

void YF::nrfunc(int ident = 0){
	p("No Return Value Function");
	if(symID == -1){
		return;
	}
	if(ident == 0){
		getSym();
		if(symID == IDENTSY){
			ft->ft_push(token,"");
			st->st_push(token,1,0,0);
			getSym();
			if(symID ==LPARENTSY){
				pairstack[pstnum++] = '(';
			}
			else{
				error(-77);
			}
		}
		else if(symID == MAINSY){
			ft->ft_push(token,"");
			st->st_push(token,1,0,0);
			mfunc();
		}
		else{
			error(-86);
		}
	}
	else{
		getSym();
		if(symID == LPARENTSY){
			pairstack[pstnum++] = '(';
		}
		else{
			error(-27);
		}
	}
	paratab(0);
	getSym();
	mustread(LBRACESY);
	pairstack[pstnum++] = '{';
	conplex();
	mustread(RBRACESY);
	pairstack[--pstnum] = '\0';
}

void YF::nznum(){
	p("Number Without Zero");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != NUMBERSY){
		error(-65);
	}
	else if(int(token.c_str())==0){
		error(-66);
	}
}

void YF::paratab(int com = 0){
	p("Parameter Table");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID == RPARENTSY){
		if(com == 1){
			error(-24);
		}
		pairstack[--pstnum] = '\0';
	}
	else if(symID == INTSY || symID == CHARSY){
		int sym_type = (symID == INTSY)?5:6;
		if(com == 2){
			error(-26);
		}
		getSym();
		if(symID == IDENTSY){
			if(st->st_seek(token)){
				error(-301);
			}
			else{
				ft->ft_add(token);
				st->st_push(token,2,sym_type,0);
			}
			paratab(2);
		}
	}
	else if(symID == COMMASY){
		paratab(1);
	}
	else{
		error(-25);
	}
}

void YF::plus(){
	p("Plus Symbol");
	if(symID == -1){
		return;
	}
	getSym();
	if(symID != PLUSSY || symID != SUBSY){
		error(-67);
	}
}

void YF::printsen(){
	p("Print Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	if(symID == STRINGSY){
		getSym();
		if(symID == COMMASY){
			getSym();
			express();
			mustread(RPARENTSY);
		}
		else{
			if(symID == RPARENTSY){
				getSym();
			}
			else{
				error(-45);
			}
		}
	}
	else{
		express();
		mustread(RPARENTSY);
	}
}

void YF::program(){
	p("Programme");
	if(symID == -1){
		return;
	}
	getSym();
	while(symID == CONSTSY){
		conexp();
	}
	varexp(0);
	while(symID != -1){
		if(symID == CHARSY || symID == INTSY){
			rfunc(symID,0);
			st->st_pop(1);
		}
		else if(symID == VOIDSY){
			nrfunc();
			st->st_pop(1);
		}
		else{
			getSym();
			error(-65);
		}
	}
}

void YF::readsen(){
	p("ReadIn Sentense");
	if(symID == -1){
		return;
	}
	mustread(LPARENTSY);
	mustread(IDENTSY);
	while(symID == COMMASY){
		getSym();
		if(symID == IDENTSY){
			int ident_type = st->st_seek(token);
			if(ident_type <6 || ident_type>7){
				error(-303);
			}
		}
		else{
			error(-43);
		}
	}
	if(symID == RPARENTSY){
		getSym();
	}
	else{
		error(-44);
	}
}

int YF::relate(){
	p("Relate Judge");
	if(symID == -1){
		return 0;
	}
	if(symID != GREATSY && symID !=	LESSSY &&
	   symID != GESY	&& symID !=	LESY &&
	   symID != EQUALSY && symID != NESY){
		return 0;
	}
	return 1;
}

void YF::retsen(){
	p("Return Sentense");
	if(symID == -1){
		return;
	}
	if(symID == LPARENTSY){
		getSym();
		express();
		mustread(RPARENTSY);
	}
}

void YF::rfcall(){
	p("Call Function Have Return Value");
	if(symID == -1){
		return;
	}
	int para;
	para = express();
	cout << "Parameter T" << para<<endl;
	if(symID == COMMASY){
		getSym();
		rfcall();
	}
	else{
		mustread(RPARENTSY);
	}
}

void YF::rfunc(int type,int ident = 0){
	p("Function Have Return Value");
	if(symID == -1){
		return;
	}
	if(ident == 0){
		getSym();
		if(symID == IDENTSY){
			ft->ft_push(token,"");
			int func_type = (type==INTSY)?1:2;
			st->st_push(token,1,func_type,0);
			getSym();
			if(symID == LPARENTSY){
				pairstack[pstnum++] = '(';
			}
			else{
				error(-22);
			}
		}
		else if(symID == MAINSY){
			error(-20);
			ft->ft_push(token,"");
			st->st_push(token,1,0,0);
			mfunc();
			return;
		}
		else{
			error(-21);
		}
	}
	paratab();
	getSym();
	mustread(LBRACESY);
	pairstack[pstnum++] = '{';
	conplex();
	mustread(RBRACESY);
	pairstack[--pstnum] = '\0';
}

void YF::senlist(){
	p("Sentenses List");
	if(symID == -1){
		return;
	}
	if(symID == RBRACESY){
		return;
	}
	else{
		senten();
		senlist();
	}
}

void YF::senten(){
	p("Sentense");
	if(symID == -1){
		return;
	}
	if(symID == IFSY){
		getSym();
		condsen();
	}
	else if(symID == DOSY){
		getSym();
		loopsen();
	}
	else if(symID == SWITCHSY){
		getSym();
		casesen();
	}
	else if(symID == LBRACESY){
		getSym();
		senlist();
		mustread(RBRACESY);
	}
	else if(symID == SCANFSY){
		getSym();
		readsen();
		mustread(SEMISY);
	}
	else if(symID == PRINTFSY){
		getSym();
		printsen();
		mustread(SEMISY);
	}
	else if(symID == RETURNSY){
		getSym();
		retsen();
		mustread(SEMISY);
	}
	else if(symID == SEMISY){
		getSym();
	}
	else if(symID == IDENTSY){
		std::string ident_name = token;
		int ident_type = st->st_seek(token);
		getSym();
		if(symID == LPARENTSY){
			if(!ft->ft_conf(ident_name)){
				cout << "error 306 : "<< ident_type <<endl;
				error(-306);
			}
			getSym();
			rfcall();
			mustread(SEMISY);
		}
		else if(symID == ASSIGNSY){
			if(ident_type <6 || ident_type>7){
				cout << "error 305 ident is not var : " << ident_type << endl;
				error(-305);
			}
			getSym();
			int value = express();
			zj->midcode("=",value,-1,ident_name);
			mustread(SEMISY);
		}
		else if(symID == LBRACKSY){
			if(ident_type < 8 || ident_type >9){
				error(-306);
			}
			getSym();
			evalue();
		}
		else{
			error(-96);
		}
	}
	else if(symID == -1){
		
	}
	else{
		error(-40);
		getSym();
	}
}

void YF::strin(){
	p("String");
	if(symID == -1){
		return;
	}
	getSym(); 
	if(symID != STRINGSY){
		error(-69);
	}
}

void YF::term(){
	p("Term");
	if(symID == -1){
		return;
	}
	factor();
}

void YF::vardef(int type,int level,int ident = 0){
	p("Variable Definition");
	if(symID == -1){
		return;
	}
	if(symID == COMMASY){
		getSym();
		if(symID == IDENTSY){
			int var_type = (type == INTSY)?5:6;
			std::string var_name = token;
			st->st_push(var_name,level,var_type,0);
			getSym();
			if(symID == LBRACKSY){

				getSym();
				if(nfint()){
					int num = std::stoi(token);
					st->st_change(num);
				}
				getSym();
				if(symID == RBRACKSY){
					getSym();
				}
				else{
					error(-16);
				}
				vardef(type,level,1);
			}
			else{			
				zj->midcode("var",level,var_type,var_name);
			}
		}
		else{
			error(-10);
		}
	}
	else if(symID == SEMISY){
		getSym();
		varexp(level);
	}
	/*
	else if(symID == ASSIGNSY){
		if(type == INTSY){
			getSym();
			if(symID == NUMBERSY){
				getSym();
			}
			else{
				error(-13);
			}
			vardef(type,level,1);
		}
		else if(type == CHARSY){
			getSym();
			if(symID == SQUTASY){
				getSym();
			}
			else{
				error(-15);
			}
			vardef(type,level,1);
		}
	}
	*/
	else{
		error(-14);
	}
}

void YF::varexp(int level){
	p("Variable Expression");
	if(symID == -1){
		return;
	}
	if(symID == INTSY || symID == CHARSY){
		int type = symID;
		getSym();
		if(symID == IDENTSY){
			std::string var_name = token;
			getSym();
			if(symID == LPARENTSY){
				pairstack[pstnum++] = '(';
				ft->ft_push(var_name,"");
				rfunc(type,1);
				st->st_pop(1);
			}
			else{
				int var_type = (type == INTSY)?5:6;
				st->st_push(var_name,level,var_type,0);
				vardef(type,level,0);
			}
		}
		else{
			error(-17);
		}
	}
	else if(symID == VOIDSY){
		getSym();
		if(symID == IDENTSY){
			ft->ft_push(token,"");
			st->st_push(token,1,0,0);
			nrfunc(1);
			st->st_pop(1);
		}
		else if(symID == MAINSY){
			ft->ft_push(token,"");
			st->st_push(token,1,0,0);
			mfunc();
			st->st_pop(1);
		}
		else{
			error(-19);
		}
	}
	else{
	}
}