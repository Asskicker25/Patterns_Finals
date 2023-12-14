#include "Fighter.h"

Fighter::Fighter()
{
	model = new Model();
	phyObj = new PhysicsObject();
}

void Fighter::CreateInstance(Model& model)
{
	this->model->CopyFromModel(model);
	phyObj->Initialize(this->model, SPHERE, DYNAMIC, TRIGGER, true);
	phyObj->userData = this;
}

void Fighter::Start()
{
}

void Fighter::Update(float deltaTime)
{
}

void Fighter::AddToRendererAndPhysics(Renderer* renderer, Shader* shader, PhysicsEngine* physicsEngine)
{
}

void Fighter::RemoveFromRendererAndPhysics(Renderer* renderer, PhysicsEngine* physicsEngine)
{
}

Transform* Fighter::GetTransform()
{
	return &model->transform;
}
