//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "CameraFilterPack/Distortion_FishEye" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_TimeX ("Time", Range(0, 1)) = 1
_Distortion ("_Distortion", Range(0, 1)) = 0.87
_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2808
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
uniform 	float _Distortion;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat3;
float u_xlat4;
float u_xlat6;
bool u_xlatb7;
vec2 u_xlat10;
float u_xlat11;
float u_xlat12;
float u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1 = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat6 = sqrt(u_xlat1);
    u_xlat11 = _Distortion + -0.5;
    u_xlat16 = u_xlat11 * 4.44289351;
    u_xlatb2 = 0.0<u_xlat11;
    if(u_xlatb2){
        u_xlat2.x = inversesqrt(u_xlat1);
        u_xlat2.xy = u_xlat10.xy * u_xlat2.xx;
        u_xlat12 = u_xlat16 * u_xlat6;
        u_xlat3 = sin(u_xlat12);
        u_xlat4 = cos(u_xlat12);
        u_xlat12 = u_xlat3 / u_xlat4;
        u_xlat2.xy = vec2(u_xlat12) * u_xlat2.xy;
        u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5);
        u_xlat12 = u_xlat11 * 2.22144675;
        u_xlat3 = sin(u_xlat12);
        u_xlat4 = cos(u_xlat12);
        u_xlat12 = u_xlat3 / u_xlat4;
        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat12);
        u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    } else {
        u_xlatb2 = u_xlat11<0.0;
        if(u_xlatb2){
            u_xlat1 = inversesqrt(u_xlat1);
            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
            u_xlat1 = (-u_xlat16) * u_xlat6;
            u_xlat1 = u_xlat1 * 10.0;
            u_xlat6 = min(abs(u_xlat1), 1.0);
            u_xlat16 = max(abs(u_xlat1), 1.0);
            u_xlat16 = float(1.0) / u_xlat16;
            u_xlat6 = u_xlat16 * u_xlat6;
            u_xlat16 = u_xlat6 * u_xlat6;
            u_xlat2.x = u_xlat16 * 0.0208350997 + -0.0851330012;
            u_xlat2.x = u_xlat16 * u_xlat2.x + 0.180141002;
            u_xlat2.x = u_xlat16 * u_xlat2.x + -0.330299497;
            u_xlat16 = u_xlat16 * u_xlat2.x + 0.999866009;
            u_xlat2.x = u_xlat16 * u_xlat6;
            u_xlatb7 = 1.0<abs(u_xlat1);
            u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
            u_xlat2.x = u_xlatb7 ? u_xlat2.x : float(0.0);
            u_xlat6 = u_xlat6 * u_xlat16 + u_xlat2.x;
            u_xlat1 = min(u_xlat1, 1.0);
            u_xlatb1 = u_xlat1<(-u_xlat1);
            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
            u_xlat10.xy = u_xlat10.xy * vec2(0.5, 0.5);
            u_xlat1 = u_xlat11 * -22.214468;
            u_xlat6 = min(abs(u_xlat1), 1.0);
            u_xlat11 = max(abs(u_xlat1), 1.0);
            u_xlat11 = float(1.0) / u_xlat11;
            u_xlat6 = u_xlat11 * u_xlat6;
            u_xlat11 = u_xlat6 * u_xlat6;
            u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
            u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
            u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
            u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
            u_xlat16 = u_xlat11 * u_xlat6;
            u_xlatb2 = 1.0<abs(u_xlat1);
            u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
            u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
            u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
            u_xlat1 = min(u_xlat1, 1.0);
            u_xlatb1 = u_xlat1<(-u_xlat1);
            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
            u_xlat10.xy = u_xlat10.xy / vec2(u_xlat1);
            u_xlat0.xy = u_xlat10.xy + vec2(0.5, 0.5);
        }
    }
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 322
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %314 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %15 0 Offset 15 
                                              OpMemberDecorate %15 1 Offset 15 
                                              OpDecorate %15 Block 
                                              OpDecorate %17 DescriptorSet 17 
                                              OpDecorate %17 Binding 17 
                                              OpDecorate %301 DescriptorSet 301 
                                              OpDecorate %301 Binding 301 
                                              OpDecorate %305 DescriptorSet 305 
                                              OpDecorate %305 Binding 305 
                                              OpDecorate %314 Location 314 
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
                                      %15 = OpTypeStruct %6 %14 
                                      %16 = OpTypePointer Uniform %15 
        Uniform struct {f32; f32_4;}* %17 = OpVariable Uniform 
                                      %18 = OpTypeInt 32 1 
                                  i32 %19 = OpConstant 1 
                                      %20 = OpTypePointer Uniform %14 
                                      %31 = OpTypePointer Private %10 
                       Private f32_2* %32 = OpVariable Private 
                                  f32 %35 = OpConstant 3.674022E-40 
                                f32_2 %36 = OpConstantComposite %35 %35 
                                      %38 = OpTypePointer Private %6 
                         Private f32* %39 = OpVariable Private 
                         Private f32* %43 = OpVariable Private 
                         Private f32* %46 = OpVariable Private 
                                  i32 %47 = OpConstant 0 
                                      %48 = OpTypePointer Uniform %6 
                         Private f32* %52 = OpVariable Private 
                                  f32 %54 = OpConstant 3.674022E-40 
                                      %56 = OpTypeBool 
                                      %57 = OpTypePointer Private %56 
                        Private bool* %58 = OpVariable Private 
                                  f32 %59 = OpConstant 3.674022E-40 
                       Private f32_2* %65 = OpVariable Private 
                                      %68 = OpTypeInt 32 0 
                                  u32 %69 = OpConstant 0 
                         Private f32* %75 = OpVariable Private 
                         Private f32* %79 = OpVariable Private 
                         Private f32* %82 = OpVariable Private 
                                  f32 %93 = OpConstant 3.674022E-40 
                                f32_2 %94 = OpConstantComposite %93 %93 
                                  f32 %97 = OpConstant 3.674022E-40 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                                 f32 %149 = OpConstant 3.674022E-40 
                                 f32 %151 = OpConstant 3.674022E-40 
                                 f32 %158 = OpConstant 3.674022E-40 
                                 f32 %165 = OpConstant 3.674022E-40 
                                 f32 %172 = OpConstant 3.674022E-40 
                       Private bool* %178 = OpVariable Private 
                                 f32 %184 = OpConstant 3.674022E-40 
                                 f32 %186 = OpConstant 3.674022E-40 
                                     %190 = OpTypePointer Function %6 
                       Private bool* %207 = OpVariable Private 
                                 f32 %228 = OpConstant 3.674022E-40 
                                     %299 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %300 = OpTypePointer UniformConstant %299 
