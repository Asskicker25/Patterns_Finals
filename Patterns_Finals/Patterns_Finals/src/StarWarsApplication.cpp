#include "StarWarsApplication.h"
#include "Utilities/RendererInstance.h"
#include "EntityManager/EntityManager.h"
#include "Falcon/Falcon.h"


void StarWarsApplication::SetUp()
{
	physicsEngine.fixedStepTime = 0.01f;
	physicsEngine.gravity.y = 0;
	moveSpeed = 1;

	RendererInstance::GetInstance().SetRenderer(&renderer);

	camera->InitializeCamera(PERSPECTIVE, windowWidth, windowHeight, 0.1f, 1000.0f, 65.0f);

	camera->transform.SetPosition(glm::vec3(0, 0, 3));
	camera->transform.SetRotation(glm::vec3(0, 0, 0));

	EntityManager::GetInstance().AddToRendererAndPhysics(&renderer, &defShader, &physicsEngine);

#pragma region Skybox

	skyBox->meshes[0]->material = new SkyBoxMaterial();
	SkyBoxMaterial* skyboxMat = skyBox->meshes[0]->material->AsSkyBoxMaterial();

	skyboxMat->skyBoxTexture->LoadTexture({
		"Assets/Textures/Skybox/Right.jpg",
		"Assets/Textures/Skybox/Left.jpg",
		"Assets/Textures/Skybox/Up.jpg",
		"Assets/Textures/Skybox/Down.jpg",
		"Assets/Textures/Skybox/Front.jpg",
		"Assets/Textures/Skybox/Back.jpg",
		});

#pragma endregion

#pragma region Light

	Model* lightModel = new Model("res/Models/DefaultSphere.fbx", false);
	lightModel->transform.SetScale(glm::vec3(0.01f));
	renderer.AddModel(lightModel, &solidColorShader);

	Light* dirLight = new Light();
	dirLight->InitializeLight(lightModel, Directional);
	dirLight->intensity = 1.5f;
	dirLight->transform->SetRotation(glm::vec3(-30, 180, 0));

	lightManager.AddLight(dirLight);

#pragma endregion

	
	Falcon* falcon = new Falcon();

}

void StarWarsApplication::PreRender()
{
}

void StarWarsApplication::PostRender()
{
}

void StarWarsApplication::ProcessInput(GLFWwindow* window)
{
}

void StarWarsApplication::KeyCallBack(GLFWwindow* window, int& key, int& scancode, int& action, int& mods)
{
}

void StarWarsApplication::MouseButtonCallback(GLFWwindow* window, int& button, int& action, int& mods)
{
}
