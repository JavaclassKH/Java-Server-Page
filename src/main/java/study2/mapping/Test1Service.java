package study2.mapping;

import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class Test1Service extends HttpServlet {

	public int hap(int su1, int su2) { return su1 + su2; }
	
	public int cha(int su1, int su2) { return su1 - su2; }
	
	public int gop(int su1, int su2) { return su1 * su2; }
	
	public int mok(int su1, int su2) { return su1 / su2; }
	
}
