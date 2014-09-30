import java.text.SimpleDateFormat;
import java.util.Date;


public class CalendarAndDate {

	public static void main (String [] args) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,S");
		System.out.println(format.format(new Date(System.currentTimeMillis())));
	}

}
