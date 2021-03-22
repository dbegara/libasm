/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbegara- <dbegara-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:27:35 by davidbegara       #+#    #+#             */
/*   Updated: 2021/03/22 16:23:03 by dbegara-         ###   ########.fr       */
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

int		ft_list_size(t_list *lst);
t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_sort(t_list **begin_list, int (*cmp)());

int	main(void)
{
	t_list	*list;
	t_list	*list_2;

	list = ft_create_elem("3");
	list_2 = ft_create_elem("1");
	list->next = list_2;
	list_2->next = NULL;
	ft_list_push_front(&list, "2");
	printf("%d\n", ft_list_sort(&list, strcmp));
	printf("List size: %d - First element: %s\n", ft_list_size(list), list->data);
	return (0);
}