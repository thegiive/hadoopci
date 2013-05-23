import java.io.IOException;

import org.apache.pig.pigunit.PigTest;
import org.apache.pig.tools.parameters.ParseException;
import org.junit.Test;

public class TestWordCount {
	@Test
	public void testwordcount() throws IOException, ParseException {

		PigTest test = new PigTest("src/pig/wordcount.pig");

		String[] input = { "yahoo yahoo yahoo facebook facebook twitter",};

		String[] output = { 
				"(yahoo,3)",
		        "(facebook,2)",
		        "(twitter,1)",};

		test.assertOutput("A", input, "WordCountSorted", output);
	}
}
