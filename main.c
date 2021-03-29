/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbegara- <dbegara-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/15 14:27:35 by davidbegara       #+#    #+#             */
/*   Updated: 2021/03/29 18:52:00 by dbegara-         ###   ########.fr       */
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

//ssize_t	ft_write(int __fd, const void *__buf, size_t __nbyte);
int		ft_list_size(t_list *lst);
t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove(t_list **elem, void (*free_ftc)());
void	ft_list_remove_if(t_list **elem, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int	main(void)
{
	//ft_write(1, "Hola", 4);
	t_list	*list;
	t_list	*list_2;

	list = ft_create_elem(strdup("2"));
	list_2 = ft_create_elem(strdup("1"));
	list->next = list_2;
	list_2->next = NULL;
	ft_list_push_front(&list, strdup("3"));
	ft_list_sort(&list, strcmp);
	//ft_list_remove(&(list->next), free);
	ft_list_remove_if(&list, "1", strcmp, free);
	printf("List size: %d - First element: %s\n", ft_list_size(list), list->next->next);
	return (0);
}