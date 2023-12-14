#include "AsteroidFactory.h"
#include "../EntityManager/EntityManager.h"

AsteroidFactory::AsteroidFactory()
{
	CacheAsteroidModels();
}

Asteroid* AsteroidFactory::CreateAsteroid(const std::string& id, int type)
{
	Asteroid* asteroid = new Asteroid();

	switch (type)
	{
	case 0:
		asteroid->CreateInstance(*asteroid1);
		break;

	case 1:
		asteroid->CreateInstance(*asteroid2);
		break;

	case 2:
		asteroid->CreateInstance(*asteroid3);
		break;
	}

	asteroid->tag = id;

	renderer->AddModel(asteroid->model, shader);
	physicsEngine->AddPhysicsObject(asteroid->phyObj);


	EntityManager::GetInstance().AddEntity(id, asteroid);

	return asteroid;
}

void AsteroidFactory::AssignComponents(Renderer* renderer, Shader* shader, PhysicsEngine* physicsEngine)
{
	this->renderer = renderer;
	this->shader = shader;
	this->physicsEngine = physicsEngine;
}

void AsteroidFactory::CacheAsteroidModels()
{
	asteroid1 = new Model("Assets/Models/Asteroids/Asteroid_001.ply");
	asteroid2 = new Model("Assets/Models/Asteroids/Asteroid_007.ply");
	asteroid3 = new Model("Assets/Models/Asteroids/asteroid_group_375084_verts.ply");

	asteroid1->transform.SetScale(glm::vec3(0.001f));
	asteroid2->transform.SetScale(glm::vec3(0.001f));
	asteroid3->transform.SetScale(glm::vec3(0.001f));

	asteroid1->meshes[0]->material->AsMaterial()->SetBaseColor(asteroidColor);
	asteroid2->meshes[0]->material->AsMaterial()->SetBaseColor(asteroidColor);
	asteroid3->meshes[0]->material->AsMaterial()->SetBaseColor(asteroidColor);

}
