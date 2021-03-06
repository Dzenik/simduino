#  do not print directories
export MAKEFLAGS += --no-print-directory

# Avoid funny character set dependencies
unexport LC_ALL
LC_COLLATE=C
LC_NUMERIC=C
export LC_COLLATE LC_NUMERIC

# To put more focus on warnings, be less verbose as default
# Use 'make V=1' to see the full commands

ifeq ("$(origin V)", "command line")
  BUILD_VERBOSE = $(V)
endif
ifndef BUILD_VERBOSE
  BUILD_VERBOSE = 0
endif

# Extra libraries -------------------------------------------------------------

ifeq ($(shell pkg-config --exists sdl && echo "1" || echo "0"), 1)
CXXFLAGS  += $(shell pkg-config --cflags sdl)
LIBS      += $(shell pkg-config --libs   sdl)
CXXFLAGS  += -DHAVE_SDL
endif

ifeq ($(shell pkg-config --exists SDL_gfx && echo "1" || echo "0"), 1)
CXXFLAGS  += $(shell pkg-config --cflags SDL_gfx)
LIBS      += $(shell pkg-config --libs   SDL_gfx)
CXXFLAGS  += -DHAVE_SDL_GFX
endif

ifeq ($(shell pkg-config --exists SDL_image && echo "1" || echo "0"), 1)
CXXFLAGS  += $(shell pkg-config --cflags SDL_image)
LIBS      += $(shell pkg-config --libs   SDL_image)
CXXFLAGS  += -DHAVE_SDL_IMAGE
endif

ifeq ($(shell pkg-config --exists SDL_ttf && echo "1" || echo "0"), 1)
CXXFLAGS  += $(shell pkg-config --cflags SDL_ttf)
LIBS      += $(shell pkg-config --libs   SDL_ttf)
CXXFLAGS  += -DHAVE_SDL_TTF
endif

# -----------------------------------------------------------------------------

# That's our default target when none is given on the command line
PHONY := _all
_all:

# Cancel implicit rules on top Makefile
$(CURDIR)/Makefile Makefile: ;

ifeq ($(BUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif
# If the user is running make -s (silent mode), suppress echoing of
# # commands

ifneq ($(findstring s,$(MAKEFLAGS)),)
  quiet=silent_
endif

export quiet Q BUILD_VERBOSE

PHONY += clean all

_all: all