UniformConstant read_only Texture2D* %301 = OpVariable UniformConstant 
                                     %303 = OpTypeSampler 
                                     %304 = OpTypePointer UniformConstant %303 
            UniformConstant sampler* %305 = OpVariable UniformConstant 
                                     %307 = OpTypeSampledImage %299 
                                     %313 = OpTypePointer Output %14 
                       Output f32_4* %314 = OpVariable Output 
                                 u32 %318 = OpConstant 3 
                                     %319 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32* %191 = OpVariable Function 
                       Function f32* %213 = OpVariable Function 
                       Function f32* %283 = OpVariable Function 
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
                                f32_3 %33 = OpLoad %9 
                                f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                f32_2 %37 = OpFAdd %34 %36 
                                              OpStore %32 %37 
                                f32_2 %40 = OpLoad %32 
                                f32_2 %41 = OpLoad %32 
                                  f32 %42 = OpDot %40 %41 
                                              OpStore %39 %42 
                                  f32 %44 = OpLoad %39 
                                  f32 %45 = OpExtInst %1 31 %44 
                                              OpStore %43 %45 
                         Uniform f32* %49 = OpAccessChain %17 %47 
                                  f32 %50 = OpLoad %49 
                                  f32 %51 = OpFAdd %50 %35 
                                              OpStore %46 %51 
                                  f32 %53 = OpLoad %46 
                                  f32 %55 = OpFMul %53 %54 
                                              OpStore %52 %55 
                                  f32 %60 = OpLoad %46 
                                 bool %61 = OpFOrdLessThan %59 %60 
                                              OpStore %58 %61 
                                 bool %62 = OpLoad %58 
                                              OpSelectionMerge %64 None 
                                              OpBranchConditional %62 %63 %114 
                                      %63 = OpLabel 
                                  f32 %66 = OpLoad %39 
                                  f32 %67 = OpExtInst %1 32 %66 
                         Private f32* %70 = OpAccessChain %65 %69 
                                              OpStore %70 %67 
                                f32_2 %71 = OpLoad %32 
                                f32_2 %72 = OpLoad %65 
                                f32_2 %73 = OpVectorShuffle %72 %72 0 0 
                                f32_2 %74 = OpFMul %71 %73 
                                              OpStore %65 %74 
                                  f32 %76 = OpLoad %52 
                                  f32 %77 = OpLoad %43 
                                  f32 %78 = OpFMul %76 %77 
                                              OpStore %75 %78 
                                  f32 %80 = OpLoad %75 
                                  f32 %81 = OpExtInst %1 13 %80 
                                              OpStore %79 %81 
                                  f32 %83 = OpLoad %75 
                                  f32 %84 = OpExtInst %1 14 %83 
                                              OpStore %82 %84 
                                  f32 %85 = OpLoad %79 
                                  f32 %86 = OpLoad %82 
                                  f32 %87 = OpFDiv %85 %86 
                                              OpStore %75 %87 
                                  f32 %88 = OpLoad %75 
                                f32_2 %89 = OpCompositeConstruct %88 %88 
                                f32_2 %90 = OpLoad %65 
                                f32_2 %91 = OpFMul %89 %90 
                                              OpStore %65 %91 
                                f32_2 %92 = OpLoad %65 
                                f32_2 %95 = OpFMul %92 %94 
                                              OpStore %65 %95 
                                  f32 %96 = OpLoad %46 
                                  f32 %98 = OpFMul %96 %97 
                                              OpStore %75 %98 
                                  f32 %99 = OpLoad %75 
                                 f32 %100 = OpExtInst %1 13 %99 
                                              OpStore %79 %100 
                                 f32 %101 = OpLoad %75 
                                 f32 %102 = OpExtInst %1 14 %101 
                                              OpStore %82 %102 
                                 f32 %103 = OpLoad %79 
                                 f32 %104 = OpLoad %82 
                                 f32 %105 = OpFDiv %103 %104 
                                              OpStore %75 %105 
                               f32_2 %106 = OpLoad %65 
                                 f32 %107 = OpLoad %75 
                               f32_2 %108 = OpCompositeConstruct %107 %107 
                               f32_2 %109 = OpFDiv %106 %108 
                                              OpStore %65 %109 
                               f32_2 %110 = OpLoad %65 
                               f32_2 %111 = OpFAdd %110 %94 
                               f32_3 %112 = OpLoad %9 
                               f32_3 %113 = OpVectorShuffle %112 %111 3 4 2 
                                              OpStore %9 %113 
                                              OpBranch %64 
                                     %114 = OpLabel 
                                 f32 %115 = OpLoad %46 
                                bool %116 = OpFOrdLessThan %115 %59 
                                              OpStore %58 %116 
                                bool %117 = OpLoad %58 
                                              OpSelectionMerge %119 None 
                                              OpBranchConditional %117 %118 %119 
                                     %118 = OpLabel 
                                 f32 %120 = OpLoad %39 
                                 f32 %121 = OpExtInst %1 32 %120 
                                              OpStore %39 %121 
                               f32_2 %122 = OpLoad %32 
                                 f32 %123 = OpLoad %39 
                               f32_2 %124 = OpCompositeConstruct %123 %123 
                               f32_2 %125 = OpFMul %122 %124 
                                              OpStore %32 %125 
                                 f32 %126 = OpLoad %52 
                                 f32 %127 = OpFNegate %126 
                                 f32 %128 = OpLoad %43 
                                 f32 %129 = OpFMul %127 %128 
                                              OpStore %39 %129 
                                 f32 %130 = OpLoad %39 
                                 f32 %132 = OpFMul %130 %131 
                                              OpStore %39 %132 
                                 f32 %133 = OpLoad %39 
                                 f32 %134 = OpExtInst %1 4 %133 
                                 f32 %136 = OpExtInst %1 37 %134 %135 
                                              OpStore %43 %136 
                                 f32 %137 = OpLoad %39 
                                 f32 %138 = OpExtInst %1 4 %137 
                                 f32 %139 = OpExtInst %1 40 %138 %135 
                                              OpStore %52 %139 
                                 f32 %140 = OpLoad %52 
                                 f32 %141 = OpFDiv %135 %140 
                                              OpStore %52 %141 
                                 f32 %142 = OpLoad %52 
                                 f32 %143 = OpLoad %43 
                                 f32 %144 = OpFMul %142 %143 
                                              OpStore %43 %144 
                                 f32 %145 = OpLoad %43 
                                 f32 %146 = OpLoad %43 
                                 f32 %147 = OpFMul %145 %146 
                                              OpStore %52 %147 
                                 f32 %148 = OpLoad %52 
                                 f32 %150 = OpFMul %148 %149 
                                 f32 %152 = OpFAdd %150 %151 
                        Private f32* %153 = OpAccessChain %65 %69 
                                              OpStore %153 %152 
                                 f32 %154 = OpLoad %52 
                        Private f32* %155 = OpAccessChain %65 %69 
                                 f32 %156 = OpLoad %155 
                                 f32 %157 = OpFMul %154 %156 
                                 f32 %159 = OpFAdd %157 %158 
                        Private f32* %160 = OpAccessChain %65 %69 
                                              OpStore %160 %159 
                                 f32 %161 = OpLoad %52 
                        Private f32* %162 = OpAccessChain %65 %69 
                                 f32 %163 = OpLoad %162 
                                 f32 %164 = OpFMul %161 %163 
                                 f32 %166 = OpFAdd %164 %165 
                        Private f32* %167 = OpAccessChain %65 %69 
                                              OpStore %167 %166 
                                 f32 %168 = OpLoad %52 
                        Private f32* %169 = OpAccessChain %65 %69 
                                 f32 %170 = OpLoad %169 
                                 f32 %171 = OpFMul %168 %170 
                                 f32 %173 = OpFAdd %171 %172 
                                              OpStore %52 %173 
                                 f32 %174 = OpLoad %52 
                                 f32 %175 = OpLoad %43 
                                 f32 %176 = OpFMul %174 %175 
                        Private f32* %177 = OpAccessChain %65 %69 
                                              OpStore %177 %176 
                                 f32 %179 = OpLoad %39 
                                 f32 %180 = OpExtInst %1 4 %179 
                                bool %181 = OpFOrdLessThan %135 %180 
                                              OpStore %178 %181 
                        Private f32* %182 = OpAccessChain %65 %69 
                                 f32 %183 = OpLoad %182 
                                 f32 %185 = OpFMul %183 %184 
                                 f32 %187 = OpFAdd %185 %186 
                        Private f32* %188 = OpAccessChain %65 %69 
                                              OpStore %188 %187 
                                bool %189 = OpLoad %178 
                                              OpSelectionMerge %193 None 
                                              OpBranchConditional %189 %192 %196 
                                     %192 = OpLabel 
                        Private f32* %194 = OpAccessChain %65 %69 
                                 f32 %195 = OpLoad %194 
                                              OpStore %191 %195 
                                              OpBranch %193 
                                     %196 = OpLabel 
                                              OpStore %191 %59 
                                              OpBranch %193 
                                     %193 = OpLabel 
                                 f32 %197 = OpLoad %191 
                        Private f32* %198 = OpAccessChain %65 %69 
                                              OpStore %198 %197 
                                 f32 %199 = OpLoad %43 
                                 f32 %200 = OpLoad %52 
                                 f32 %201 = OpFMul %199 %200 
                        Private f32* %202 = OpAccessChain %65 %69 
                                 f32 %203 = OpLoad %202 
                                 f32 %204 = OpFAdd %201 %203 
                                              OpStore %43 %204 
                                 f32 %205 = OpLoad %39 
                                 f32 %206 = OpExtInst %1 37 %205 %135 
                                              OpStore %39 %206 
                                 f32 %208 = OpLoad %39 
                                 f32 %209 = OpLoad %39 
                                 f32 %210 = OpFNegate %209 
                                bool %211 = OpFOrdLessThan %208 %210 
                                              OpStore %207 %211 
                                bool %212 = OpLoad %207 
                                              OpSelectionMerge %215 None 
                                              OpBranchConditional %212 %214 %218 
                                     %214 = OpLabel 
                                 f32 %216 = OpLoad %43 
                                 f32 %217 = OpFNegate %216 
                                              OpStore %213 %217 
                                              OpBranch %215 
                                     %218 = OpLabel 
                                 f32 %219 = OpLoad %43 
                                              OpStore %213 %219 
                                              OpBranch %215 
                                     %215 = OpLabel 
                                 f32 %220 = OpLoad %213 
                                              OpStore %39 %220 
                               f32_2 %221 = OpLoad %32 
                                 f32 %222 = OpLoad %39 
                               f32_2 %223 = OpCompositeConstruct %222 %222 
                               f32_2 %224 = OpFMul %221 %223 
                                              OpStore %32 %224 
                               f32_2 %225 = OpLoad %32 
                               f32_2 %226 = OpFMul %225 %94 
                                              OpStore %32 %226 
                                 f32 %227 = OpLoad %46 
                                 f32 %229 = OpFMul %227 %228 
                                              OpStore %39 %229 
                                 f32 %230 = OpLoad %39 
                                 f32 %231 = OpExtInst %1 4 %230 
                                 f32 %232 = OpExtInst %1 37 %231 %135 
                                              OpStore %43 %232 
                                 f32 %233 = OpLoad %39 
                                 f32 %234 = OpExtInst %1 4 %233 
                                 f32 %235 = OpExtInst %1 40 %234 %135 
                                              OpStore %46 %235 
                                 f32 %236 = OpLoad %46 
                                 f32 %237 = OpFDiv %135 %236 
                                              OpStore %46 %237 
                                 f32 %238 = OpLoad %46 
                                 f32 %239 = OpLoad %43 
                                 f32 %240 = OpFMul %238 %239 
                                              OpStore %43 %240 
                                 f32 %241 = OpLoad %43 
                                 f32 %242 = OpLoad %43 
                                 f32 %243 = OpFMul %241 %242 
                                              OpStore %46 %243 
                                 f32 %244 = OpLoad %46 
                                 f32 %245 = OpFMul %244 %149 
                                 f32 %246 = OpFAdd %245 %151 
                                              OpStore %52 %246 
                                 f32 %247 = OpLoad %46 
                                 f32 %248 = OpLoad %52 
                                 f32 %249 = OpFMul %247 %248 
                                 f32 %250 = OpFAdd %249 %158 
                                              OpStore %52 %250 
                                 f32 %251 = OpLoad %46 
                                 f32 %252 = OpLoad %52 
                                 f32 %253 = OpFMul %251 %252 
                                 f32 %254 = OpFAdd %253 %165 
                                              OpStore %52 %254 
                                 f32 %255 = OpLoad %46 
                                 f32 %256 = OpLoad %52 
                                 f32 %257 = OpFMul %255 %256 
                                 f32 %258 = OpFAdd %257 %172 
                                              OpStore %46 %258 
                                 f32 %259 = OpLoad %46 
                                 f32 %260 = OpLoad %43 
                                 f32 %261 = OpFMul %259 %260 
                                              OpStore %52 %261 
                                 f32 %262 = OpLoad %39 
                                 f32 %263 = OpExtInst %1 4 %262 
                                bool %264 = OpFOrdLessThan %135 %263 
                                              OpStore %58 %264 
                                 f32 %265 = OpLoad %52 
                                 f32 %266 = OpFMul %265 %184 
                                 f32 %267 = OpFAdd %266 %186 
                                              OpStore %52 %267 
                                bool %268 = OpLoad %58 
                                 f32 %269 = OpLoad %52 
                                 f32 %270 = OpSelect %268 %269 %59 
                                              OpStore %52 %270 
                                 f32 %271 = OpLoad %43 
                                 f32 %272 = OpLoad %46 
                                 f32 %273 = OpFMul %271 %272 
                                 f32 %274 = OpLoad %52 
                                 f32 %275 = OpFAdd %273 %274 
                                              OpStore %43 %275 
                                 f32 %276 = OpLoad %39 
                                 f32 %277 = OpExtInst %1 37 %276 %135 
                                              OpStore %39 %277 
                                 f32 %278 = OpLoad %39 
                                 f32 %279 = OpLoad %39 
                                 f32 %280 = OpFNegate %279 
                                bool %281 = OpFOrdLessThan %278 %280 
                                              OpStore %207 %281 
                                bool %282 = OpLoad %207 
                                              OpSelectionMerge %285 None 
                                              OpBranchConditional %282 %284 %288 
                                     %284 = OpLabel 
                                 f32 %286 = OpLoad %43 
                                 f32 %287 = OpFNegate %286 
                                              OpStore %283 %287 
                                              OpBranch %285 
                                     %288 = OpLabel 
                                 f32 %289 = OpLoad %43 
                                              OpStore %283 %289 
                                              OpBranch %285 
                                     %285 = OpLabel 
                                 f32 %290 = OpLoad %283 
                                              OpStore %39 %290 
                               f32_2 %291 = OpLoad %32 
                                 f32 %292 = OpLoad %39 
                               f32_2 %293 = OpCompositeConstruct %292 %292 
                               f32_2 %294 = OpFDiv %291 %293 
                                              OpStore %32 %294 
                               f32_2 %295 = OpLoad %32 
                               f32_2 %296 = OpFAdd %295 %94 
                               f32_3 %297 = OpLoad %9 
                               f32_3 %298 = OpVectorShuffle %297 %296 3 4 2 
                                              OpStore %9 %298 
                                              OpBranch %119 
                                     %119 = OpLabel 
                                              OpBranch %64 
                                      %64 = OpLabel 
                 read_only Texture2D %302 = OpLoad %301 
                             sampler %306 = OpLoad %305 
          read_only Texture2DSampled %308 = OpSampledImage %302 %306 
                               f32_3 %309 = OpLoad %9 
                               f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                               f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                               f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                              OpStore %9 %312 
                               f32_3 %315 = OpLoad %9 
                               f32_4 %316 = OpLoad %314 
                               f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                              OpStore %314 %317 
                         Output f32* %320 = OpAccessChain %314 %318 
                                              OpStore %320 %135 
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