import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.Test;

import java.io.IOException;

import static org.junit.Assert.*;

public class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
    }
   @Karate.Test
   Karate testBasic() {
      return Karate.run("classpath:karate-test.feature");
    }
    @Test
    public void testRunner() throws IOException {
       // ControlsExecutionParallelAgents.featuresSegmentation();

        Results results = Runner.path("src/test/java/personajes")
                .tags("~@ignore", "~@smokeTest", "@PersonajesBTHB-1111").outputCucumberJson(true).parallel(5);

        String karateOutputPath = "build/karate-reports";
       // generateReport(karateOutputPath);
        assertEquals(results.getErrorMessages(), 0, results.getFailCount());
    }
}
