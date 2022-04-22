/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mouarsas <mouarsas@student.1337.ma>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/15 15:50:54 by mouarsas          #+#    #+#             */
/*   Updated: 2022/03/19 20:06:19 by mouarsas         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include"minitalk_bonus.h"

void	send_char(char c, int pid)
{
	int	i;

	i = 7;
	while (i >= 0)
	{
		kill(pid, (c >> i & 1) + SIGUSR1);
		usleep(400);
		i--;
	}
}

void	sig_handler(int signal)
{
	if (signal == SIGUSR1)
	{
		write(1, "\033[0;33m", 7);
		write(1, "Server: message received\n", 25);
	}
	exit(0);
}

int	main(int argc, char **argv)
{
	int		pid;
	int		i;
	char	*str;

	i = 0;
	if (argc != 3)
	{
		write(1, "\033[0;34m", 7);
		write(1, "not enough arguments\n", 21);
		return (0);
	}
	str = argv[2];
	pid = ft_atoi(argv[1]);
	if (pid <= 0)
		exit(1);
	signal(SIGUSR1, sig_handler);
	while (str[i])
	{
		send_char(str[i], pid);
		i++;
	}
	send_char(0, pid);
}
