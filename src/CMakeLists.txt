# Collect all headers
file(GLOB_RECURSE 
	HEADER_LIST 
	CONFIGURE_DEPENDS
	"${PROJECT_SOURCE_DIR}/include/ProjectName/*.hpp")

# Collect implementations
file(GLOB_RECURSE 
	SRC_LIST 
	CONFIGURE_DEPENDS 
	"${PROJECT_SOURCE_DIR}/src/*.cpp")

add_library(exLibrary ${SRC_LIST} ${HEADER_LIST})


target_include_directories(exLibrary PUBLIC ../include)

# Link your library to the other ones, for example boost
#target_link_libraries(exLibrary PRIVATE Boost::boost)

target_compile_features(exLibrary PUBLIC cxx_std_20)
