import java.io.IOException;

import org.apache.pig.pigunit.PigTest;
import org.apache.pig.tools.parameters.ParseException;
import org.junit.Test;


public class TestRowCount {
	@Test
	public void testwordcount() throws IOException, ParseException {

		PigTest test = new PigTest("src/pig/rowcount.pig");

		String[] input = { "yahoo yahoo yahoo facebook facebook twitter", "yahoo yahoo yahoo facebook facebook twitter"};

		String[] output = { 
				"(2)",
		        };

		test.assertOutput("LOGS", input, "LOG_COUNT", output);
	}
}
