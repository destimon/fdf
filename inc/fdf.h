#ifndef FDF_H
# define FDF_H

# include <mlx.h>
# include <stdlib.h>
# include <fcntl.h>
# include <unistd.h>
# include <math.h>
# include "../lib/libft/libft.h"
# include "../lib/libft/get_next_line.h"

# define WHITE 	0xFFFFFF
# define ERR 	-1

typedef	struct 		s_form
{
	void			*mlx;
	void			*win;
}					t_form;

typedef struct 		s_img
{
	void			*ptr;
	int				bits
	int				s_line;
	int				endian;
}					t_img;

int 				draw_pixel(int key, void *param);
int 				draw_line(t_form *form, int x0, int y0, int x1, int y1);
t_form				*create_form(void *mlx_ptr, void *win_ptr);

int					ft_parser(t_form *form, char *name);

int 				exit_x(void);

#endif