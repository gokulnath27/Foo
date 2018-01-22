import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TryCsv {
	public static void main(String[] args) {
		String pattern = "^[0-1][1-2][- / ]?(0[1-9]|[12][0-9]|3[01])[- /]?(18|19|20|21)\\\\d{2}$";
		String text1 = "12-12-1950";
		String text2 = "12-abc-90";
		
		Pattern r = Pattern.compile(pattern);
		Matcher m1 = r.matcher(text1);
		Matcher m2 = r.matcher(text2);
		
		if (m1.find()) {
			System.out.println("Yes");
		} else System.out.println("No");
	}
}