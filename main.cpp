#include <sys/epoll.h>
#include <unistd.h>
#include <iostream>

int main()
{
	int epollFd = epoll_create1(0);

	if (epollFd == -1)
	{
		std::cout << "Error: failed to open an epoll file descriptor" << std::endl;
		return EXIT_FAILURE;
	}

	bool exit = false;
	while (!exit)
	{
		std::cout << "waiting..." << std::endl;
		sleep(1);  // Set breakpoint here!
	}

	return close(epollFd);
}