#include "StarWarsApplication.h"

int main(int argc, char* argv[])
{
	Debugger::print = true;

	StarWarsApplication application;

	application.InitializeWindow(1366, 728);

	application.Render();

	return -1;
}