package ar.steps;

import api.config.EntityConfiguration;
import ar.validator.ProjectValidator;
import com.crowdar.core.PageSteps;
import cucumber.api.java.en.When;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import services.ProjectService;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class ProjectSteps extends PageSteps {

    ProjectValidator validator = new ProjectValidator();
    @Then("se valida la cantidad de projects")
    public void seValidaLaCantidadDeProjects() {
        validator.validate();
    }

    @Then("^El project con el nombre '(.*)' se encuentra en la lista$")
    public void elProjectConElNombreSeEncuentraEnLaLista(String nombre) {
        validator.validateNombreEsperado(nombre);
    }

    @Then("^se valida el cambio de nombre '(.*)' en el project$")
    public void seValidaElCambioDeNombreNombreEnElProject(String nombre) {
        validator.validarCambioNombreProject(nombre);

    }



    @Given("Un api-key valido")
    public void unApiKeyValido() {
        ProjectService.API_KEY.set("OWY0MzM4YjYtODM2OC00MmRjLTlhZDEtODE3N2M1NzkzMTI4");
    }

    @And("Un workspace ID")
    public void unWorkspaceID() {
        ProjectService.WORK_SPACE.set("6306404cd5efc140a0393f03");
    }
}
