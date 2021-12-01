//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/FX_Ascii" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.3
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 6810
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
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	float Value;
uniform 	float Fade;
uniform 	vec4 _ScreenResolution;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec4 u_xlatb2;
bvec3 u_xlatb3;
vec2 u_xlat8;
int u_xlati8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
    u_xlat8.x = Fade * 8.0;
    u_xlat1.xy = u_xlat0.xy / u_xlat8.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat8.xy = u_xlat8.xx * u_xlat1.xy;
    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
    u_xlat1 = texture(_MainTex, u_xlat8.xy);
    u_xlat8.x = u_xlat1.z + u_xlat1.x;
    u_xlat8.x = u_xlat8.x / Value;
    u_xlatb2 = lessThan(vec4(0.200000003, 0.300000012, 0.400000006, 0.5), u_xlat8.xxxx);
    u_xlatb3.xyz = lessThan(vec4(0.600000024, 0.699999988, 0.800000012, 0.0), u_xlat8.xxxx).xyz;
    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
    u_xlat12 = exp2(u_xlat12);
    u_xlat8.x = u_xlat8.x / u_xlat12;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat8.x = u_xlat8.x + u_xlat8.x;
    u_xlati8 = int(u_xlat8.x);
    u_xlatb8 = u_xlati8==1;
    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                              OpDecorate %88 Location 88 
                                              OpDecorate %89 Location 89 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                        Output f32_4* %88 = OpVariable Output 
                         Input f32_4* %89 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore vs_TEXCOORD0 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                                f32_4 %90 = OpLoad %89 
                                              OpStore %88 %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %78 %28 %74 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 398
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %12 %377 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 12 
                                                  OpMemberDecorate %15 0 Offset 15 
                                                  OpMemberDecorate %15 1 Offset 15 
                                                  OpMemberDecorate %15 2 Offset 15 
                                                  OpMemberDecorate %15 3 Offset 15 
                                                  OpDecorate %15 Block 
                                                  OpDecorate %17 DescriptorSet 17 
                                                  OpDecorate %17 Binding 17 
                                                  OpDecorate %84 DescriptorSet 84 
                                                  OpDecorate %84 Binding 84 
                                                  OpDecorate %88 DescriptorSet 88 
                                                  OpDecorate %88 Binding 88 
                                                  OpDecorate %377 Location 377 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 3 
                                           %8 = OpTypePointer Private %7 
                            Private f32_3* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 2 
                                          %11 = OpTypePointer Input %10 
                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          %14 = OpTypeVector %6 4 
                                          %15 = OpTypeStruct %6 %6 %14 %14 
                                          %16 = OpTypePointer Uniform %15 
