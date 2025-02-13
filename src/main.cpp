#include <iostream>
#include <SDL2/SDL.h>
#define SDL_FLAGS 0
int main(int argc, char * argv[]) {
	if (SDL_Init(SDL_FLAGS)) {
		std::cout << SDL_GetError();
		return 1;
	}
	SDL_Window * window = SDL_CreateWindow("Hello world",
		SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,
		640,480,0);
	std::cout << "Hello world\n";
	SDL_Delay(2000);
	SDL_DestroyWindow(window);
	SDL_Quit();
	return 0;
}
