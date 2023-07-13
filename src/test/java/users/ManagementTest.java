package users;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ManagementTest {

    @Test
    void testParallel(){
        // con la siguiente linea se pueden ejecutar los escenarios planteados en los users en paralelo y el tag estoy especificando que
        // se ignore los escenarios con esa etiqueta @ignore
        // el 4 (hilos) es para indicar cuantos escenarios se van a ejecutar al mismo tiempo
        //con el archivo (logback-test) creado en la ruta src/test/java/logback.test.xml podemos omitir lineas de ejecución la consola
        //outputCucumberJson(true) lo que hace es que se le envia esa variable results al metodo generateReport(results.getReportDir());
        Results results = Runner.path("classpath:users").outputCucumberJson(true).tags("~@ignore").parallel(4);
        generateReport(results.getReportDir());

    }

    // generar reportes a partir de cucumber
    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "curso_karate");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
