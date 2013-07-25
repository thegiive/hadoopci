import java.io.IOException;

import org.apache.pig.pigunit.PigTest;
import org.apache.pig.tools.parameters.ParseException;
import org.junit.Test;


public class TestWordDistinctCount {
	@Test
	public void testwordcount() throws IOException, ParseException {

		PigTest test = new PigTest("src/pig/word_distinct_count.pig");

		String[] input = { "yahoo yahoo yahoo facebook facebook twitter",};

		String[] output = { 
				"(3)",
		        };

		test.assertOutput("A", input, "CountGroupWords", output);
	}
}
