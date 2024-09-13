#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include <string.h>

char     *ft_strdup(const char *s);  
char     *ft_strcpy(char *dest, char *src);
size_t   ft_strlen(const char  * str);
size_t   ft_read(int fd, void *buf, int len);
size_t   ft_write(int fd, void *buf, int len);
int      ft_strcmp(const char *s1, const char*s2);

int test_strcpy(char *src, char *dest) {
    ft_strcpy(src, dest);
    printf("Test strcpy----------------------\n");
    printf("Source:      [%s]\n", src);
    printf("Destination: [%s]\n", dest);
    return 0;
} 

int test_strlen(char * str) {
    printf("Test strlen----------------------\n");
    printf("Src Len %ld \n", ft_strlen(str));
}

void test_strcmp() {
    printf("\nTest strcmp----------------------\n");
    char s1[15] = "Bonjour\0";
    char s2[15] = "Bonjour\0";
    printf("s1 =[%s]  s2=[%s]   ret[%d] \n" , s1 , s2, ft_strcmp(s1, s2));
    strcpy(s2, "Bonjouq\0");    
    printf("s1 =[%s]  s2=[%s]   ret[%d] \n" , s1 , s2, ft_strcmp(s1, s2));
    strcpy(s2, "Bonjous\0"); 
    printf("s1 =[%s]  s2=[%s]   ret[%d] \n" , s1 , s2, ft_strcmp(s1, s2));
    printf("Test strcmp----------------------\n");
}

int main() {
    char src[50] = "Test string Source \0";
    char dst[50] = "TestStringDestination\0";
    printf("ret strcpy[%s]\ndest:[%s]\nsrc :[%s]\n" ,ft_strcpy(src, dst), dst, src);
    char *dup = ft_strdup(src);
    if (dup != NULL) {
        test_strcpy(src, dup);
        test_strlen(dup);
        test_strcmp();
        free(dup);
        printf("%p\n", dup);
        dup=NULL;
        printf("%s", dup);
        free(dup);
        printf("%ld",      ft_write(1,"yolo\n",5));
    } else {
        printf("Dup Fail\n");
    }
    return 0;
}