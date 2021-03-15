/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbegara- <dbegara-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:27:35 by davidbegara       #+#    #+#             */
/*   Updated: 2021/03/15 20:23:30 by dbegara-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int		ft_lst_size(t_list *lst);
t_list	*ft_create_elem(void *data);
void	ft_lst_push_front(t_list **begin_list, void *data);

int	main(void)
{
	t_list	*list;
	t_list	*list_2;

	list = ft_create_elem("2");
	list_2 = ft_create_elem("3");
	list->next = list_2;
	list_2->next = NULL;
	ft_lst_push_front(&list, "1");
	
	
	printf("List size: %d - First element: %s\n", ft_lst_size(list), list->data);
	return (0);
}