Uniform struct {f32; f32; f32_4; f32_4;}* %17 = OpVariable Uniform 
                                          %18 = OpTypeInt 32 1 
                                      i32 %19 = OpConstant 3 
                                          %20 = OpTypePointer Uniform %14 
                                      i32 %33 = OpConstant 2 
                                          %40 = OpTypePointer Private %10 
                           Private f32_2* %41 = OpVariable Private 
                                      i32 %42 = OpConstant 1 
                                          %43 = OpTypePointer Uniform %6 
                                      f32 %46 = OpConstant 3.674022E-40 
                                          %48 = OpTypeInt 32 0 
                                      u32 %49 = OpConstant 0 
                                          %50 = OpTypePointer Private %6 
                           Private f32_3* %52 = OpVariable Private 
                                      f32 %62 = OpConstant 3.674022E-40 
                                    f32_2 %63 = OpConstantComposite %62 %62 
                                          %82 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                          %83 = OpTypePointer UniformConstant %82 
     UniformConstant read_only Texture2D* %84 = OpVariable UniformConstant 
                                          %86 = OpTypeSampler 
                                          %87 = OpTypePointer UniformConstant %86 
                 UniformConstant sampler* %88 = OpVariable UniformConstant 
                                          %90 = OpTypeSampledImage %82 
                                      u32 %95 = OpConstant 2 
                                     i32 %104 = OpConstant 0 
                                         %109 = OpTypeBool 
                                         %110 = OpTypeVector %109 4 
                                         %111 = OpTypePointer Private %110 
                         Private bool_4* %112 = OpVariable Private 
                                     f32 %113 = OpConstant 3.674022E-40 
                                     f32 %114 = OpConstant 3.674022E-40 
                                     f32 %115 = OpConstant 3.674022E-40 
                                     f32 %116 = OpConstant 3.674022E-40 
                                   f32_4 %117 = OpConstantComposite %113 %114 %115 %116 
                                         %121 = OpTypeVector %109 3 
                                         %122 = OpTypePointer Private %121 
                         Private bool_3* %123 = OpVariable Private 
                                     f32 %124 = OpConstant 3.674022E-40 
                                     f32 %125 = OpConstant 3.674022E-40 
                                     f32 %126 = OpConstant 3.674022E-40 
                                     f32 %127 = OpConstant 3.674022E-40 
                                   f32_4 %128 = OpConstantComposite %124 %125 %126 %127 
                                         %133 = OpTypePointer Private %109 
                                     f32 %136 = OpConstant 3.674022E-40 
                                     f32 %137 = OpConstant 3.674022E-40 
                                     u32 %140 = OpConstant 1 
                                         %143 = OpTypePointer Function %6 
                                     f32 %147 = OpConstant 3.674022E-40 
                                     f32 %158 = OpConstant 3.674022E-40 
                                     u32 %164 = OpConstant 3 
                                     f32 %170 = OpConstant 3.674022E-40 
                                     f32 %181 = OpConstant 3.674022E-40 
                                     f32 %192 = OpConstant 3.674022E-40 
                                     f32 %203 = OpConstant 3.674022E-40 
                                         %215 = OpTypeVector %109 2 
                                         %225 = OpTypePointer Function %7 
                                     f32 %257 = OpConstant 3.674022E-40 
                                   f32_2 %258 = OpConstantComposite %257 %257 
                                     f32 %260 = OpConstant 3.674022E-40 
                                   f32_2 %261 = OpConstantComposite %260 %260 
                                     f32 %267 = OpConstant 3.674022E-40 
                                     f32 %268 = OpConstant 3.674022E-40 
                                   f32_2 %269 = OpConstantComposite %267 %268 
                                     f32 %271 = OpConstant 3.674022E-40 
                                   f32_2 %272 = OpConstantComposite %271 %271 
                            Private f32* %281 = OpVariable Private 
                                     f32 %284 = OpConstant 3.674022E-40 
                           Private bool* %300 = OpVariable Private 
                                         %329 = OpTypePointer Private %18 
                            Private i32* %330 = OpVariable Private 
                           Private bool* %334 = OpVariable Private 
                          Private f32_2* %337 = OpVariable Private 
                                   f32_2 %340 = OpConstantComposite %127 %127 
                                   f32_2 %343 = OpConstantComposite %267 %267 
                                         %345 = OpTypePointer Private %215 
                         Private bool_2* %346 = OpVariable Private 
                                     f32 %366 = OpConstant 3.674022E-40 
                                         %376 = OpTypePointer Output %14 
                           Output f32_4* %377 = OpVariable Output 
                                         %395 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                           Function f32* %144 = OpVariable Function 
                           Function f32* %155 = OpVariable Function 
                           Function f32* %167 = OpVariable Function 
                           Function f32* %178 = OpVariable Function 
                           Function f32* %189 = OpVariable Function 
                           Function f32* %200 = OpVariable Function 
                         Function f32_3* %226 = OpVariable Function 
                           Function f32* %230 = OpVariable Function 
                           Function f32* %243 = OpVariable Function 
                           Function f32* %312 = OpVariable Function 
                                    f32_2 %13 = OpLoad vs_TEXCOORD0 
                           Uniform f32_4* %21 = OpAccessChain %17 %19 
                                    f32_4 %22 = OpLoad %21 
                                    f32_2 %23 = OpVectorShuffle %22 %22 0 1 
                                    f32_2 %24 = OpFMul %13 %23 
                           Uniform f32_4* %25 = OpAccessChain %17 %19 
                                    f32_4 %26 = OpLoad %25 
                                    f32_2 %27 = OpVectorShuffle %26 %26 2 3 
                                    f32_2 %28 = OpFAdd %24 %27 
                                    f32_3 %29 = OpLoad %9 
                                    f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
                                                  OpStore %9 %30 
                                    f32_3 %31 = OpLoad %9 
                                    f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                           Uniform f32_4* %34 = OpAccessChain %17 %33 
                                    f32_4 %35 = OpLoad %34 
                                    f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                    f32_2 %37 = OpFMul %32 %36 
                                    f32_3 %38 = OpLoad %9 
                                    f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                                  OpStore %9 %39 
                             Uniform f32* %44 = OpAccessChain %17 %42 
                                      f32 %45 = OpLoad %44 
                                      f32 %47 = OpFMul %45 %46 
                             Private f32* %51 = OpAccessChain %41 %49 
                                                  OpStore %51 %47 
                                    f32_3 %53 = OpLoad %9 
                                    f32_2 %54 = OpVectorShuffle %53 %53 0 1 
                                    f32_2 %55 = OpLoad %41 
                                    f32_2 %56 = OpVectorShuffle %55 %55 0 0 
                                    f32_2 %57 = OpFDiv %54 %56 
                                    f32_3 %58 = OpLoad %52 
                                    f32_3 %59 = OpVectorShuffle %58 %57 3 4 2 
                                                  OpStore %52 %59 
                                    f32_3 %60 = OpLoad %9 
                                    f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                    f32_2 %64 = OpFMul %61 %63 
                                    f32_3 %65 = OpLoad %9 
                                    f32_3 %66 = OpVectorShuffle %65 %64 3 4 2 
                                                  OpStore %9 %66 
                                    f32_3 %67 = OpLoad %52 
                                    f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                    f32_2 %69 = OpExtInst %1 8 %68 
                                    f32_3 %70 = OpLoad %52 
                                    f32_3 %71 = OpVectorShuffle %70 %69 3 4 2 
                                                  OpStore %52 %71 
                                    f32_2 %72 = OpLoad %41 
                                    f32_2 %73 = OpVectorShuffle %72 %72 0 0 
                                    f32_3 %74 = OpLoad %52 
                                    f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                    f32_2 %76 = OpFMul %73 %75 
                                                  OpStore %41 %76 
                                    f32_2 %77 = OpLoad %41 
                           Uniform f32_4* %78 = OpAccessChain %17 %33 
                                    f32_4 %79 = OpLoad %78 
                                    f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                    f32_2 %81 = OpFDiv %77 %80 
                                                  OpStore %41 %81 
                      read_only Texture2D %85 = OpLoad %84 
                                  sampler %89 = OpLoad %88 
               read_only Texture2DSampled %91 = OpSampledImage %85 %89 
                                    f32_2 %92 = OpLoad %41 
                                    f32_4 %93 = OpImageSampleImplicitLod %91 %92 
                                    f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                                  OpStore %52 %94 
                             Private f32* %96 = OpAccessChain %52 %95 
                                      f32 %97 = OpLoad %96 
                             Private f32* %98 = OpAccessChain %52 %49 
                                      f32 %99 = OpLoad %98 
                                     f32 %100 = OpFAdd %97 %99 
                            Private f32* %101 = OpAccessChain %41 %49 
                                                  OpStore %101 %100 
                            Private f32* %102 = OpAccessChain %41 %49 
                                     f32 %103 = OpLoad %102 
                            Uniform f32* %105 = OpAccessChain %17 %104 
                                     f32 %106 = OpLoad %105 
                                     f32 %107 = OpFDiv %103 %106 
                            Private f32* %108 = OpAccessChain %41 %49 
                                                  OpStore %108 %107 
                                   f32_2 %118 = OpLoad %41 
                                   f32_4 %119 = OpVectorShuffle %118 %118 0 0 0 0 
                                  bool_4 %120 = OpFOrdLessThan %117 %119 
                                                  OpStore %112 %120 
                                   f32_2 %129 = OpLoad %41 
                                   f32_4 %130 = OpVectorShuffle %129 %129 0 0 0 0 
                                  bool_4 %131 = OpFOrdLessThan %128 %130 
                                  bool_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                                  OpStore %123 %132 
                           Private bool* %134 = OpAccessChain %112 %49 
                                    bool %135 = OpLoad %134 
                                     f32 %138 = OpSelect %135 %136 %137 
                            Private f32* %139 = OpAccessChain %41 %49 
                                                  OpStore %139 %138 
                           Private bool* %141 = OpAccessChain %112 %140 
                                    bool %142 = OpLoad %141 
                                                  OpSelectionMerge %146 None 
                                                  OpBranchConditional %142 %145 %148 
                                         %145 = OpLabel 
                                                  OpStore %144 %147 
                                                  OpBranch %146 
                                         %148 = OpLabel 
                            Private f32* %149 = OpAccessChain %41 %49 
                                     f32 %150 = OpLoad %149 
                                                  OpStore %144 %150 
                                                  OpBranch %146 
                                         %146 = OpLabel 
                                     f32 %151 = OpLoad %144 
                            Private f32* %152 = OpAccessChain %41 %49 
                                                  OpStore %152 %151 
                           Private bool* %153 = OpAccessChain %112 %95 
                                    bool %154 = OpLoad %153 
                                                  OpSelectionMerge %157 None 
                                                  OpBranchConditional %154 %156 %159 
                                         %156 = OpLabel 
                                                  OpStore %155 %158 
                                                  OpBranch %157 
                                         %159 = OpLabel 
                            Private f32* %160 = OpAccessChain %41 %49 
                                     f32 %161 = OpLoad %160 
                                                  OpStore %155 %161 
                                                  OpBranch %157 
                                         %157 = OpLabel 
                                     f32 %162 = OpLoad %155 
                            Private f32* %163 = OpAccessChain %41 %49 
                                                  OpStore %163 %162 
                           Private bool* %165 = OpAccessChain %112 %164 
                                    bool %166 = OpLoad %165 
                                                  OpSelectionMerge %169 None 
                                                  OpBranchConditional %166 %168 %171 
                                         %168 = OpLabel 
                                                  OpStore %167 %170 
                                                  OpBranch %169 
                                         %171 = OpLabel 
                            Private f32* %172 = OpAccessChain %41 %49 
                                     f32 %173 = OpLoad %172 
                                                  OpStore %167 %173 
                                                  OpBranch %169 
                                         %169 = OpLabel 
                                     f32 %174 = OpLoad %167 
                            Private f32* %175 = OpAccessChain %41 %49 
                                                  OpStore %175 %174 
                           Private bool* %176 = OpAccessChain %123 %49 
                                    bool %177 = OpLoad %176 
                                                  OpSelectionMerge %180 None 
                                                  OpBranchConditional %177 %179 %182 
                                         %179 = OpLabel 
                                                  OpStore %178 %181 
                                                  OpBranch %180 
                                         %182 = OpLabel 
                            Private f32* %183 = OpAccessChain %41 %49 
                                     f32 %184 = OpLoad %183 
                                                  OpStore %178 %184 
                                                  OpBranch %180 
                                         %180 = OpLabel 
                                     f32 %185 = OpLoad %178 
                            Private f32* %186 = OpAccessChain %41 %49 
                                                  OpStore %186 %185 
                           Private bool* %187 = OpAccessChain %123 %140 
                                    bool %188 = OpLoad %187 
                                                  OpSelectionMerge %191 None 
                                                  OpBranchConditional %188 %190 %193 
                                         %190 = OpLabel 
                                                  OpStore %189 %192 
                                                  OpBranch %191 
                                         %193 = OpLabel 
                            Private f32* %194 = OpAccessChain %41 %49 
                                     f32 %195 = OpLoad %194 
                                                  OpStore %189 %195 
                                                  OpBranch %191 
                                         %191 = OpLabel 
                                     f32 %196 = OpLoad %189 
                            Private f32* %197 = OpAccessChain %41 %49 
                                                  OpStore %197 %196 
                           Private bool* %198 = OpAccessChain %123 %95 
                                    bool %199 = OpLoad %198 
                                                  OpSelectionMerge %202 None 
                                                  OpBranchConditional %199 %201 %204 
                                         %201 = OpLabel 
                                                  OpStore %200 %203 
                                                  OpBranch %202 
                                         %204 = OpLabel 
                            Private f32* %205 = OpAccessChain %41 %49 
                                     f32 %206 = OpLoad %205 
                                                  OpStore %200 %206 
                                                  OpBranch %202 
                                         %202 = OpLabel 
                                     f32 %207 = OpLoad %200 
                            Private f32* %208 = OpAccessChain %41 %49 
                                                  OpStore %208 %207 
                                   f32_3 %209 = OpLoad %9 
                                   f32_4 %210 = OpVectorShuffle %209 %209 0 1 0 0 
                                   f32_3 %211 = OpLoad %9 
                                   f32_4 %212 = OpVectorShuffle %211 %211 0 1 0 0 
                                   f32_4 %213 = OpFNegate %212 
                                  bool_4 %214 = OpFOrdGreaterThanEqual %210 %213 
                                  bool_2 %216 = OpVectorShuffle %214 %214 0 1 
                                  bool_4 %217 = OpLoad %112 
                                  bool_4 %218 = OpVectorShuffle %217 %216 4 5 2 3 
                                                  OpStore %112 %218 
                                   f32_3 %219 = OpLoad %9 
                                   f32_2 %220 = OpVectorShuffle %219 %219 0 1 
                                   f32_2 %221 = OpExtInst %1 4 %220 
                                   f32_2 %222 = OpExtInst %1 10 %221 
                                   f32_3 %223 = OpLoad %9 
                                   f32_3 %224 = OpVectorShuffle %223 %222 3 4 2 
                                                  OpStore %9 %224 
                                   f32_3 %227 = OpLoad %9 
                                                  OpStore %226 %227 
                           Private bool* %228 = OpAccessChain %112 %49 
                                    bool %229 = OpLoad %228 
                                                  OpSelectionMerge %232 None 
                                                  OpBranchConditional %229 %231 %235 
                                         %231 = OpLabel 
                            Private f32* %233 = OpAccessChain %9 %49 
                                     f32 %234 = OpLoad %233 
                                                  OpStore %230 %234 
                                                  OpBranch %232 
                                         %235 = OpLabel 
                            Private f32* %236 = OpAccessChain %9 %49 
                                     f32 %237 = OpLoad %236 
                                     f32 %238 = OpFNegate %237 
                                                  OpStore %230 %238 
                                                  OpBranch %232 
                                         %232 = OpLabel 
                                     f32 %239 = OpLoad %230 
                           Function f32* %240 = OpAccessChain %226 %49 
                                                  OpStore %240 %239 
                           Private bool* %241 = OpAccessChain %112 %140 
                                    bool %242 = OpLoad %241 
                                                  OpSelectionMerge %245 None 
                                                  OpBranchConditional %242 %244 %248 
                                         %244 = OpLabel 
                            Private f32* %246 = OpAccessChain %9 %140 
                                     f32 %247 = OpLoad %246 
                                                  OpStore %243 %247 
                                                  OpBranch %245 
                                         %248 = OpLabel 
                            Private f32* %249 = OpAccessChain %9 %140 
                                     f32 %250 = OpLoad %249 
                                     f32 %251 = OpFNegate %250 
                                                  OpStore %243 %251 
                                                  OpBranch %245 
                                         %245 = OpLabel 
                                     f32 %252 = OpLoad %243 
                           Function f32* %253 = OpAccessChain %226 %140 
                                                  OpStore %253 %252 
                                   f32_3 %254 = OpLoad %226 
                                                  OpStore %9 %254 
                                   f32_3 %255 = OpLoad %9 
                                   f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                   f32_2 %259 = OpFMul %256 %258 
                                   f32_2 %262 = OpFAdd %259 %261 
                                   f32_3 %263 = OpLoad %9 
                                   f32_3 %264 = OpVectorShuffle %263 %262 3 4 2 
                                                  OpStore %9 %264 
                                   f32_3 %265 = OpLoad %9 
                                   f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                                   f32_2 %270 = OpFMul %266 %269 
                                   f32_2 %273 = OpFAdd %270 %272 
                                   f32_3 %274 = OpLoad %9 
                                   f32_3 %275 = OpVectorShuffle %274 %273 3 4 2 
                                                  OpStore %9 %275 
                                   f32_3 %276 = OpLoad %9 
                                   f32_2 %277 = OpVectorShuffle %276 %276 0 1 
                                   f32_2 %278 = OpExtInst %1 8 %277 
                                   f32_3 %279 = OpLoad %9 
                                   f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                  OpStore %9 %280 
                            Private f32* %282 = OpAccessChain %9 %140 
                                     f32 %283 = OpLoad %282 
                                     f32 %285 = OpFMul %283 %284 
                            Private f32* %286 = OpAccessChain %9 %49 
                                     f32 %287 = OpLoad %286 
                                     f32 %288 = OpFAdd %285 %287 
                                                  OpStore %281 %288 
                                     f32 %289 = OpLoad %281 
                                     f32 %290 = OpExtInst %1 29 %289 
                                                  OpStore %281 %290 
                            Private f32* %291 = OpAccessChain %41 %49 
                                     f32 %292 = OpLoad %291 
                                     f32 %293 = OpLoad %281 
                                     f32 %294 = OpFDiv %292 %293 
                            Private f32* %295 = OpAccessChain %41 %49 
                                                  OpStore %295 %294 
                            Private f32* %296 = OpAccessChain %41 %49 
                                     f32 %297 = OpLoad %296 
                                     f32 %298 = OpFMul %297 %116 
                            Private f32* %299 = OpAccessChain %41 %49 
                                                  OpStore %299 %298 
                            Private f32* %301 = OpAccessChain %41 %49 
                                     f32 %302 = OpLoad %301 
                            Private f32* %303 = OpAccessChain %41 %49 
                                     f32 %304 = OpLoad %303 
                                     f32 %305 = OpFNegate %304 
                                    bool %306 = OpFOrdGreaterThanEqual %302 %305 
                                                  OpStore %300 %306 
                            Private f32* %307 = OpAccessChain %41 %49 
                                     f32 %308 = OpLoad %307 
                                     f32 %309 = OpExtInst %1 10 %308 
                            Private f32* %310 = OpAccessChain %41 %49 
                                                  OpStore %310 %309 
                                    bool %311 = OpLoad %300 
                                                  OpSelectionMerge %314 None 
                                                  OpBranchConditional %311 %313 %317 
                                         %313 = OpLabel 
                            Private f32* %315 = OpAccessChain %41 %49 
                                     f32 %316 = OpLoad %315 
                                                  OpStore %312 %316 
                                                  OpBranch %314 
                                         %317 = OpLabel 
                            Private f32* %318 = OpAccessChain %41 %49 
                                     f32 %319 = OpLoad %318 
                                     f32 %320 = OpFNegate %319 
                                                  OpStore %312 %320 
                                                  OpBranch %314 
                                         %314 = OpLabel 
                                     f32 %321 = OpLoad %312 
                            Private f32* %322 = OpAccessChain %41 %49 
                                                  OpStore %322 %321 
                            Private f32* %323 = OpAccessChain %41 %49 
                                     f32 %324 = OpLoad %323 
                            Private f32* %325 = OpAccessChain %41 %49 
                                     f32 %326 = OpLoad %325 
                                     f32 %327 = OpFAdd %324 %326 
                            Private f32* %328 = OpAccessChain %41 %49 
                                                  OpStore %328 %327 
                            Private f32* %331 = OpAccessChain %41 %49 
                                     f32 %332 = OpLoad %331 
                                     i32 %333 = OpConvertFToS %332 
                                                  OpStore %330 %333 
                                     i32 %335 = OpLoad %330 
                                    bool %336 = OpIEqual %335 %42 
                                                  OpStore %334 %336 
                                   f32_3 %338 = OpLoad %9 
                                   f32_2 %339 = OpVectorShuffle %338 %338 0 1 
                                   f32_2 %341 = OpExtInst %1 40 %339 %340 
                                                  OpStore %337 %341 
                                   f32_2 %342 = OpLoad %337 
                                   f32_2 %344 = OpExtInst %1 37 %342 %343 
                                                  OpStore %337 %344 
                                   f32_3 %347 = OpLoad %9 
                                   f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                   f32_2 %349 = OpLoad %337 
                                   f32_4 %350 = OpVectorShuffle %349 %349 0 1 0 0 
                                  bool_4 %351 = OpFOrdEqual %348 %350 
                                  bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                  OpStore %346 %352 
                           Private bool* %353 = OpAccessChain %346 %140 
                                    bool %354 = OpLoad %353 
                           Private bool* %355 = OpAccessChain %346 %49 
                                    bool %356 = OpLoad %355 
                                    bool %357 = OpLogicalAnd %354 %356 
                           Private bool* %358 = OpAccessChain %346 %49 
                                                  OpStore %358 %357 
                                    bool %359 = OpLoad %334 
                           Private bool* %360 = OpAccessChain %346 %49 
                                    bool %361 = OpLoad %360 
                                    bool %362 = OpLogicalAnd %359 %361 
                           Private bool* %363 = OpAccessChain %346 %49 
                                                  OpStore %363 %362 
                           Private bool* %364 = OpAccessChain %346 %49 
                                    bool %365 = OpLoad %364 
                                     f32 %367 = OpSelect %365 %366 %127 
                            Private f32* %368 = OpAccessChain %9 %49 
                                                  OpStore %368 %367 
                                   f32_3 %369 = OpLoad %52 
                                   f32_3 %370 = OpLoad %9 
                                   f32_3 %371 = OpVectorShuffle %370 %370 0 0 0 
                                   f32_3 %372 = OpFMul %369 %371 
                                   f32_3 %373 = OpLoad %52 
                                   f32_3 %374 = OpFNegate %373 
                                   f32_3 %375 = OpFAdd %372 %374 
                                                  OpStore %9 %375 
                            Uniform f32* %378 = OpAccessChain %17 %42 
                                     f32 %379 = OpLoad %378 
                            Uniform f32* %380 = OpAccessChain %17 %42 
                                     f32 %381 = OpLoad %380 
                            Uniform f32* %382 = OpAccessChain %17 %42 
                                     f32 %383 = OpLoad %382 
                                   f32_3 %384 = OpCompositeConstruct %379 %381 %383 
                                     f32 %385 = OpCompositeExtract %384 0 
                                     f32 %386 = OpCompositeExtract %384 1 
                                     f32 %387 = OpCompositeExtract %384 2 
                                   f32_3 %388 = OpCompositeConstruct %385 %386 %387 
                                   f32_3 %389 = OpLoad %9 
                                   f32_3 %390 = OpFMul %388 %389 
                                   f32_3 %391 = OpLoad %52 
                                   f32_3 %392 = OpFAdd %390 %391 
                                   f32_4 %393 = OpLoad %377 
                                   f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
                                                  OpStore %377 %394 
                             Output f32* %396 = OpAccessChain %377 %164 
                                                  OpStore %396 %366 
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