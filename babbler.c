#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

char * readfile(char *filename) {
  // get the sizze of the file
  struct stat info;
  int status = stat(filename, &info);
  if (status < 0) {
    perror("stat error");
    exit(1);
  }

  // get a buffer of the appropriate size
  int size = (int) info.st_size;
  char *buffer = malloc(size + 1);
  if (buffer == NULL) {
    //fprintf(stderr, "malloc error\n");
    perror("malloc error");
    exit(1);
  }

  // open the file
  int fd = open(filename, O_RDONLY);
  if (fd < 0) {
    perror("open error");
    exit(1);
  }

  // read the entire file
  char *ptr = buffer;
  int left = size;
  while (left > 0) {
    int chunk = read(fd, ptr, left);
    if (chunk < 0) {
      perror("read error");
      exit(1);
    } else if (chunk == 0) {
      fprintf(stderr, "ran out of data \n");
      exit(1);
    }
    left -= chunk;
    ptr += chunk;
  }

  // terminate the string with a null
  *ptr = 0;

  // close the file
  status = close(fd);
  if (status < 0) {
    perror("close error");
    exit(1);
  }

  return buffer;
}

int tokenize(lua_State *L) {
  return 1;
}

int readFile(lua_State *L) {
}

int parse(lua_State *L) {
}

int main(int argc, char **argv) {
  // setup
  lua_State *L = luaL_newstate();
  luaL_openLibs(L);

  // register the c functions
  lua_register(L, "creadFile", readFile);
  lua_register(L, "cparse", parse);
  
  // load the lua file 
  if (luaL_dofile(L, "babbler.lua")) {
    printf("Error in dofile\n");
    return 1;
  }

  // call methods
  lua_getglobal(L, "generateImage");
  lua_pcall(L, 0, 0, 0);

  // shut down
  lua_close(L);
  

  if (argc != 2) {
    fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    exit(1);
  }

  char *buffer = readfile(argv[1]);
  printf("Success!\n");
  printf("%s", buffer);

  free(buffer);
  return 0;
}
