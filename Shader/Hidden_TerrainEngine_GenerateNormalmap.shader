//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TerrainEngine/GenerateNormalmap" {
Properties {
_MainTex ("Texture", any) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 48638
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TerrainNormalmapGenSize;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.z = in_TEXCOORD0.x;
    u_xlat1.xy = in_TEXCOORD0.yx + _TerrainNormalmapGenSize.yx;
    u_xlat0.w = u_xlat1.x;
    u_xlat0.xy = in_TEXCOORD0.yx + (-_TerrainNormalmapGenSize.yx);
    vs_TEXCOORD0 = u_xlat0.zxzw;
    u_xlat1.w = in_TEXCOORD0.y;
    u_xlat1.z = u_xlat0.y;
    vs_TEXCOORD2.xyw = u_xlat0.yxx;
    vs_TEXCOORD1 = u_xlat1.zwyw;
    vs_TEXCOORD3 = u_xlat1.zxyx;
    vs_TEXCOORD2.z = u_xlat1.y;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _TerrainNormalmapGenSize;
uniform 	vec4 _TerrainTilesScaleOffsets[9];
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
ivec4 u_xlati0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
ivec4 u_xlati3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat6;
float u_xlat10;
ivec2 u_xlati10;
float u_xlat15;
void main()
{
    u_xlat0 = vs_TEXCOORD1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = floor(u_xlat0);
    u_xlati0 = ivec4(u_xlat0);
    u_xlati0.xy = u_xlati0.yw * ivec2(3, 3) + u_xlati0.xz;
    u_xlat1 = vs_TEXCOORD1 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat5 = u_xlat1.x * _TerrainTilesScaleOffsets[u_xlati0.y].x + _TerrainTilesScaleOffsets[u_xlati0.y].y;
    u_xlat0.x = u_xlat2.x * _TerrainTilesScaleOffsets[u_xlati0.x].x + _TerrainTilesScaleOffsets[u_xlati0.x].y;
    u_xlat1 = vs_TEXCOORD2 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = floor(u_xlat1);
    u_xlati1 = ivec4(u_xlat1);
    u_xlati10.xy = u_xlati1.yw * ivec2(3, 3) + u_xlati1.xz;
    u_xlat1 = vs_TEXCOORD2 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat15 = u_xlat1.x * _TerrainTilesScaleOffsets[u_xlati10.y].x + _TerrainTilesScaleOffsets[u_xlati10.y].y;
    u_xlat10 = u_xlat2.x * _TerrainTilesScaleOffsets[u_xlati10.x].x + _TerrainTilesScaleOffsets[u_xlati10.x].y;
    u_xlat0.x = u_xlat0.x * -2.0 + (-u_xlat10);
    u_xlat1 = vs_TEXCOORD3 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = floor(u_xlat1);
    u_xlati1 = ivec4(u_xlat1);
    u_xlati1.xy = u_xlati1.yw * ivec2(3, 3) + u_xlati1.xz;
    u_xlat2 = vs_TEXCOORD3 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat6 = u_xlat2.x * _TerrainTilesScaleOffsets[u_xlati1.y].x + _TerrainTilesScaleOffsets[u_xlati1.y].y;
    u_xlat1.x = u_xlat3.x * _TerrainTilesScaleOffsets[u_xlati1.x].x + _TerrainTilesScaleOffsets[u_xlati1.x].y;
    u_xlat0.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat0.x = u_xlat15 + u_xlat0.x;
    u_xlat0.x = u_xlat5 * 2.0 + u_xlat0.x;
    u_xlat2.x = u_xlat6 + u_xlat0.x;
    u_xlat3 = vs_TEXCOORD0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat3 = floor(u_xlat3);
    u_xlati3 = ivec4(u_xlat3);
    u_xlati0.xy = u_xlati3.yw * ivec2(3, 3) + u_xlati3.xz;
    u_xlat3 = vs_TEXCOORD0 * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
    u_xlat4 = texture(_MainTex, u_xlat3.xy);
    u_xlat3 = texture(_MainTex, u_xlat3.zw);
    u_xlat5 = u_xlat3.x * _TerrainTilesScaleOffsets[u_xlati0.y].x + _TerrainTilesScaleOffsets[u_xlati0.y].y;
    u_xlat0.x = u_xlat4.x * _TerrainTilesScaleOffsets[u_xlati0.x].x + _TerrainTilesScaleOffsets[u_xlati0.x].y;
    u_xlat0.x = u_xlat0.x * -2.0 + (-u_xlat10);
    u_xlat0.x = (-u_xlat15) + u_xlat0.x;
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
    u_xlat0.x = u_xlat5 * 2.0 + u_xlat0.x;
    u_xlat2.z = u_xlat6 + u_xlat0.x;
    u_xlat0.xy = u_xlat2.xz * _TerrainNormalmapGenSize.zw;
    u_xlat0.xz = (-u_xlat0.xy);
    u_xlat0.y = 8.0;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.y = inversesqrt(u_xlat5);
    u_xlat1.xz = u_xlat0.xz * u_xlat1.yy;
    SV_Target0.xyz = u_xlat1.xyz * vec3(0.5, 4.0, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 143
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %113 %122 %128 %131 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate vs_TEXCOORD0 Location 113 
                                                     OpDecorate vs_TEXCOORD2 Location 122 
                                                     OpDecorate vs_TEXCOORD1 Location 128 
                                                     OpDecorate vs_TEXCOORD3 Location 131 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                         u32 %85 = OpConstant 0 
                                             %86 = OpTypePointer Input %6 
                                         u32 %89 = OpConstant 2 
                                             %90 = OpTypePointer Private %6 
                                        u32 %102 = OpConstant 3 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                            %123 = OpTypeVector %6 3 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                      Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                            %136 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                  Input f32* %87 = OpAccessChain %84 %85 
                                         f32 %88 = OpLoad %87 
                                Private f32* %91 = OpAccessChain %9 %89 
                                                     OpStore %91 %88 
                                       f32_2 %92 = OpLoad %84 
                                       f32_2 %93 = OpVectorShuffle %92 %92 1 0 
                              Uniform f32_4* %94 = OpAccessChain %20 %35 
                                       f32_4 %95 = OpLoad %94 
                                       f32_2 %96 = OpVectorShuffle %95 %95 1 0 
                                       f32_2 %97 = OpFAdd %93 %96 
                                       f32_4 %98 = OpLoad %48 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                     OpStore %48 %99 
                               Private f32* %100 = OpAccessChain %48 %85 
                                        f32 %101 = OpLoad %100 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_2 %104 = OpLoad %84 
                                      f32_2 %105 = OpVectorShuffle %104 %104 1 0 
                             Uniform f32_4* %106 = OpAccessChain %20 %35 
                                      f32_4 %107 = OpLoad %106 
                                      f32_2 %108 = OpVectorShuffle %107 %107 1 0 
                                      f32_2 %109 = OpFNegate %108 
                                      f32_2 %110 = OpFAdd %105 %109 
                                      f32_4 %111 = OpLoad %9 
                                      f32_4 %112 = OpVectorShuffle %111 %110 4 5 2 3 
                                                     OpStore %9 %112 
                                      f32_4 %114 = OpLoad %9 
                                      f32_4 %115 = OpVectorShuffle %114 %114 2 0 2 3 
                                                     OpStore vs_TEXCOORD0 %115 
                                 Input f32* %116 = OpAccessChain %84 %68 
                                        f32 %117 = OpLoad %116 
                               Private f32* %118 = OpAccessChain %48 %102 
                                                     OpStore %118 %117 
                               Private f32* %119 = OpAccessChain %9 %68 
                                        f32 %120 = OpLoad %119 
                               Private f32* %121 = OpAccessChain %48 %89 
                                                     OpStore %121 %120 
                                      f32_4 %124 = OpLoad %9 
                                      f32_3 %125 = OpVectorShuffle %124 %124 1 0 0 
                                      f32_4 %126 = OpLoad vs_TEXCOORD2 
                                      f32_4 %127 = OpVectorShuffle %126 %125 4 5 2 6 
                                                     OpStore vs_TEXCOORD2 %127 
                                      f32_4 %129 = OpLoad %48 
                                      f32_4 %130 = OpVectorShuffle %129 %129 2 3 1 3 
                                                     OpStore vs_TEXCOORD1 %130 
                                      f32_4 %132 = OpLoad %48 
                                      f32_4 %133 = OpVectorShuffle %132 %132 2 0 1 0 
                                                     OpStore vs_TEXCOORD3 %133 
                               Private f32* %134 = OpAccessChain %48 %68 
                                        f32 %135 = OpLoad %134 
                                Output f32* %137 = OpAccessChain vs_TEXCOORD2 %89 
                                                     OpStore %137 %135 
                                Output f32* %138 = OpAccessChain %72 %22 %68 
                                        f32 %139 = OpLoad %138 
                                        f32 %140 = OpFNegate %139 
                                Output f32* %141 = OpAccessChain %72 %22 %68 
                                                     OpStore %141 %140 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 518
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %135 %234 %348 %503 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                  OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                  OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD1 Location 11 
                                                  OpDecorate %39 ArrayStride 39 
                                                  OpMemberDecorate %40 0 Offset 40 
                                                  OpMemberDecorate %40 1 Offset 40 
                                                  OpMemberDecorate %40 2 Offset 40 
                                                  OpDecorate %40 Block 
                                                  OpDecorate %42 DescriptorSet 42 
                                                  OpDecorate %42 Binding 42 
                                                  OpDecorate %58 DescriptorSet 58 
                                                  OpDecorate %58 Binding 58 
                                                  OpDecorate %62 DescriptorSet 62 
                                                  OpDecorate %62 Binding 62 
                                                  OpDecorate vs_TEXCOORD2 Location 135 
                                                  OpDecorate vs_TEXCOORD3 Location 234 
                                                  OpDecorate vs_TEXCOORD0 Location 348 
                                                  OpDecorate %503 Location 503 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 4 
                                           %8 = OpTypePointer Private %7 
                            Private f32_4* %9 = OpVariable Private 
                                          %10 = OpTypePointer Input %7 
                    Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                      f32 %13 = OpConstant 3.674022E-40 
                                    f32_4 %14 = OpConstantComposite %13 %13 %13 %13 
                                          %18 = OpTypeInt 32 1 
                                          %19 = OpTypeVector %18 4 
                                          %20 = OpTypePointer Private %19 
                           Private i32_4* %21 = OpVariable Private 
                                          %24 = OpTypeVector %18 2 
                                      i32 %27 = OpConstant 3 
                                    i32_2 %28 = OpConstantComposite %27 %27 
                           Private f32_4* %35 = OpVariable Private 
                                          %37 = OpTypeInt 32 0 
                                      u32 %38 = OpConstant 9 
                                          %39 = OpTypeArray %7 %38 
                                          %40 = OpTypeStruct %7 %7 %39 
                                          %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[9];}* %42 = OpVariable Uniform 
                                      i32 %43 = OpConstant 0 
                                          %44 = OpTypePointer Uniform %7 
                                          %53 = OpTypeVector %6 2 
                                          %54 = OpTypePointer Private %53 
                           Private f32_2* %55 = OpVariable Private 
                                          %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %57 = OpTypePointer UniformConstant %56 
     UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
                                          %60 = OpTypeSampler 
                                          %61 = OpTypePointer UniformConstant %60 
                 UniformConstant sampler* %62 = OpVariable UniformConstant 
                                          %64 = OpTypeSampledImage %56 
                                      u32 %79 = OpConstant 1 
                                          %80 = OpTypePointer Private %6 
                                      f32 %83 = OpConstant 3.674022E-40 
                                      u32 %85 = OpConstant 0 
                                      f32 %92 = OpConstant 3.674022E-40 
                             Private f32* %95 = OpVariable Private 
                                      i32 %98 = OpConstant 2 
                                          %99 = OpTypePointer Private %18 
                                         %102 = OpTypePointer Uniform %6 
                    Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                          Private i32_4* %140 = OpVariable Private 
                                         %143 = OpTypePointer Private %24 
                          Private i32_2* %144 = OpVariable Private 
                          Private f32_2* %169 = OpVariable Private 
                            Private f32* %188 = OpVariable Private 
                                     f32 %227 = OpConstant 3.674022E-40 
                    Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                          Private f32_4* %249 = OpVariable Private 
                            Private f32* %286 = OpVariable Private 
                                     f32 %336 = OpConstant 3.674022E-40 
                          Private f32_4* %347 = OpVariable Private 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                          Private i32_4* %353 = OpVariable Private 
                                         %380 = OpTypeVector %6 3 
                                         %381 = OpTypePointer Private %380 
                          Private f32_3* %382 = OpVariable Private 
                                     u32 %392 = OpConstant 2 
                                     i32 %473 = OpConstant 1 
                                     f32 %485 = OpConstant 3.674022E-40 
                                         %502 = OpTypePointer Output %7 
                           Output f32_4* %503 = OpVariable Output 
                                     f32 %506 = OpConstant 3.674022E-40 
                                     f32 %507 = OpConstant 3.674022E-40 
                                   f32_3 %508 = OpConstantComposite %506 %507 %506 
                                   f32_3 %510 = OpConstantComposite %506 %506 %506 
                                     u32 %514 = OpConstant 3 
                                         %515 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                                    f32_4 %12 = OpLoad vs_TEXCOORD1 
                                    f32_4 %15 = OpFAdd %12 %14 
                                                  OpStore %9 %15 
                                    f32_4 %16 = OpLoad %9 
                                    f32_4 %17 = OpExtInst %1 8 %16 
                                                  OpStore %9 %17 
                                    f32_4 %22 = OpLoad %9 
                                    i32_4 %23 = OpConvertFToS %22 
                                                  OpStore %21 %23 
                                    i32_4 %25 = OpLoad %21 
                                    i32_2 %26 = OpVectorShuffle %25 %25 1 3 
                                    i32_2 %29 = OpIMul %26 %28 
                                    i32_4 %30 = OpLoad %21 
                                    i32_2 %31 = OpVectorShuffle %30 %30 0 2 
                                    i32_2 %32 = OpIAdd %29 %31 
                                    i32_4 %33 = OpLoad %21 
                                    i32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
                                                  OpStore %21 %34 
                                    f32_4 %36 = OpLoad vs_TEXCOORD1 
                           Uniform f32_4* %45 = OpAccessChain %42 %43 
                                    f32_4 %46 = OpLoad %45 
                                    f32_4 %47 = OpVectorShuffle %46 %46 0 1 0 1 
                                    f32_4 %48 = OpFMul %36 %47 
                           Uniform f32_4* %49 = OpAccessChain %42 %43 
                                    f32_4 %50 = OpLoad %49 
                                    f32_4 %51 = OpVectorShuffle %50 %50 2 3 2 3 
                                    f32_4 %52 = OpFAdd %48 %51 
                                                  OpStore %35 %52 
                      read_only Texture2D %59 = OpLoad %58 
                                  sampler %63 = OpLoad %62 
               read_only Texture2DSampled %65 = OpSampledImage %59 %63 
                                    f32_4 %66 = OpLoad %35 
                                    f32_2 %67 = OpVectorShuffle %66 %66 0 1 
                                    f32_4 %68 = OpImageSampleImplicitLod %65 %67 
                                    f32_2 %69 = OpVectorShuffle %68 %68 0 1 
                                                  OpStore %55 %69 
                      read_only Texture2D %70 = OpLoad %58 
                                  sampler %71 = OpLoad %62 
               read_only Texture2DSampled %72 = OpSampledImage %70 %71 
                                    f32_4 %73 = OpLoad %35 
                                    f32_2 %74 = OpVectorShuffle %73 %73 2 3 
                                    f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                                    f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                    f32_4 %77 = OpLoad %35 
                                    f32_4 %78 = OpVectorShuffle %77 %76 4 5 2 3 
                                                  OpStore %35 %78 
                             Private f32* %81 = OpAccessChain %35 %79 
                                      f32 %82 = OpLoad %81 
                                      f32 %84 = OpFMul %82 %83 
                             Private f32* %86 = OpAccessChain %35 %85 
                                      f32 %87 = OpLoad %86 
                                      f32 %88 = OpFAdd %84 %87 
                             Private f32* %89 = OpAccessChain %35 %85 
                                                  OpStore %89 %88 
                             Private f32* %90 = OpAccessChain %35 %85 
                                      f32 %91 = OpLoad %90 
                                      f32 %93 = OpFMul %91 %92 
                             Private f32* %94 = OpAccessChain %35 %85 
                                                  OpStore %94 %93 
                             Private f32* %96 = OpAccessChain %35 %85 
                                      f32 %97 = OpLoad %96 
                            Private i32* %100 = OpAccessChain %21 %79 
                                     i32 %101 = OpLoad %100 
                            Uniform f32* %103 = OpAccessChain %42 %98 %101 %85 
                                     f32 %104 = OpLoad %103 
                                     f32 %105 = OpFMul %97 %104 
                            Private i32* %106 = OpAccessChain %21 %79 
                                     i32 %107 = OpLoad %106 
                            Uniform f32* %108 = OpAccessChain %42 %98 %107 %79 
                                     f32 %109 = OpLoad %108 
                                     f32 %110 = OpFAdd %105 %109 
                                                  OpStore %95 %110 
                            Private f32* %111 = OpAccessChain %55 %79 
                                     f32 %112 = OpLoad %111 
                                     f32 %113 = OpFMul %112 %83 
                            Private f32* %114 = OpAccessChain %55 %85 
                                     f32 %115 = OpLoad %114 
                                     f32 %116 = OpFAdd %113 %115 
                            Private f32* %117 = OpAccessChain %55 %85 
                                                  OpStore %117 %116 
                            Private f32* %118 = OpAccessChain %55 %85 
                                     f32 %119 = OpLoad %118 
                                     f32 %120 = OpFMul %119 %92 
                            Private f32* %121 = OpAccessChain %55 %85 
                                                  OpStore %121 %120 
                            Private f32* %122 = OpAccessChain %55 %85 
                                     f32 %123 = OpLoad %122 
                            Private i32* %124 = OpAccessChain %21 %85 
                                     i32 %125 = OpLoad %124 
                            Uniform f32* %126 = OpAccessChain %42 %98 %125 %85 
                                     f32 %127 = OpLoad %126 
                                     f32 %128 = OpFMul %123 %127 
                            Private i32* %129 = OpAccessChain %21 %85 
                                     i32 %130 = OpLoad %129 
                            Uniform f32* %131 = OpAccessChain %42 %98 %130 %79 
                                     f32 %132 = OpLoad %131 
                                     f32 %133 = OpFAdd %128 %132 
                            Private f32* %134 = OpAccessChain %9 %85 
                                                  OpStore %134 %133 
                                   f32_4 %136 = OpLoad vs_TEXCOORD2 
                                   f32_4 %137 = OpFAdd %136 %14 
                                                  OpStore %35 %137 
                                   f32_4 %138 = OpLoad %35 
                                   f32_4 %139 = OpExtInst %1 8 %138 
                                                  OpStore %35 %139 
                                   f32_4 %141 = OpLoad %35 
                                   i32_4 %142 = OpConvertFToS %141 
                                                  OpStore %140 %142 
                                   i32_4 %145 = OpLoad %140 
                                   i32_2 %146 = OpVectorShuffle %145 %145 1 3 
                                   i32_2 %147 = OpIMul %146 %28 
                                   i32_4 %148 = OpLoad %140 
                                   i32_2 %149 = OpVectorShuffle %148 %148 0 2 
                                   i32_2 %150 = OpIAdd %147 %149 
                                                  OpStore %144 %150 
                                   f32_4 %151 = OpLoad vs_TEXCOORD2 
                          Uniform f32_4* %152 = OpAccessChain %42 %43 
                                   f32_4 %153 = OpLoad %152 
                                   f32_4 %154 = OpVectorShuffle %153 %153 0 1 0 1 
                                   f32_4 %155 = OpFMul %151 %154 
                          Uniform f32_4* %156 = OpAccessChain %42 %43 
                                   f32_4 %157 = OpLoad %156 
                                   f32_4 %158 = OpVectorShuffle %157 %157 2 3 2 3 
                                   f32_4 %159 = OpFAdd %155 %158 
                                                  OpStore %35 %159 
                     read_only Texture2D %160 = OpLoad %58 
                                 sampler %161 = OpLoad %62 
              read_only Texture2DSampled %162 = OpSampledImage %160 %161 
                                   f32_4 %163 = OpLoad %35 
                                   f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                   f32_4 %165 = OpImageSampleImplicitLod %162 %164 
                                   f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                   f32_4 %167 = OpLoad %35 
                                   f32_4 %168 = OpVectorShuffle %167 %166 4 5 2 3 
                                                  OpStore %35 %168 
                     read_only Texture2D %170 = OpLoad %58 
                                 sampler %171 = OpLoad %62 
              read_only Texture2DSampled %172 = OpSampledImage %170 %171 
                                   f32_4 %173 = OpLoad %35 
                                   f32_2 %174 = OpVectorShuffle %173 %173 2 3 
                                   f32_4 %175 = OpImageSampleImplicitLod %172 %174 
                                   f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                                  OpStore %169 %176 
                            Private f32* %177 = OpAccessChain %169 %79 
                                     f32 %178 = OpLoad %177 
                                     f32 %179 = OpFMul %178 %83 
                            Private f32* %180 = OpAccessChain %169 %85 
                                     f32 %181 = OpLoad %180 
                                     f32 %182 = OpFAdd %179 %181 
                            Private f32* %183 = OpAccessChain %169 %85 
                                                  OpStore %183 %182 
                            Private f32* %184 = OpAccessChain %169 %85 
                                     f32 %185 = OpLoad %184 
                                     f32 %186 = OpFMul %185 %92 
                            Private f32* %187 = OpAccessChain %169 %85 
                                                  OpStore %187 %186 
                            Private f32* %189 = OpAccessChain %169 %85 
                                     f32 %190 = OpLoad %189 
                            Private i32* %191 = OpAccessChain %144 %79 
                                     i32 %192 = OpLoad %191 
                            Uniform f32* %193 = OpAccessChain %42 %98 %192 %85 
                                     f32 %194 = OpLoad %193 
                                     f32 %195 = OpFMul %190 %194 
                            Private i32* %196 = OpAccessChain %144 %79 
                                     i32 %197 = OpLoad %196 
                            Uniform f32* %198 = OpAccessChain %42 %98 %197 %79 
                                     f32 %199 = OpLoad %198 
                                     f32 %200 = OpFAdd %195 %199 
                                                  OpStore %188 %200 
                            Private f32* %201 = OpAccessChain %35 %79 
                                     f32 %202 = OpLoad %201 
                                     f32 %203 = OpFMul %202 %83 
                            Private f32* %204 = OpAccessChain %35 %85 
                                     f32 %205 = OpLoad %204 
                                     f32 %206 = OpFAdd %203 %205 
                            Private f32* %207 = OpAccessChain %35 %85 
                                                  OpStore %207 %206 
                            Private f32* %208 = OpAccessChain %35 %85 
                                     f32 %209 = OpLoad %208 
                                     f32 %210 = OpFMul %209 %92 
                            Private f32* %211 = OpAccessChain %35 %85 
                                                  OpStore %211 %210 
                            Private f32* %212 = OpAccessChain %35 %85 
                                     f32 %213 = OpLoad %212 
                            Private i32* %214 = OpAccessChain %144 %85 
                                     i32 %215 = OpLoad %214 
                            Uniform f32* %216 = OpAccessChain %42 %98 %215 %85 
                                     f32 %217 = OpLoad %216 
                                     f32 %218 = OpFMul %213 %217 
                            Private i32* %219 = OpAccessChain %144 %85 
                                     i32 %220 = OpLoad %219 
                            Uniform f32* %221 = OpAccessChain %42 %98 %220 %79 
                                     f32 %222 = OpLoad %221 
                                     f32 %223 = OpFAdd %218 %222 
                            Private f32* %224 = OpAccessChain %55 %85 
                                                  OpStore %224 %223 
                            Private f32* %225 = OpAccessChain %9 %85 
                                     f32 %226 = OpLoad %225 
                                     f32 %228 = OpFMul %226 %227 
                            Private f32* %229 = OpAccessChain %55 %85 
                                     f32 %230 = OpLoad %229 
                                     f32 %231 = OpFNegate %230 
                                     f32 %232 = OpFAdd %228 %231 
                            Private f32* %233 = OpAccessChain %9 %85 
                                                  OpStore %233 %232 
                                   f32_4 %235 = OpLoad vs_TEXCOORD3 
                                   f32_4 %236 = OpFAdd %235 %14 
                                                  OpStore %35 %236 
                                   f32_4 %237 = OpLoad %35 
                                   f32_4 %238 = OpExtInst %1 8 %237 
                                                  OpStore %35 %238 
                                   f32_4 %239 = OpLoad %35 
                                   i32_4 %240 = OpConvertFToS %239 
                                                  OpStore %140 %240 
                                   i32_4 %241 = OpLoad %140 
                                   i32_2 %242 = OpVectorShuffle %241 %241 1 3 
                                   i32_2 %243 = OpIMul %242 %28 
                                   i32_4 %244 = OpLoad %140 
                                   i32_2 %245 = OpVectorShuffle %244 %244 0 2 
                                   i32_2 %246 = OpIAdd %243 %245 
                                   i32_4 %247 = OpLoad %140 
                                   i32_4 %248 = OpVectorShuffle %247 %246 4 5 2 3 
                                                  OpStore %140 %248 
                                   f32_4 %250 = OpLoad vs_TEXCOORD3 
                          Uniform f32_4* %251 = OpAccessChain %42 %43 
                                   f32_4 %252 = OpLoad %251 
                                   f32_4 %253 = OpVectorShuffle %252 %252 0 1 0 1 
                                   f32_4 %254 = OpFMul %250 %253 
                          Uniform f32_4* %255 = OpAccessChain %42 %43 
                                   f32_4 %256 = OpLoad %255 
                                   f32_4 %257 = OpVectorShuffle %256 %256 2 3 2 3 
                                   f32_4 %258 = OpFAdd %254 %257 
                                                  OpStore %249 %258 
                     read_only Texture2D %259 = OpLoad %58 
                                 sampler %260 = OpLoad %62 
              read_only Texture2DSampled %261 = OpSampledImage %259 %260 
                                   f32_4 %262 = OpLoad %249 
                                   f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                   f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                   f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                                  OpStore %169 %265 
                     read_only Texture2D %266 = OpLoad %58 
                                 sampler %267 = OpLoad %62 
              read_only Texture2DSampled %268 = OpSampledImage %266 %267 
                                   f32_4 %269 = OpLoad %249 
                                   f32_2 %270 = OpVectorShuffle %269 %269 2 3 
                                   f32_4 %271 = OpImageSampleImplicitLod %268 %270 
                                   f32_2 %272 = OpVectorShuffle %271 %271 0 1 
                                   f32_4 %273 = OpLoad %249 
                                   f32_4 %274 = OpVectorShuffle %273 %272 4 5 2 3 
                                                  OpStore %249 %274 
                            Private f32* %275 = OpAccessChain %249 %79 
                                     f32 %276 = OpLoad %275 
                                     f32 %277 = OpFMul %276 %83 
                            Private f32* %278 = OpAccessChain %249 %85 
                                     f32 %279 = OpLoad %278 
                                     f32 %280 = OpFAdd %277 %279 
                            Private f32* %281 = OpAccessChain %249 %85 
                                                  OpStore %281 %280 
                            Private f32* %282 = OpAccessChain %249 %85 
                                     f32 %283 = OpLoad %282 
                                     f32 %284 = OpFMul %283 %92 
                            Private f32* %285 = OpAccessChain %249 %85 
                                                  OpStore %285 %284 
                            Private f32* %287 = OpAccessChain %249 %85 
                                     f32 %288 = OpLoad %287 
                            Private i32* %289 = OpAccessChain %140 %79 
                                     i32 %290 = OpLoad %289 
                            Uniform f32* %291 = OpAccessChain %42 %98 %290 %85 
                                     f32 %292 = OpLoad %291 
                                     f32 %293 = OpFMul %288 %292 
                            Private i32* %294 = OpAccessChain %140 %79 
                                     i32 %295 = OpLoad %294 
                            Uniform f32* %296 = OpAccessChain %42 %98 %295 %79 
                                     f32 %297 = OpLoad %296 
                                     f32 %298 = OpFAdd %293 %297 
                                                  OpStore %286 %298 
                            Private f32* %299 = OpAccessChain %169 %79 
                                     f32 %300 = OpLoad %299 
                                     f32 %301 = OpFMul %300 %83 
                            Private f32* %302 = OpAccessChain %169 %85 
                                     f32 %303 = OpLoad %302 
                                     f32 %304 = OpFAdd %301 %303 
                            Private f32* %305 = OpAccessChain %169 %85 
                                                  OpStore %305 %304 
                            Private f32* %306 = OpAccessChain %169 %85 
                                     f32 %307 = OpLoad %306 
                                     f32 %308 = OpFMul %307 %92 
                            Private f32* %309 = OpAccessChain %169 %85 
                                                  OpStore %309 %308 
                            Private f32* %310 = OpAccessChain %169 %85 
                                     f32 %311 = OpLoad %310 
                            Private i32* %312 = OpAccessChain %140 %85 
                                     i32 %313 = OpLoad %312 
                            Uniform f32* %314 = OpAccessChain %42 %98 %313 %85 
                                     f32 %315 = OpLoad %314 
                                     f32 %316 = OpFMul %311 %315 
                            Private i32* %317 = OpAccessChain %140 %85 
                                     i32 %318 = OpLoad %317 
                            Uniform f32* %319 = OpAccessChain %42 %98 %318 %79 
                                     f32 %320 = OpLoad %319 
                                     f32 %321 = OpFAdd %316 %320 
                            Private f32* %322 = OpAccessChain %35 %85 
                                                  OpStore %322 %321 
                            Private f32* %323 = OpAccessChain %9 %85 
                                     f32 %324 = OpLoad %323 
                            Private f32* %325 = OpAccessChain %35 %85 
                                     f32 %326 = OpLoad %325 
                                     f32 %327 = OpFNegate %326 
                                     f32 %328 = OpFAdd %324 %327 
                            Private f32* %329 = OpAccessChain %9 %85 
                                                  OpStore %329 %328 
                                     f32 %330 = OpLoad %188 
                            Private f32* %331 = OpAccessChain %9 %85 
                                     f32 %332 = OpLoad %331 
                                     f32 %333 = OpFAdd %330 %332 
                            Private f32* %334 = OpAccessChain %9 %85 
                                                  OpStore %334 %333 
                                     f32 %335 = OpLoad %95 
                                     f32 %337 = OpFMul %335 %336 
                            Private f32* %338 = OpAccessChain %9 %85 
                                     f32 %339 = OpLoad %338 
                                     f32 %340 = OpFAdd %337 %339 
                            Private f32* %341 = OpAccessChain %9 %85 
                                                  OpStore %341 %340 
                                     f32 %342 = OpLoad %286 
                            Private f32* %343 = OpAccessChain %9 %85 
                                     f32 %344 = OpLoad %343 
                                     f32 %345 = OpFAdd %342 %344 
                            Private f32* %346 = OpAccessChain %249 %85 
                                                  OpStore %346 %345 
                                   f32_4 %349 = OpLoad vs_TEXCOORD0 
                                   f32_4 %350 = OpFAdd %349 %14 
                                                  OpStore %347 %350 
                                   f32_4 %351 = OpLoad %347 
                                   f32_4 %352 = OpExtInst %1 8 %351 
                                                  OpStore %347 %352 
                                   f32_4 %354 = OpLoad %347 
                                   i32_4 %355 = OpConvertFToS %354 
                                                  OpStore %353 %355 
                                   i32_4 %356 = OpLoad %353 
                                   i32_2 %357 = OpVectorShuffle %356 %356 1 3 
                                   i32_2 %358 = OpIMul %357 %28 
                                   i32_4 %359 = OpLoad %353 
                                   i32_2 %360 = OpVectorShuffle %359 %359 0 2 
                                   i32_2 %361 = OpIAdd %358 %360 
                                   i32_4 %362 = OpLoad %21 
                                   i32_4 %363 = OpVectorShuffle %362 %361 4 5 2 3 
                                                  OpStore %21 %363 
                                   f32_4 %364 = OpLoad vs_TEXCOORD0 
                          Uniform f32_4* %365 = OpAccessChain %42 %43 
                                   f32_4 %366 = OpLoad %365 
                                   f32_4 %367 = OpVectorShuffle %366 %366 0 1 0 1 
                                   f32_4 %368 = OpFMul %364 %367 
                          Uniform f32_4* %369 = OpAccessChain %42 %43 
                                   f32_4 %370 = OpLoad %369 
                                   f32_4 %371 = OpVectorShuffle %370 %370 2 3 2 3 
                                   f32_4 %372 = OpFAdd %368 %371 
                                                  OpStore %347 %372 
                     read_only Texture2D %373 = OpLoad %58 
                                 sampler %374 = OpLoad %62 
              read_only Texture2DSampled %375 = OpSampledImage %373 %374 
                                   f32_4 %376 = OpLoad %347 
                                   f32_2 %377 = OpVectorShuffle %376 %376 0 1 
                                   f32_4 %378 = OpImageSampleImplicitLod %375 %377 
                                   f32_2 %379 = OpVectorShuffle %378 %378 0 1 
                                                  OpStore %169 %379 
                     read_only Texture2D %383 = OpLoad %58 
                                 sampler %384 = OpLoad %62 
              read_only Texture2DSampled %385 = OpSampledImage %383 %384 
                                   f32_4 %386 = OpLoad %347 
                                   f32_2 %387 = OpVectorShuffle %386 %386 2 3 
                                   f32_4 %388 = OpImageSampleImplicitLod %385 %387 
                                   f32_2 %389 = OpVectorShuffle %388 %388 0 1 
                                   f32_3 %390 = OpLoad %382 
                                   f32_3 %391 = OpVectorShuffle %390 %389 3 1 4 
                                                  OpStore %382 %391 
                            Private f32* %393 = OpAccessChain %382 %392 
                                     f32 %394 = OpLoad %393 
                                     f32 %395 = OpFMul %394 %83 
                            Private f32* %396 = OpAccessChain %382 %85 
                                     f32 %397 = OpLoad %396 
                                     f32 %398 = OpFAdd %395 %397 
                            Private f32* %399 = OpAccessChain %382 %85 
                                                  OpStore %399 %398 
                            Private f32* %400 = OpAccessChain %382 %85 
                                     f32 %401 = OpLoad %400 
                                     f32 %402 = OpFMul %401 %92 
                            Private f32* %403 = OpAccessChain %382 %85 
                                                  OpStore %403 %402 
                            Private f32* %404 = OpAccessChain %382 %85 
                                     f32 %405 = OpLoad %404 
                            Private i32* %406 = OpAccessChain %21 %79 
                                     i32 %407 = OpLoad %406 
                            Uniform f32* %408 = OpAccessChain %42 %98 %407 %85 
                                     f32 %409 = OpLoad %408 
                                     f32 %410 = OpFMul %405 %409 
                            Private i32* %411 = OpAccessChain %21 %79 
                                     i32 %412 = OpLoad %411 
                            Uniform f32* %413 = OpAccessChain %42 %98 %412 %79 
                                     f32 %414 = OpLoad %413 
                                     f32 %415 = OpFAdd %410 %414 
                                                  OpStore %95 %415 
                            Private f32* %416 = OpAccessChain %169 %79 
                                     f32 %417 = OpLoad %416 
                                     f32 %418 = OpFMul %417 %83 
                            Private f32* %419 = OpAccessChain %169 %85 
                                     f32 %420 = OpLoad %419 
                                     f32 %421 = OpFAdd %418 %420 
                            Private f32* %422 = OpAccessChain %169 %85 
                                                  OpStore %422 %421 
                            Private f32* %423 = OpAccessChain %169 %85 
                                     f32 %424 = OpLoad %423 
                                     f32 %425 = OpFMul %424 %92 
                            Private f32* %426 = OpAccessChain %169 %85 
                                                  OpStore %426 %425 
                            Private f32* %427 = OpAccessChain %169 %85 
                                     f32 %428 = OpLoad %427 
                            Private i32* %429 = OpAccessChain %21 %85 
                                     i32 %430 = OpLoad %429 
                            Uniform f32* %431 = OpAccessChain %42 %98 %430 %85 
                                     f32 %432 = OpLoad %431 
                                     f32 %433 = OpFMul %428 %432 
                            Private i32* %434 = OpAccessChain %21 %85 
                                     i32 %435 = OpLoad %434 
                            Uniform f32* %436 = OpAccessChain %42 %98 %435 %79 
                                     f32 %437 = OpLoad %436 
                                     f32 %438 = OpFAdd %433 %437 
                            Private f32* %439 = OpAccessChain %9 %85 
                                                  OpStore %439 %438 
                            Private f32* %440 = OpAccessChain %9 %85 
                                     f32 %441 = OpLoad %440 
                                     f32 %442 = OpFMul %441 %227 
                            Private f32* %443 = OpAccessChain %55 %85 
                                     f32 %444 = OpLoad %443 
                                     f32 %445 = OpFNegate %444 
                                     f32 %446 = OpFAdd %442 %445 
                            Private f32* %447 = OpAccessChain %9 %85 
                                                  OpStore %447 %446 
                                     f32 %448 = OpLoad %188 
                                     f32 %449 = OpFNegate %448 
                            Private f32* %450 = OpAccessChain %9 %85 
                                     f32 %451 = OpLoad %450 
                                     f32 %452 = OpFAdd %449 %451 
                            Private f32* %453 = OpAccessChain %9 %85 
                                                  OpStore %453 %452 
                            Private f32* %454 = OpAccessChain %35 %85 
                                     f32 %455 = OpLoad %454 
                            Private f32* %456 = OpAccessChain %9 %85 
                                     f32 %457 = OpLoad %456 
                                     f32 %458 = OpFAdd %455 %457 
                            Private f32* %459 = OpAccessChain %9 %85 
                                                  OpStore %459 %458 
                                     f32 %460 = OpLoad %95 
                                     f32 %461 = OpFMul %460 %336 
                            Private f32* %462 = OpAccessChain %9 %85 
                                     f32 %463 = OpLoad %462 
                                     f32 %464 = OpFAdd %461 %463 
                            Private f32* %465 = OpAccessChain %9 %85 
                                                  OpStore %465 %464 
                                     f32 %466 = OpLoad %286 
                            Private f32* %467 = OpAccessChain %9 %85 
                                     f32 %468 = OpLoad %467 
                                     f32 %469 = OpFAdd %466 %468 
                            Private f32* %470 = OpAccessChain %249 %392 
                                                  OpStore %470 %469 
                                   f32_4 %471 = OpLoad %249 
                                   f32_2 %472 = OpVectorShuffle %471 %471 0 2 
                          Uniform f32_4* %474 = OpAccessChain %42 %473 
                                   f32_4 %475 = OpLoad %474 
                                   f32_2 %476 = OpVectorShuffle %475 %475 2 3 
                                   f32_2 %477 = OpFMul %472 %476 
                                   f32_4 %478 = OpLoad %9 
                                   f32_4 %479 = OpVectorShuffle %478 %477 4 5 2 3 
                                                  OpStore %9 %479 
                                   f32_4 %480 = OpLoad %9 
                                   f32_2 %481 = OpVectorShuffle %480 %480 0 1 
                                   f32_2 %482 = OpFNegate %481 
                                   f32_4 %483 = OpLoad %9 
                                   f32_4 %484 = OpVectorShuffle %483 %482 4 1 5 3 
                                                  OpStore %9 %484 
                            Private f32* %486 = OpAccessChain %9 %79 
                                                  OpStore %486 %485 
                                   f32_4 %487 = OpLoad %9 
                                   f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                                   f32_4 %489 = OpLoad %9 
                                   f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                                     f32 %491 = OpDot %488 %490 
                                                  OpStore %95 %491 
                                     f32 %492 = OpLoad %95 
                                     f32 %493 = OpExtInst %1 32 %492 
                            Private f32* %494 = OpAccessChain %35 %79 
                                                  OpStore %494 %493 
                                   f32_4 %495 = OpLoad %9 
                                   f32_2 %496 = OpVectorShuffle %495 %495 0 2 
                                   f32_4 %497 = OpLoad %35 
                                   f32_2 %498 = OpVectorShuffle %497 %497 1 1 
                                   f32_2 %499 = OpFMul %496 %498 
                                   f32_4 %500 = OpLoad %35 
                                   f32_4 %501 = OpVectorShuffle %500 %499 4 1 5 3 
                                                  OpStore %35 %501 
                                   f32_4 %504 = OpLoad %35 
                                   f32_3 %505 = OpVectorShuffle %504 %504 0 1 2 
                                   f32_3 %509 = OpFMul %505 %508 
                                   f32_3 %511 = OpFAdd %509 %510 
                                   f32_4 %512 = OpLoad %503 
                                   f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                  OpStore %503 %513 
                             Output f32* %516 = OpAccessChain %503 %514 
                                                  OpStore %516 %13 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}