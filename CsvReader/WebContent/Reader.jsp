<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import= "java.util.regex.Matcher" %>
<%@ page import=" java.util.regex.Pattern" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String fname = "/Users/gokul-pt1831/Desktop/anto/gok.csv";
String thisLine="";
FileInputStream stream = new FileInputStream(fname);
DataInputStream Dstream = new DataInputStream(stream);
int i=0; 
%>
<table>
<%
int row=0,column=0,k=0;

while ((thisLine = Dstream.readLine()) != null)
{
	row++;
	int flag=0;
String csv[] = thisLine.split(",");
column=0;
for(int j=0;j<csv.length;j++)
{
	flag=0;
	column++;
if(i!=0)
{
//out.print(" " +csv[j]+ " ");
}
else
{
//out.print(" <b>" +csv[j]+ "</b> ");
}
if(flag==0)
try{
	
	Integer.parseInt(csv[j]);
	out.println(" integer:"+csv[j]);
	flag=1;
}

catch(Exception e)
{
flag=0;
} 
if(flag==0)
try{
	String pattern = "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";
	
	
	Pattern r = Pattern.compile(pattern);
	Matcher m1 = r.matcher(csv[j]);
	//Matcher m2 = r.matcher(text2);
	
	if (m1.find()) {
		out.println(" date:"+csv[j]+" ");
		flag=1;
	}
}
catch(Exception e){
	flag=0;
}
if(flag==0)
try{
	Double.parseDouble(csv[j]);
	out.println(" double:"+csv[j]+" ");
	flag=1;
}
catch(Exception e){
	flag=0;
}
if(flag==0)
try{
	String pattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
	
	
	Pattern r = Pattern.compile(pattern);
	Matcher m1 = r.matcher(csv[j]);
	//Matcher m2 = r.matcher(text2);
	
	if (m1.find()) {
		out.println(" email:"+csv[j]+" ");
		flag=1;
	}
}
catch(Exception e)
{
	flag=0;
}

if(flag!=1){
	out.println(" string:"+csv[j]+" ");
}

}


if(column>k){
	k=column;
}
out.println("<br>");
i++;
} 
out.println("*****"+k+"********");
out.println("**********"+row+"******");
%>
</table>
</body>
</html>