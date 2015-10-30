#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <stdio.h>

int mandel(lua_State *L) {
  int maxiters = lua_tointeger(L, 1);
  double x = lua_tonumber(L, 2);
  double y = lua_tonumber(L, 3);

  double a = x;
  double b = y;
  for (int i = 1; i <= maxiters; i++) {
    double a2 = a * a;
    double b2 = b * b;
    if (a2 + b2 >= 4.0) {
      lua_pushinteger(L, i);
      return 1
    }
    double ab = a * b;
    b = ab + ab + y;
    a = a2 - b2 + x;
  }
  lua_pushinteger(L, 0);
  return 1;
}

int main() {
  // setup
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);

  // register the mandel function
  lua_register(L, "cmandel", mandel);

  // load the lua file
  if (luaL_dofile(L, "mandel.lua")) {
    printf("Error in dofile\n");
    return 1;
  }

  // call generateImage
  lua_getglobal(L, "generateImage");
  lua_pcall(L, 0, 0, 0);

  // shut down
  lua_close(L);
  return 0;
}
