//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Vision_Tunnel" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35557
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
uniform 	float _Value;
uniform 	float _Value2;
uniform 	float _Value3;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = max(abs(u_xlat6.y), abs(u_xlat6.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat4 = min(abs(u_xlat6.y), abs(u_xlat6.x));
    u_xlat1.x = u_xlat1.x * u_xlat4;
    u_xlat4 = u_xlat1.x * u_xlat1.x;
    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
    u_xlat7 = u_xlat4 * u_xlat1.x;
    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat6.y)<abs(u_xlat6.x);
    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
    u_xlatb4 = u_xlat6.y<(-u_xlat6.y);
    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat4 + u_xlat1.x;
    u_xlat4 = min(u_xlat6.y, u_xlat6.x);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat7 = max(u_xlat6.y, u_xlat6.x);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlatb9 = u_xlat7>=(-u_xlat7);
    u_xlatb9 = u_xlatb9 && u_xlatb4;
    u_xlat9 = (u_xlatb9) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat9 = u_xlat9 * 0.318309158;
    u_xlat1.x = u_xlat9 / _Value3;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.y = (-_Value3) * u_xlat1.x + u_xlat9;
    u_xlat9 = 0.100000001 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat1.x = (-u_xlat9) + 0.800000012;
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat9 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat9;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Value);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat6.xxx + (-u_xlat2.xyz);
    u_xlat1.x = _Value + -0.0500000007;
    u_xlat1.x = u_xlat1.x + (-_Value2);
    u_xlat1.x = u_xlat1.x + (-_Value);
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat2.xyz;
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
; Bound: 359
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %11 %346 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 Location 11 
                                                OpMemberDecorate %14 0 Offset 14 
                                                OpMemberDecorate %14 1 Offset 14 
                                                OpMemberDecorate %14 2 Offset 14 
                                                OpMemberDecorate %14 3 Offset 14 
                                                OpDecorate %14 Block 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate %228 DescriptorSet 228 
                                                OpDecorate %228 Binding 228 
                                                OpDecorate %232 DescriptorSet 232 
                                                OpDecorate %232 Binding 232 
                                                OpDecorate %346 Location 346 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 2 
                                         %8 = OpTypePointer Private %7 
                          Private f32_2* %9 = OpVariable Private 
                                        %10 = OpTypePointer Input %7 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        %13 = OpTypeVector %6 4 
                                        %14 = OpTypeStruct %6 %6 %6 %13 
                                        %15 = OpTypePointer Uniform %14 
Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
                                        %17 = OpTypeInt 32 1 
                                    i32 %18 = OpConstant 3 
                                        %19 = OpTypePointer Uniform %13 
                         Private f32_2* %28 = OpVariable Private 
                                    f32 %31 = OpConstant 3.674022E-40 
                                  f32_2 %32 = OpConstantComposite %31 %31 
                                    f32 %34 = OpConstant 3.674022E-40 
                                  f32_2 %35 = OpConstantComposite %34 %34 
                                        %37 = OpTypeVector %6 3 
                                        %38 = OpTypePointer Private %37 
                         Private f32_3* %39 = OpVariable Private 
                                        %40 = OpTypeInt 32 0 
                                    u32 %41 = OpConstant 1 
                                        %42 = OpTypePointer Private %6 
                                    u32 %46 = OpConstant 0 
                                    f32 %52 = OpConstant 3.674022E-40 
                           Private f32* %57 = OpVariable Private 
                           Private f32* %75 = OpVariable Private 
                                    f32 %77 = OpConstant 3.674022E-40 
                                    f32 %79 = OpConstant 3.674022E-40 
                                    f32 %84 = OpConstant 3.674022E-40 
                                    f32 %89 = OpConstant 3.674022E-40 
                                    f32 %94 = OpConstant 3.674022E-40 
                                   f32 %101 = OpConstant 3.674022E-40 
                                   f32 %103 = OpConstant 3.674022E-40 
                                       %105 = OpTypeBool 
                                       %106 = OpTypePointer Private %105 
                         Private bool* %107 = OpVariable Private 
                                   f32 %117 = OpConstant 3.674022E-40 
                         Private bool* %126 = OpVariable Private 
                                   f32 %134 = OpConstant 3.674022E-40 
                         Private bool* %163 = OpVariable Private 
                          Private f32* %171 = OpVariable Private 
                                       %173 = OpTypePointer Function %6 
                                   f32 %185 = OpConstant 3.674022E-40 
                                   i32 %188 = OpConstant 2 
                                       %189 = OpTypePointer Uniform %6 
                                   f32 %207 = OpConstant 3.674022E-40 
                                   f32 %223 = OpConstant 3.674022E-40 
                                       %226 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                       %227 = OpTypePointer UniformConstant %226 
  UniformConstant read_only Texture2D* %228 = OpVariable UniformConstant 
                                       %230 = OpTypeSampler 
                                       %231 = OpTypePointer UniformConstant %230 
              UniformConstant sampler* %232 = OpVariable UniformConstant 
                                       %234 = OpTypeSampledImage %226 
                                   f32 %243 = OpConstant 3.674022E-40 
                        Private f32_3* %256 = OpVariable Private 
                                   f32 %265 = OpConstant 3.674022E-40 
                                 f32_2 %266 = OpConstantComposite %265 %265 
                                   i32 %278 = OpConstant 0 
                        Private f32_3* %284 = OpVariable Private 
                                   f32 %294 = OpConstant 3.674022E-40 
                                   i32 %299 = OpConstant 1 
                                       %345 = OpTypePointer Output %13 
                         Output f32_4* %346 = OpVariable Output 
                                   u32 %355 = OpConstant 3 
                                       %356 = OpTypePointer Output %6 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                         Function f32* %174 = OpVariable Function 
                                  f32_2 %12 = OpLoad vs_TEXCOORD0 
                         Uniform f32_4* %20 = OpAccessChain %16 %18 
                                  f32_4 %21 = OpLoad %20 
                                  f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                  f32_2 %23 = OpFMul %12 %22 
                         Uniform f32_4* %24 = OpAccessChain %16 %18 
                                  f32_4 %25 = OpLoad %24 
                                  f32_2 %26 = OpVectorShuffle %25 %25 2 3 
                                  f32_2 %27 = OpFAdd %23 %26 
                                                OpStore %9 %27 
                                  f32_2 %29 = OpLoad %9 
                                  f32_2 %30 = OpVectorShuffle %29 %29 1 0 
                                  f32_2 %33 = OpFMul %30 %32 
                                  f32_2 %36 = OpFAdd %33 %35 
                                                OpStore %28 %36 
                           Private f32* %43 = OpAccessChain %28 %41 
                                    f32 %44 = OpLoad %43 
                                    f32 %45 = OpExtInst %1 4 %44 
                           Private f32* %47 = OpAccessChain %28 %46 
                                    f32 %48 = OpLoad %47 
                                    f32 %49 = OpExtInst %1 4 %48 
                                    f32 %50 = OpExtInst %1 40 %45 %49 
                           Private f32* %51 = OpAccessChain %39 %46 
                                                OpStore %51 %50 
                           Private f32* %53 = OpAccessChain %39 %46 
                                    f32 %54 = OpLoad %53 
                                    f32 %55 = OpFDiv %52 %54 
                           Private f32* %56 = OpAccessChain %39 %46 
                                                OpStore %56 %55 
                           Private f32* %58 = OpAccessChain %28 %41 
                                    f32 %59 = OpLoad %58 
                                    f32 %60 = OpExtInst %1 4 %59 
                           Private f32* %61 = OpAccessChain %28 %46 
                                    f32 %62 = OpLoad %61 
                                    f32 %63 = OpExtInst %1 4 %62 
                                    f32 %64 = OpExtInst %1 37 %60 %63 
                                                OpStore %57 %64 
                           Private f32* %65 = OpAccessChain %39 %46 
                                    f32 %66 = OpLoad %65 
                                    f32 %67 = OpLoad %57 
                                    f32 %68 = OpFMul %66 %67 
                           Private f32* %69 = OpAccessChain %39 %46 
                                                OpStore %69 %68 
                           Private f32* %70 = OpAccessChain %39 %46 
                                    f32 %71 = OpLoad %70 
                           Private f32* %72 = OpAccessChain %39 %46 
                                    f32 %73 = OpLoad %72 
                                    f32 %74 = OpFMul %71 %73 
                                                OpStore %57 %74 
                                    f32 %76 = OpLoad %57 
                                    f32 %78 = OpFMul %76 %77 
                                    f32 %80 = OpFAdd %78 %79 
                                                OpStore %75 %80 
                                    f32 %81 = OpLoad %57 
                                    f32 %82 = OpLoad %75 
                                    f32 %83 = OpFMul %81 %82 
                                    f32 %85 = OpFAdd %83 %84 
                                                OpStore %75 %85 
                                    f32 %86 = OpLoad %57 
                                    f32 %87 = OpLoad %75 
                                    f32 %88 = OpFMul %86 %87 
                                    f32 %90 = OpFAdd %88 %89 
                                                OpStore %75 %90 
                                    f32 %91 = OpLoad %57 
                                    f32 %92 = OpLoad %75 
                                    f32 %93 = OpFMul %91 %92 
                                    f32 %95 = OpFAdd %93 %94 
                                                OpStore %57 %95 
                                    f32 %96 = OpLoad %57 
                           Private f32* %97 = OpAccessChain %39 %46 
                                    f32 %98 = OpLoad %97 
                                    f32 %99 = OpFMul %96 %98 
                                                OpStore %75 %99 
                                   f32 %100 = OpLoad %75 
                                   f32 %102 = OpFMul %100 %101 
                                   f32 %104 = OpFAdd %102 %103 
                                                OpStore %75 %104 
                          Private f32* %108 = OpAccessChain %28 %41 
                                   f32 %109 = OpLoad %108 
                                   f32 %110 = OpExtInst %1 4 %109 
                          Private f32* %111 = OpAccessChain %28 %46 
                                   f32 %112 = OpLoad %111 
                                   f32 %113 = OpExtInst %1 4 %112 
                                  bool %114 = OpFOrdLessThan %110 %113 
                                                OpStore %107 %114 
                                  bool %115 = OpLoad %107 
                                   f32 %116 = OpLoad %75 
                                   f32 %118 = OpSelect %115 %116 %117 
                                                OpStore %75 %118 
                          Private f32* %119 = OpAccessChain %39 %46 
                                   f32 %120 = OpLoad %119 
                                   f32 %121 = OpLoad %57 
                                   f32 %122 = OpFMul %120 %121 
                                   f32 %123 = OpLoad %75 
                                   f32 %124 = OpFAdd %122 %123 
                          Private f32* %125 = OpAccessChain %39 %46 
                                                OpStore %125 %124 
                          Private f32* %127 = OpAccessChain %28 %41 
                                   f32 %128 = OpLoad %127 
                          Private f32* %129 = OpAccessChain %28 %41 
                                   f32 %130 = OpLoad %129 
                                   f32 %131 = OpFNegate %130 
                                  bool %132 = OpFOrdLessThan %128 %131 
                                                OpStore %126 %132 
                                  bool %133 = OpLoad %126 
                                   f32 %135 = OpSelect %133 %134 %117 
                                                OpStore %57 %135 
                                   f32 %136 = OpLoad %57 
                          Private f32* %137 = OpAccessChain %39 %46 
                                   f32 %138 = OpLoad %137 
                                   f32 %139 = OpFAdd %136 %138 
                          Private f32* %140 = OpAccessChain %39 %46 
                                                OpStore %140 %139 
                          Private f32* %141 = OpAccessChain %28 %41 
                                   f32 %142 = OpLoad %141 
                          Private f32* %143 = OpAccessChain %28 %46 
                                   f32 %144 = OpLoad %143 
                                   f32 %145 = OpExtInst %1 37 %142 %144 
                                                OpStore %57 %145 
                                   f32 %146 = OpLoad %57 
                                   f32 %147 = OpLoad %57 
                                   f32 %148 = OpFNegate %147 
                                  bool %149 = OpFOrdLessThan %146 %148 
                                                OpStore %126 %149 
                          Private f32* %150 = OpAccessChain %28 %41 
                                   f32 %151 = OpLoad %150 
                          Private f32* %152 = OpAccessChain %28 %46 
                                   f32 %153 = OpLoad %152 
                                   f32 %154 = OpExtInst %1 40 %151 %153 
                                                OpStore %75 %154 
                                 f32_2 %155 = OpLoad %28 
                                 f32_2 %156 = OpLoad %28 
                                   f32 %157 = OpDot %155 %156 
                          Private f32* %158 = OpAccessChain %28 %46 
                                                OpStore %158 %157 
                          Private f32* %159 = OpAccessChain %28 %46 
                                   f32 %160 = OpLoad %159 
                                   f32 %161 = OpExtInst %1 31 %160 
                          Private f32* %162 = OpAccessChain %28 %46 
                                                OpStore %162 %161 
                                   f32 %164 = OpLoad %75 
                                   f32 %165 = OpLoad %75 
                                   f32 %166 = OpFNegate %165 
                                  bool %167 = OpFOrdGreaterThanEqual %164 %166 
                                                OpStore %163 %167 
                                  bool %168 = OpLoad %163 
                                  bool %169 = OpLoad %126 
                                  bool %170 = OpLogicalAnd %168 %169 
                                                OpStore %163 %170 
                                  bool %172 = OpLoad %163 
                                                OpSelectionMerge %176 None 
                                                OpBranchConditional %172 %175 %180 
                                       %175 = OpLabel 
                          Private f32* %177 = OpAccessChain %39 %46 
                                   f32 %178 = OpLoad %177 
                                   f32 %179 = OpFNegate %178 
                                                OpStore %174 %179 
                                                OpBranch %176 
                                       %180 = OpLabel 
                          Private f32* %181 = OpAccessChain %39 %46 
                                   f32 %182 = OpLoad %181 
                                                OpStore %174 %182 
                                                OpBranch %176 
                                       %176 = OpLabel 
                                   f32 %183 = OpLoad %174 
                                                OpStore %171 %183 
                                   f32 %184 = OpLoad %171 
                                   f32 %186 = OpFMul %184 %185 
                                                OpStore %171 %186 
                                   f32 %187 = OpLoad %171 
                          Uniform f32* %190 = OpAccessChain %16 %188 
                                   f32 %191 = OpLoad %190 
                                   f32 %192 = OpFDiv %187 %191 
                          Private f32* %193 = OpAccessChain %39 %46 
                                                OpStore %193 %192 
                          Private f32* %194 = OpAccessChain %39 %46 
                                   f32 %195 = OpLoad %194 
                                   f32 %196 = OpExtInst %1 8 %195 
                          Private f32* %197 = OpAccessChain %39 %46 
                                                OpStore %197 %196 
                          Uniform f32* %198 = OpAccessChain %16 %188 
                                   f32 %199 = OpLoad %198 
                                   f32 %200 = OpFNegate %199 
                          Private f32* %201 = OpAccessChain %39 %46 
                                   f32 %202 = OpLoad %201 
                                   f32 %203 = OpFMul %200 %202 
                                   f32 %204 = OpLoad %171 
                                   f32 %205 = OpFAdd %203 %204 
                          Private f32* %206 = OpAccessChain %39 %41 
                                                OpStore %206 %205 
                          Private f32* %208 = OpAccessChain %28 %46 
                                   f32 %209 = OpLoad %208 
                                   f32 %210 = OpFDiv %207 %209 
                                                OpStore %171 %210 
                          Private f32* %211 = OpAccessChain %28 %46 
                                   f32 %212 = OpLoad %211 
                          Private f32* %213 = OpAccessChain %28 %46 
                                   f32 %214 = OpLoad %213 
                                   f32 %215 = OpFAdd %212 %214 
                          Private f32* %216 = OpAccessChain %28 %46 
                                                OpStore %216 %215 
                          Private f32* %217 = OpAccessChain %28 %46 
                                   f32 %218 = OpLoad %217 
                                   f32 %219 = OpExtInst %1 37 %218 %52 
                          Private f32* %220 = OpAccessChain %28 %46 
                                                OpStore %220 %219 
                                   f32 %221 = OpLoad %171 
                                   f32 %222 = OpFNegate %221 
                                   f32 %224 = OpFAdd %222 %223 
                          Private f32* %225 = OpAccessChain %39 %46 
                                                OpStore %225 %224 
                   read_only Texture2D %229 = OpLoad %228 
                               sampler %233 = OpLoad %232 
            read_only Texture2DSampled %235 = OpSampledImage %229 %233 
                                 f32_3 %236 = OpLoad %39 
                                 f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                 f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                 f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                                OpStore %39 %239 
                          Private f32* %240 = OpAccessChain %28 %46 
                                   f32 %241 = OpLoad %240 
                                   f32 %242 = OpFMul %241 %101 
                                   f32 %244 = OpFAdd %242 %243 
                                                OpStore %171 %244 
                          Private f32* %245 = OpAccessChain %28 %46 
                                   f32 %246 = OpLoad %245 
                          Private f32* %247 = OpAccessChain %28 %46 
                                   f32 %248 = OpLoad %247 
                                   f32 %249 = OpFMul %246 %248 
                          Private f32* %250 = OpAccessChain %28 %46 
                                                OpStore %250 %249 
                          Private f32* %251 = OpAccessChain %28 %46 
                                   f32 %252 = OpLoad %251 
                                   f32 %253 = OpLoad %171 
                                   f32 %254 = OpFMul %252 %253 
                          Private f32* %255 = OpAccessChain %28 %46 
                                                OpStore %255 %254 
                   read_only Texture2D %257 = OpLoad %228 
                               sampler %258 = OpLoad %232 
            read_only Texture2DSampled %259 = OpSampledImage %257 %258 
                                 f32_2 %260 = OpLoad %9 
                                 f32_4 %261 = OpImageSampleImplicitLod %259 %260 
                                 f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                                OpStore %256 %262 
                                 f32_2 %263 = OpLoad %9 
                                 f32_2 %264 = OpFNegate %263 
                                 f32_2 %267 = OpFAdd %264 %266 
                                                OpStore %9 %267 
                                 f32_2 %268 = OpLoad %9 
                                 f32_2 %269 = OpLoad %9 
                                   f32 %270 = OpDot %268 %269 
                          Private f32* %271 = OpAccessChain %9 %46 
                                                OpStore %271 %270 
                          Private f32* %272 = OpAccessChain %9 %46 
                                   f32 %273 = OpLoad %272 
                                   f32 %274 = OpExtInst %1 31 %273 
                          Private f32* %275 = OpAccessChain %9 %46 
                                                OpStore %275 %274 
                          Private f32* %276 = OpAccessChain %9 %46 
                                   f32 %277 = OpLoad %276 
                          Uniform f32* %279 = OpAccessChain %16 %278 
                                   f32 %280 = OpLoad %279 
                                   f32 %281 = OpFNegate %280 
                                   f32 %282 = OpFAdd %277 %281 
                          Private f32* %283 = OpAccessChain %9 %46 
                                                OpStore %283 %282 
                                 f32_3 %285 = OpLoad %39 
                                 f32_2 %286 = OpLoad %28 
                                 f32_3 %287 = OpVectorShuffle %286 %286 0 0 0 
                                 f32_3 %288 = OpFMul %285 %287 
                                 f32_3 %289 = OpLoad %256 
                                 f32_3 %290 = OpFNegate %289 
                                 f32_3 %291 = OpFAdd %288 %290 
                                                OpStore %284 %291 
                          Uniform f32* %292 = OpAccessChain %16 %278 
                                   f32 %293 = OpLoad %292 
                                   f32 %295 = OpFAdd %293 %294 
                          Private f32* %296 = OpAccessChain %39 %46 
                                                OpStore %296 %295 
                          Private f32* %297 = OpAccessChain %39 %46 
                                   f32 %298 = OpLoad %297 
                          Uniform f32* %300 = OpAccessChain %16 %299 
                                   f32 %301 = OpLoad %300 
                                   f32 %302 = OpFNegate %301 
                                   f32 %303 = OpFAdd %298 %302 
                          Private f32* %304 = OpAccessChain %39 %46 
                                                OpStore %304 %303 
                          Private f32* %305 = OpAccessChain %39 %46 
                                   f32 %306 = OpLoad %305 
                          Uniform f32* %307 = OpAccessChain %16 %278 
                                   f32 %308 = OpLoad %307 
                                   f32 %309 = OpFNegate %308 
                                   f32 %310 = OpFAdd %306 %309 
                          Private f32* %311 = OpAccessChain %39 %46 
                                                OpStore %311 %310 
                          Private f32* %312 = OpAccessChain %39 %46 
                                   f32 %313 = OpLoad %312 
                                   f32 %314 = OpFDiv %52 %313 
                          Private f32* %315 = OpAccessChain %39 %46 
                                                OpStore %315 %314 
                          Private f32* %316 = OpAccessChain %9 %46 
                                   f32 %317 = OpLoad %316 
                          Private f32* %318 = OpAccessChain %39 %46 
                                   f32 %319 = OpLoad %318 
                                   f32 %320 = OpFMul %317 %319 
                          Private f32* %321 = OpAccessChain %9 %46 
                                                OpStore %321 %320 
                          Private f32* %322 = OpAccessChain %9 %46 
                                   f32 %323 = OpLoad %322 
                                   f32 %324 = OpExtInst %1 43 %323 %117 %52 
                          Private f32* %325 = OpAccessChain %9 %46 
                                                OpStore %325 %324 
                          Private f32* %326 = OpAccessChain %9 %46 
                                   f32 %327 = OpLoad %326 
                                   f32 %328 = OpFMul %327 %101 
                                   f32 %329 = OpFAdd %328 %243 
                          Private f32* %330 = OpAccessChain %39 %46 
                                                OpStore %330 %329 
                          Private f32* %331 = OpAccessChain %9 %46 
                                   f32 %332 = OpLoad %331 
                          Private f32* %333 = OpAccessChain %9 %46 
                                   f32 %334 = OpLoad %333 
                                   f32 %335 = OpFMul %332 %334 
                          Private f32* %336 = OpAccessChain %9 %46 
                                                OpStore %336 %335 
                          Private f32* %337 = OpAccessChain %39 %46 
                                   f32 %338 = OpLoad %337 
                                   f32 %339 = OpFNegate %338 
                          Private f32* %340 = OpAccessChain %9 %46 
                                   f32 %341 = OpLoad %340 
                                   f32 %342 = OpFMul %339 %341 
                                   f32 %343 = OpFAdd %342 %52 
                          Private f32* %344 = OpAccessChain %9 %46 
                                                OpStore %344 %343 
                                 f32_2 %347 = OpLoad %9 
                                 f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
                                 f32_3 %349 = OpLoad %284 
                                 f32_3 %350 = OpFMul %348 %349 
                                 f32_3 %351 = OpLoad %256 
                                 f32_3 %352 = OpFAdd %350 %351 
                                 f32_4 %353 = OpLoad %346 
                                 f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                OpStore %346 %354 
                           Output f32* %357 = OpAccessChain %346 %355 
                                                OpStore %357 %52 
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