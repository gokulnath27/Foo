<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="java.io.*, java.sql.*"%>
<%@page import= "java.util.StringTokenizer" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String [][] numbers = new String [6][2];

File file = new File("/Users/gokul-pt1831/Desktop/anto/gok.csv");

BufferedReader bufRdr = new BufferedReader(new FileReader(file));

String line = null;
int row = 0;
int col = 0;

//read each line of text file

while((line = bufRdr.readLine()) != null && row < 6)
{
StringTokenizer st = new StringTokenizer(line,",");
while (st.hasMoreTokens())
{
//get next token and store it in the array

numbers[row][col] = st.nextToken();
col++;
}
col = 0;
row++;

}

for (int i=0; i<numbers.length; i++)
{
for (int j=0; j<numbers[i].length; j++)
{
System.out.println(numbers[i][j]);
}
System.out.println("-----");
}


%>
</body>
</html>