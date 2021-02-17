/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbegara- <dbegara-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:27:35 by davidbegara       #+#    #+#             */
/*   Updated: 2021/02/17 19:36:32 by dbegara-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int	ft_atoi_base(char *str, char *str2);
int	ft_isspace(char c);

int	main(void)
{

	printf("%d, %d \n", ft_isspace(' '),ft_atoi_base("4ef", "0123456789abcdef"));
	return (0);
}