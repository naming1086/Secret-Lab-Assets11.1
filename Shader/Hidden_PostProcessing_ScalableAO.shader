//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PostProcessing/ScalableAO" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 50388
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec2 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
vec3 u_xlat14;
int u_xlati14;
bvec2 u_xlatb14;
vec2 u_xlat18;
ivec2 u_xlati18;
bvec2 u_xlatb18;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
bool u_xlatb30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = 2.0 / u_xlat18.x;
    u_xlat10.xy = u_xlat1.xy * u_xlat18.xx;
    u_xlat10.z = u_xlat18.x + -1.0;
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat9 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat18.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat18.x / u_xlat0.x;
    u_xlatb18.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati18.x = int((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu));
    u_xlatb3.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati18.y = int((uint(u_xlatb3.y) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu));
    u_xlati18.xy = ivec2(uvec2(u_xlati18.xy) & uvec2(1u, 1u));
    u_xlati18.x = u_xlati18.y + u_xlati18.x;
    u_xlat18.x = float(u_xlati18.x);
    u_xlatb27 = 9.99999975e-06>=u_xlat0.x;
    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat27 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 100000000.0;
    u_xlat3.z = u_xlat0.x * _ProjectionParams.z + u_xlat18.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat4.xy;
    u_xlat27 = (-u_xlat3.z) + 1.0;
    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat18.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat18.xy = u_xlat18.xy * _ScreenParams.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat18.xy);
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat18.x = u_xlat18.x * 52.9829178;
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat5.x = 12.9898005;
    u_xlat27 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat29 = float(u_xlati_loop_1);
        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
        u_xlat30 = u_xlat5.y * 78.2330017;
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = fract(u_xlat30);
        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = u_xlat30 * 6.28318548;
        u_xlat7 = sin(u_xlat30);
        u_xlat8.x = cos(u_xlat30);
        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
        u_xlat30 = sqrt(u_xlat30);
        u_xlat8.y = u_xlat7;
        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
        u_xlat29 = u_xlat29 + 1.0;
        u_xlat29 = u_xlat29 / _AOParams.w;
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = u_xlat29 * _AOParams.y;
        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
        u_xlatb29 = u_xlat29>=0.0;
        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
        u_xlat22.xy = u_xlat14.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
        u_xlat29 = (-u_xlat14.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
        u_xlat14.xy = u_xlat22.xy * vec2(0.5, 0.5);
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat6 = textureLod(_CameraDepthTexture, u_xlat14.xy, 0.0);
        u_xlat29 = u_xlat6.x * _ZBufferParams.x;
        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
        u_xlat29 = u_xlat9 * u_xlat29 + _ZBufferParams.y;
        u_xlat29 = u_xlat30 / u_xlat29;
        u_xlatb14.xy = lessThan(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb30 = u_xlatb14.y || u_xlatb14.x;
        u_xlati30 = u_xlatb30 ? 1 : int(0);
        u_xlatb14.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat22.xyxx).xy;
        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
        u_xlati14 = u_xlatb14.x ? 1 : int(0);
        u_xlati30 = u_xlati30 + u_xlati14;
        u_xlat30 = float(u_xlati30);
        u_xlatb14.x = 9.99999975e-06>=u_xlat29;
        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
        u_xlat30 = u_xlat30 + u_xlat14.x;
        u_xlat30 = u_xlat30 * 100000000.0;
        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
        u_xlat22.xy = u_xlat22.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
        u_xlat29 = (-u_xlat6.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
        u_xlat29 = max(u_xlat29, 0.0);
        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat30 = u_xlat30 + 9.99999975e-05;
        u_xlat29 = u_xlat29 / u_xlat30;
        u_xlat27 = u_xlat27 + u_xlat29;
    }
    u_xlat0.x = u_xlat27 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    SV_Target0.x = exp2(u_xlat0.x);
    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 691
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %675 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %98 DescriptorSet 98 
                                                      OpDecorate %98 Binding 98 
                                                      OpDecorate %675 Location 675 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeStruct %30 %27 %27 %27 %27 %6 %27 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 5 
                                              %36 = OpTypePointer Uniform %6 
                               Private f32_3* %43 = OpVariable Private 
                                              %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %45 = OpTypePointer UniformConstant %44 
         UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
                                              %48 = OpTypeSampler 
                                              %49 = OpTypePointer UniformConstant %48 
                     UniformConstant sampler* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeSampledImage %44 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %18 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %19 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %66 = OpVariable Private 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Private %6 
                                          f32 %73 = OpConstant 3.674022E-40 
                               Private f32_3* %78 = OpVariable Private 
                                          f32 %88 = OpConstant 3.674022E-40 
                                          u32 %90 = OpConstant 2 
                               Private f32_3* %92 = OpVariable Private 
                                        f32_3 %94 = OpConstantComposite %19 %19 %88 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                     UniformConstant sampler* %98 = OpVariable UniformConstant 
                                Private f32* %106 = OpVariable Private 
                                         i32 %107 = OpConstant 2 
                                         u32 %108 = OpConstant 3 
                                         i32 %115 = OpConstant 3 
                                         u32 %132 = OpConstant 1 
                                             %143 = OpTypeBool 
                                             %144 = OpTypeVector %143 2 
                                             %145 = OpTypePointer Private %144 
                             Private bool_2* %146 = OpVariable Private 
                                       f32_4 %149 = OpConstantComposite %18 %18 %18 %18 
                                             %150 = OpTypeVector %143 4 
                                             %153 = OpTypeVector %34 2 
                                             %154 = OpTypePointer Private %153 
                              Private i32_2* %155 = OpVariable Private 
                                             %156 = OpTypePointer Private %143 
                                         u32 %160 = OpConstant 4294967295 
                                             %168 = OpTypePointer Private %34 
                             Private bool_2* %170 = OpVariable Private 
                                       f32_4 %171 = OpConstantComposite %19 %19 %18 %18 
                                             %188 = OpTypeVector %28 2 
                                       u32_2 %190 = OpConstantComposite %132 %132 
                               Private bool* %203 = OpVariable Private 
                                         f32 %204 = OpConstant 3.674022E-40 
                                Private f32* %208 = OpVariable Private 
                                         f32 %218 = OpConstant 3.674022E-40 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %224 = OpConstant 1 
                                       f32_2 %233 = OpConstantComposite %73 %73 
                                       f32_2 %235 = OpConstantComposite %88 %88 
                                         i32 %241 = OpConstant 0 
                                             %242 = OpTypePointer Uniform %27 
                              Private f32_2* %250 = OpVariable Private 
                                Private i32* %281 = OpVariable Private 
                                         i32 %282 = OpConstant 6 
                                         i32 %292 = OpConstant 4 
                                         f32 %299 = OpConstant 3.674022E-40 
                                         f32 %300 = OpConstant 3.674022E-40 
                                       f32_2 %301 = OpConstantComposite %299 %300 
                                         f32 %311 = OpConstant 3.674022E-40 
                              Private f32_2* %318 = OpVariable Private 
                                         f32 %319 = OpConstant 3.674022E-40 
                                             %321 = OpTypePointer Function %34 
                                Private f32* %331 = OpVariable Private 
                                             %334 = OpTypePointer Input %6 
                                         f32 %337 = OpConstant 3.674022E-40 
                                Private f32* %342 = OpVariable Private 
                                         f32 %345 = OpConstant 3.674022E-40 
                                         f32 %350 = OpConstant 3.674022E-40 
                              Private f32_3* %360 = OpVariable Private 
                                       f32_2 %366 = OpConstantComposite %19 %345 
                                         f32 %379 = OpConstant 3.674022E-40 
                                Private f32* %381 = OpVariable Private 
                              Private f32_2* %384 = OpVariable Private 
                              Private f32_3* %417 = OpVariable Private 
                               Private bool* %426 = OpVariable Private 
                                             %430 = OpTypePointer Function %7 
                              Private f32_2* %442 = OpVariable Private 
                                       f32_2 %481 = OpConstantComposite %19 %19 
                                         f32 %484 = OpConstant 3.674022E-40 
                                       f32_2 %485 = OpConstantComposite %484 %484 
                             Private bool_2* %530 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                                Private i32* %541 = OpVariable Private 
                                       f32_4 %544 = OpConstantComposite %73 %73 %18 %18 
                                Private i32* %555 = OpVariable Private 
                                         f32 %622 = OpConstant 3.674022E-40 
                                         f32 %632 = OpConstant 3.674022E-40 
                                         f32 %662 = OpConstant 3.674022E-40 
                                         f32 %671 = OpConstant 3.674022E-40 
                                             %674 = OpTypePointer Output %27 
                               Output f32_4* %675 = OpVariable Output 
                                             %679 = OpTypePointer Output %6 
                                         f32 %682 = OpConstant 3.674022E-40 
                                       f32_3 %683 = OpConstantComposite %484 %484 %682 
                                       f32_3 %685 = OpConstantComposite %484 %484 %484 
                                Private i32* %690 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %322 = OpVariable Function 
                             Function f32_3* %431 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %37 = OpAccessChain %33 %35 
                                          f32 %38 = OpLoad %37 
                                        f32_2 %39 = OpCompositeConstruct %38 %38 
                                        f32_2 %40 = OpFMul %26 %39 
                                        f32_3 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %9 %42 
                          read_only Texture2D %47 = OpLoad %46 
                                      sampler %51 = OpLoad %50 
                   read_only Texture2DSampled %53 = OpSampledImage %47 %51 
                                        f32_3 %54 = OpLoad %9 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                        f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %43 %57 
                                        f32_3 %58 = OpLoad %43 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %43 %64 
                                        f32_3 %67 = OpLoad %43 
                                        f32_3 %68 = OpLoad %43 
                                          f32 %69 = OpDot %67 %68 
                                 Private f32* %72 = OpAccessChain %66 %70 
                                                      OpStore %72 %69 
                                 Private f32* %74 = OpAccessChain %66 %70 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFDiv %73 %75 
                                 Private f32* %77 = OpAccessChain %66 %70 
                                                      OpStore %77 %76 
                                        f32_3 %79 = OpLoad %43 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpLoad %66 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                        f32_2 %83 = OpFMul %80 %82 
                                        f32_3 %84 = OpLoad %78 
                                        f32_3 %85 = OpVectorShuffle %84 %83 3 4 2 
                                                      OpStore %78 %85 
                                 Private f32* %86 = OpAccessChain %66 %70 
                                          f32 %87 = OpLoad %86 
                                          f32 %89 = OpFAdd %87 %88 
                                 Private f32* %91 = OpAccessChain %78 %90 
                                                      OpStore %91 %89 
                                        f32_3 %93 = OpLoad %78 
                                        f32_3 %95 = OpFMul %93 %94 
                                                      OpStore %92 %95 
                          read_only Texture2D %97 = OpLoad %96 
                                      sampler %99 = OpLoad %98 
                  read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                                       f32_3 %101 = OpLoad %9 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpImageSampleExplicitLod %100 %102 Lod %27 
                                         f32 %104 = OpCompositeExtract %103 0 
                                Private f32* %105 = OpAccessChain %9 %70 
                                                      OpStore %105 %104 
                                Uniform f32* %109 = OpAccessChain %33 %107 %108 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %111 %19 
                                                      OpStore %106 %112 
                                Private f32* %113 = OpAccessChain %9 %70 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %33 %115 %70 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %114 %117 
                                Private f32* %119 = OpAccessChain %9 %70 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %33 %107 %108 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFNegate %121 
                                Private f32* %123 = OpAccessChain %9 %70 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFMul %122 %124 
                                         f32 %126 = OpFAdd %125 %19 
                                Private f32* %127 = OpAccessChain %66 %70 
                                                      OpStore %127 %126 
                                         f32 %128 = OpLoad %106 
                                Private f32* %129 = OpAccessChain %9 %70 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %128 %130 
                                Uniform f32* %133 = OpAccessChain %33 %115 %132 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFAdd %131 %134 
                                Private f32* %136 = OpAccessChain %9 %70 
                                                      OpStore %136 %135 
                                Private f32* %137 = OpAccessChain %66 %70 
                                         f32 %138 = OpLoad %137 
                                Private f32* %139 = OpAccessChain %9 %70 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFDiv %138 %140 
                                Private f32* %142 = OpAccessChain %9 %70 
                                                      OpStore %142 %141 
                                       f32_2 %147 = OpLoad vs_TEXCOORD0 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 1 0 1 
                                      bool_4 %151 = OpFOrdLessThan %148 %149 
                                      bool_2 %152 = OpVectorShuffle %151 %151 0 1 
                                                      OpStore %146 %152 
                               Private bool* %157 = OpAccessChain %146 %132 
                                        bool %158 = OpLoad %157 
                                         u32 %159 = OpSelect %158 %132 %70 
                                         u32 %161 = OpIMul %159 %160 
                               Private bool* %162 = OpAccessChain %146 %70 
                                        bool %163 = OpLoad %162 
                                         u32 %164 = OpSelect %163 %132 %70 
                                         u32 %165 = OpIMul %164 %160 
                                         u32 %166 = OpBitwiseOr %161 %165 
                                         i32 %167 = OpBitcast %166 
                                Private i32* %169 = OpAccessChain %155 %70 
                                                      OpStore %169 %167 
                                       f32_2 %172 = OpLoad vs_TEXCOORD0 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 0 
                                      bool_4 %174 = OpFOrdLessThan %171 %173 
                                      bool_2 %175 = OpVectorShuffle %174 %174 0 1 
                                                      OpStore %170 %175 
                               Private bool* %176 = OpAccessChain %170 %132 
                                        bool %177 = OpLoad %176 
                                         u32 %178 = OpSelect %177 %132 %70 
                                         u32 %179 = OpIMul %178 %160 
                               Private bool* %180 = OpAccessChain %170 %70 
                                        bool %181 = OpLoad %180 
                                         u32 %182 = OpSelect %181 %132 %70 
                                         u32 %183 = OpIMul %182 %160 
                                         u32 %184 = OpBitwiseOr %179 %183 
                                         i32 %185 = OpBitcast %184 
                                Private i32* %186 = OpAccessChain %155 %132 
                                                      OpStore %186 %185 
                                       i32_2 %187 = OpLoad %155 
                                       u32_2 %189 = OpBitcast %187 
                                       u32_2 %191 = OpBitwiseAnd %189 %190 
                                       i32_2 %192 = OpBitcast %191 
                                                      OpStore %155 %192 
                                Private i32* %193 = OpAccessChain %155 %132 
                                         i32 %194 = OpLoad %193 
                                Private i32* %195 = OpAccessChain %155 %70 
                                         i32 %196 = OpLoad %195 
                                         i32 %197 = OpIAdd %194 %196 
                                Private i32* %198 = OpAccessChain %155 %70 
                                                      OpStore %198 %197 
                                Private i32* %199 = OpAccessChain %155 %70 
                                         i32 %200 = OpLoad %199 
                                         f32 %201 = OpConvertSToF %200 
                                Private f32* %202 = OpAccessChain %66 %70 
                                                      OpStore %202 %201 
                                Private f32* %205 = OpAccessChain %9 %70 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %203 %207 
                                        bool %209 = OpLoad %203 
                                         f32 %210 = OpSelect %209 %19 %18 
                                                      OpStore %208 %210 
                                         f32 %211 = OpLoad %208 
                                Private f32* %212 = OpAccessChain %66 %70 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %66 %70 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %66 %70 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                Private f32* %220 = OpAccessChain %66 %70 
                                                      OpStore %220 %219 
                                Private f32* %222 = OpAccessChain %9 %70 
                                         f32 %223 = OpLoad %222 
                                Uniform f32* %225 = OpAccessChain %33 %224 %90 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %223 %226 
                                Private f32* %228 = OpAccessChain %66 %70 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %227 %229 
                                Private f32* %231 = OpAccessChain %221 %90 
                                                      OpStore %231 %230 
                                       f32_2 %232 = OpLoad vs_TEXCOORD0 
                                       f32_2 %234 = OpFMul %232 %233 
                                       f32_2 %236 = OpFAdd %234 %235 
                                       f32_3 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %236 3 1 4 
                                                      OpStore %9 %238 
                                       f32_3 %239 = OpLoad %9 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 2 
                              Uniform f32_4* %243 = OpAccessChain %33 %241 %107 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpFNegate %245 
                                       f32_2 %247 = OpFAdd %240 %246 
                                       f32_3 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %247 3 1 4 
                                                      OpStore %9 %249 
                                Uniform f32* %251 = OpAccessChain %33 %241 %241 %70 
                                         f32 %252 = OpLoad %251 
                                Private f32* %253 = OpAccessChain %250 %70 
                                                      OpStore %253 %252 
                                Uniform f32* %254 = OpAccessChain %33 %241 %224 %132 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %250 %132 
                                                      OpStore %256 %255 
                                       f32_3 %257 = OpLoad %9 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 2 
                                       f32_2 %259 = OpLoad %250 
                                       f32_2 %260 = OpFDiv %258 %259 
                                       f32_3 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %260 3 1 4 
                                                      OpStore %9 %262 
                                Private f32* %263 = OpAccessChain %221 %90 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                         f32 %266 = OpFAdd %265 %19 
                                                      OpStore %208 %266 
                                Uniform f32* %267 = OpAccessChain %33 %107 %108 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %208 
                                         f32 %270 = OpFMul %268 %269 
                                Private f32* %271 = OpAccessChain %221 %90 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %208 %273 
                                         f32 %274 = OpLoad %208 
                                       f32_2 %275 = OpCompositeConstruct %274 %274 
                                       f32_3 %276 = OpLoad %9 
                                       f32_2 %277 = OpVectorShuffle %276 %276 0 2 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %221 
                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                      OpStore %221 %280 
                                Uniform f32* %283 = OpAccessChain %33 %282 %108 
                                         f32 %284 = OpLoad %283 
                                         i32 %285 = OpConvertFToS %284 
                                                      OpStore %281 %285 
                                       f32_2 %286 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %287 = OpAccessChain %33 %282 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_2 %290 = OpFMul %286 %289 
                                                      OpStore %66 %290 
                                       f32_2 %291 = OpLoad %66 
                              Uniform f32_4* %293 = OpAccessChain %33 %292 
                                       f32_4 %294 = OpLoad %293 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                       f32_2 %296 = OpFMul %291 %295 
                                                      OpStore %66 %296 
                                       f32_2 %297 = OpLoad %66 
                                       f32_2 %298 = OpExtInst %1 8 %297 
                                                      OpStore %66 %298 
                                       f32_2 %302 = OpLoad %66 
                                         f32 %303 = OpDot %301 %302 
                                Private f32* %304 = OpAccessChain %66 %70 
                                                      OpStore %304 %303 
                                Private f32* %305 = OpAccessChain %66 %70 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpExtInst %1 10 %306 
                                Private f32* %308 = OpAccessChain %66 %70 
                                                      OpStore %308 %307 
                                Private f32* %309 = OpAccessChain %66 %70 
                                         f32 %310 = OpLoad %309 
                                         f32 %312 = OpFMul %310 %311 
                                Private f32* %313 = OpAccessChain %66 %70 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %66 %70 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpExtInst %1 10 %315 
                                Private f32* %317 = OpAccessChain %66 %70 
                                                      OpStore %317 %316 
                                Private f32* %320 = OpAccessChain %318 %70 
                                                      OpStore %320 %319 
                                                      OpStore %208 %18 
                                                      OpStore %322 %241 
                                                      OpBranch %323 
                                             %323 = OpLabel 
                                                      OpLoopMerge %325 %326 None 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         i32 %328 = OpLoad %322 
                                         i32 %329 = OpLoad %281 
                                        bool %330 = OpSLessThan %328 %329 
                                                      OpBranchConditional %330 %324 %325 
                                             %324 = OpLabel 
                                         i32 %332 = OpLoad %322 
                                         f32 %333 = OpConvertSToF %332 
                                                      OpStore %331 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD0 %70 
                                         f32 %336 = OpLoad %335 
                                         f32 %338 = OpFMul %336 %337 
                                         f32 %339 = OpLoad %331 
                                         f32 %340 = OpFAdd %338 %339 
                                Private f32* %341 = OpAccessChain %318 %132 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %318 %132 
                                         f32 %344 = OpLoad %343 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %342 %346 
                                         f32 %347 = OpLoad %342 
                                         f32 %348 = OpExtInst %1 13 %347 
                                                      OpStore %342 %348 
                                         f32 %349 = OpLoad %342 
                                         f32 %351 = OpFMul %349 %350 
                                                      OpStore %342 %351 
                                         f32 %352 = OpLoad %342 
                                         f32 %353 = OpExtInst %1 10 %352 
                                                      OpStore %342 %353 
                                Private f32* %354 = OpAccessChain %66 %70 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpLoad %342 
                                         f32 %357 = OpFAdd %355 %356 
                                                      OpStore %342 %357 
                                         f32 %358 = OpLoad %342 
                                         f32 %359 = OpExtInst %1 10 %358 
                                                      OpStore %342 %359 
                                         f32 %361 = OpLoad %342 
                                         f32 %362 = OpFMul %361 %73 
                                         f32 %363 = OpFAdd %362 %88 
                                Private f32* %364 = OpAccessChain %360 %90 
                                                      OpStore %364 %363 
                                       f32_2 %365 = OpLoad %318 
                                         f32 %367 = OpDot %365 %366 
                                                      OpStore %342 %367 
                                         f32 %368 = OpLoad %342 
                                         f32 %369 = OpExtInst %1 13 %368 
                                                      OpStore %342 %369 
                                         f32 %370 = OpLoad %342 
                                         f32 %371 = OpFMul %370 %350 
                                                      OpStore %342 %371 
                                         f32 %372 = OpLoad %342 
                                         f32 %373 = OpExtInst %1 10 %372 
                                                      OpStore %342 %373 
                                Private f32* %374 = OpAccessChain %66 %70 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpLoad %342 
                                         f32 %377 = OpFAdd %375 %376 
                                                      OpStore %342 %377 
                                         f32 %378 = OpLoad %342 
                                         f32 %380 = OpFMul %378 %379 
                                                      OpStore %342 %380 
                                         f32 %382 = OpLoad %342 
                                         f32 %383 = OpExtInst %1 13 %382 
                                                      OpStore %381 %383 
                                         f32 %385 = OpLoad %342 
                                         f32 %386 = OpExtInst %1 14 %385 
                                Private f32* %387 = OpAccessChain %384 %70 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %360 %90 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                Private f32* %391 = OpAccessChain %360 %90 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFMul %390 %392 
                                         f32 %394 = OpFAdd %393 %19 
                                                      OpStore %342 %394 
                                         f32 %395 = OpLoad %342 
                                         f32 %396 = OpExtInst %1 31 %395 
                                                      OpStore %342 %396 
                                         f32 %397 = OpLoad %381 
                                Private f32* %398 = OpAccessChain %384 %132 
                                                      OpStore %398 %397 
                                         f32 %399 = OpLoad %342 
                                       f32_2 %400 = OpCompositeConstruct %399 %399 
                                       f32_2 %401 = OpLoad %384 
                                       f32_2 %402 = OpFMul %400 %401 
                                       f32_3 %403 = OpLoad %360 
                                       f32_3 %404 = OpVectorShuffle %403 %402 3 4 2 
                                                      OpStore %360 %404 
                                         f32 %405 = OpLoad %331 
                                         f32 %406 = OpFAdd %405 %19 
                                                      OpStore %331 %406 
                                         f32 %407 = OpLoad %331 
                                Uniform f32* %408 = OpAccessChain %33 %282 %108 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFDiv %407 %409 
                                                      OpStore %331 %410 
                                         f32 %411 = OpLoad %331 
                                         f32 %412 = OpExtInst %1 31 %411 
                                                      OpStore %331 %412 
                                         f32 %413 = OpLoad %331 
                                Uniform f32* %414 = OpAccessChain %33 %282 %132 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %413 %415 
                                                      OpStore %331 %416 
                                         f32 %418 = OpLoad %331 
                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
                                       f32_3 %420 = OpLoad %360 
                                       f32_3 %421 = OpFMul %419 %420 
                                                      OpStore %417 %421 
                                       f32_3 %422 = OpLoad %92 
                                       f32_3 %423 = OpFNegate %422 
                                       f32_3 %424 = OpLoad %417 
                                         f32 %425 = OpDot %423 %424 
                                                      OpStore %331 %425 
                                         f32 %427 = OpLoad %331 
                                        bool %428 = OpFOrdGreaterThanEqual %427 %18 
                                                      OpStore %426 %428 
                                        bool %429 = OpLoad %426 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %429 %432 %436 
                                             %432 = OpLabel 
                                       f32_3 %434 = OpLoad %417 
                                       f32_3 %435 = OpFNegate %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                       f32_3 %437 = OpLoad %417 
                                                      OpStore %431 %437 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                       f32_3 %438 = OpLoad %431 
                                                      OpStore %417 %438 
                                       f32_3 %439 = OpLoad %221 
                                       f32_3 %440 = OpLoad %417 
                                       f32_3 %441 = OpFAdd %439 %440 
                                                      OpStore %417 %441 
                                       f32_3 %443 = OpLoad %417 
                                       f32_2 %444 = OpVectorShuffle %443 %443 1 1 
                              Uniform f32_4* %445 = OpAccessChain %33 %241 %224 
                                       f32_4 %446 = OpLoad %445 
                                       f32_2 %447 = OpVectorShuffle %446 %446 0 1 
                                       f32_2 %448 = OpFMul %444 %447 
                                                      OpStore %442 %448 
                              Uniform f32_4* %449 = OpAccessChain %33 %241 %241 
                                       f32_4 %450 = OpLoad %449 
                                       f32_2 %451 = OpVectorShuffle %450 %450 0 1 
                                       f32_3 %452 = OpLoad %417 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpFMul %451 %453 
                                       f32_2 %455 = OpLoad %442 
                                       f32_2 %456 = OpFAdd %454 %455 
                                                      OpStore %442 %456 
                              Uniform f32_4* %457 = OpAccessChain %33 %241 %107 
                                       f32_4 %458 = OpLoad %457 
                                       f32_2 %459 = OpVectorShuffle %458 %458 0 1 
                                       f32_3 %460 = OpLoad %417 
                                       f32_2 %461 = OpVectorShuffle %460 %460 2 2 
                                       f32_2 %462 = OpFMul %459 %461 
                                       f32_2 %463 = OpLoad %442 
                                       f32_2 %464 = OpFAdd %462 %463 
                                                      OpStore %442 %464 
                                Private f32* %465 = OpAccessChain %417 %90 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %19 
                                                      OpStore %331 %468 
                                Uniform f32* %469 = OpAccessChain %33 %107 %108 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpLoad %331 
                                         f32 %472 = OpFMul %470 %471 
                                Private f32* %473 = OpAccessChain %417 %90 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFAdd %472 %474 
                                                      OpStore %331 %475 
                                       f32_2 %476 = OpLoad %442 
                                         f32 %477 = OpLoad %331 
                                       f32_2 %478 = OpCompositeConstruct %477 %477 
                                       f32_2 %479 = OpFDiv %476 %478 
                                                      OpStore %442 %479 
                                       f32_2 %480 = OpLoad %442 
                                       f32_2 %482 = OpFAdd %480 %481 
                                                      OpStore %442 %482 
                                       f32_2 %483 = OpLoad %442 
                                       f32_2 %486 = OpFMul %483 %485 
                                       f32_3 %487 = OpLoad %417 
                                       f32_3 %488 = OpVectorShuffle %487 %486 3 4 2 
                                                      OpStore %417 %488 
                                       f32_3 %489 = OpLoad %417 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_2 %491 = OpCompositeConstruct %18 %18 
                                       f32_2 %492 = OpCompositeConstruct %19 %19 
                                       f32_2 %493 = OpExtInst %1 43 %490 %491 %492 
                                       f32_3 %494 = OpLoad %417 
                                       f32_3 %495 = OpVectorShuffle %494 %493 3 4 2 
                                                      OpStore %417 %495 
                                       f32_3 %496 = OpLoad %417 
                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
                                Uniform f32* %498 = OpAccessChain %33 %35 
                                         f32 %499 = OpLoad %498 
                                       f32_2 %500 = OpCompositeConstruct %499 %499 
                                       f32_2 %501 = OpFMul %497 %500 
                                       f32_3 %502 = OpLoad %417 
                                       f32_3 %503 = OpVectorShuffle %502 %501 3 4 2 
                                                      OpStore %417 %503 
                         read_only Texture2D %504 = OpLoad %96 
                                     sampler %505 = OpLoad %98 
                  read_only Texture2DSampled %506 = OpSampledImage %504 %505 
                                       f32_3 %507 = OpLoad %417 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
                                       f32_4 %509 = OpImageSampleExplicitLod %506 %508 Lod %27 
                                         f32 %510 = OpCompositeExtract %509 0 
                                                      OpStore %331 %510 
                                         f32 %511 = OpLoad %331 
                                Uniform f32* %512 = OpAccessChain %33 %115 %70 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                                      OpStore %331 %514 
                                Uniform f32* %515 = OpAccessChain %33 %107 %108 
                                         f32 %516 = OpLoad %515 
                                         f32 %517 = OpFNegate %516 
                                         f32 %518 = OpLoad %331 
                                         f32 %519 = OpFMul %517 %518 
                                         f32 %520 = OpFAdd %519 %19 
                                                      OpStore %342 %520 
                                         f32 %521 = OpLoad %106 
                                         f32 %522 = OpLoad %331 
                                         f32 %523 = OpFMul %521 %522 
                                Uniform f32* %524 = OpAccessChain %33 %115 %132 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFAdd %523 %525 
                                                      OpStore %331 %526 
                                         f32 %527 = OpLoad %342 
                                         f32 %528 = OpLoad %331 
                                         f32 %529 = OpFDiv %527 %528 
                                                      OpStore %331 %529 
                                       f32_2 %531 = OpLoad %442 
                                       f32_4 %532 = OpVectorShuffle %531 %531 0 1 0 0 
                                      bool_4 %533 = OpFOrdLessThan %532 %149 
                                      bool_2 %534 = OpVectorShuffle %533 %533 0 1 
                                                      OpStore %530 %534 
                               Private bool* %536 = OpAccessChain %530 %132 
                                        bool %537 = OpLoad %536 
                               Private bool* %538 = OpAccessChain %530 %70 
                                        bool %539 = OpLoad %538 
                                        bool %540 = OpLogicalOr %537 %539 
                                                      OpStore %535 %540 
                                        bool %542 = OpLoad %535 
                                         i32 %543 = OpSelect %542 %224 %241 
                                                      OpStore %541 %543 
                                       f32_2 %545 = OpLoad %442 
                                       f32_4 %546 = OpVectorShuffle %545 %545 0 1 0 0 
                                      bool_4 %547 = OpFOrdLessThan %544 %546 
                                      bool_2 %548 = OpVectorShuffle %547 %547 0 1 
                                                      OpStore %530 %548 
                               Private bool* %549 = OpAccessChain %530 %132 
                                        bool %550 = OpLoad %549 
                               Private bool* %551 = OpAccessChain %530 %70 
                                        bool %552 = OpLoad %551 
                                        bool %553 = OpLogicalOr %550 %552 
                               Private bool* %554 = OpAccessChain %530 %70 
                                                      OpStore %554 %553 
                               Private bool* %556 = OpAccessChain %530 %70 
                                        bool %557 = OpLoad %556 
                                         i32 %558 = OpSelect %557 %224 %241 
                                                      OpStore %555 %558 
                                         i32 %559 = OpLoad %541 
                                         i32 %560 = OpLoad %555 
                                         i32 %561 = OpIAdd %559 %560 
                                                      OpStore %541 %561 
                                         i32 %562 = OpLoad %541 
                                         f32 %563 = OpConvertSToF %562 
                                                      OpStore %342 %563 
                                         f32 %564 = OpLoad %331 
                                        bool %565 = OpFOrdGreaterThanEqual %204 %564 
                               Private bool* %566 = OpAccessChain %530 %70 
                                                      OpStore %566 %565 
                               Private bool* %567 = OpAccessChain %530 %70 
                                        bool %568 = OpLoad %567 
                                         f32 %569 = OpSelect %568 %19 %18 
                                Private f32* %570 = OpAccessChain %417 %70 
                                                      OpStore %570 %569 
                                         f32 %571 = OpLoad %342 
                                Private f32* %572 = OpAccessChain %417 %70 
                                         f32 %573 = OpLoad %572 
                                         f32 %574 = OpFAdd %571 %573 
                                                      OpStore %342 %574 
                                         f32 %575 = OpLoad %342 
                                         f32 %576 = OpFMul %575 %218 
                                                      OpStore %342 %576 
                                         f32 %577 = OpLoad %331 
                                Uniform f32* %578 = OpAccessChain %33 %224 %90 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFMul %577 %579 
                                         f32 %581 = OpLoad %342 
                                         f32 %582 = OpFAdd %580 %581 
                                Private f32* %583 = OpAccessChain %360 %90 
                                                      OpStore %583 %582 
                                       f32_2 %584 = OpLoad %442 
                              Uniform f32_4* %585 = OpAccessChain %33 %241 %107 
                                       f32_4 %586 = OpLoad %585 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 1 
                                       f32_2 %588 = OpFNegate %587 
                                       f32_2 %589 = OpFAdd %584 %588 
                                                      OpStore %442 %589 
                                       f32_2 %590 = OpLoad %442 
                                       f32_2 %591 = OpFAdd %590 %235 
                                                      OpStore %442 %591 
                                       f32_2 %592 = OpLoad %442 
                                       f32_2 %593 = OpLoad %250 
                                       f32_2 %594 = OpFDiv %592 %593 
                                                      OpStore %442 %594 
                                Private f32* %595 = OpAccessChain %360 %90 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                         f32 %598 = OpFAdd %597 %19 
                                                      OpStore %331 %598 
                                Uniform f32* %599 = OpAccessChain %33 %107 %108 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpLoad %331 
                                         f32 %602 = OpFMul %600 %601 
                                Private f32* %603 = OpAccessChain %360 %90 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFAdd %602 %604 
                                                      OpStore %331 %605 
                                         f32 %606 = OpLoad %331 
                                       f32_2 %607 = OpCompositeConstruct %606 %606 
                                       f32_2 %608 = OpLoad %442 
                                       f32_2 %609 = OpFMul %607 %608 
                                       f32_3 %610 = OpLoad %360 
                                       f32_3 %611 = OpVectorShuffle %610 %609 3 4 2 
                                                      OpStore %360 %611 
                                       f32_3 %612 = OpLoad %221 
                                       f32_3 %613 = OpFNegate %612 
                                       f32_3 %614 = OpLoad %360 
                                       f32_3 %615 = OpFAdd %613 %614 
                                                      OpStore %417 %615 
                                       f32_3 %616 = OpLoad %417 
                                       f32_3 %617 = OpLoad %92 
                                         f32 %618 = OpDot %616 %617 
                                                      OpStore %331 %618 
                                Private f32* %619 = OpAccessChain %221 %90 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFNegate %620 
                                         f32 %623 = OpFMul %621 %622 
                                         f32 %624 = OpLoad %331 
                                         f32 %625 = OpFAdd %623 %624 
                                                      OpStore %331 %625 
                                         f32 %626 = OpLoad %331 
                                         f32 %627 = OpExtInst %1 40 %626 %18 
                                                      OpStore %331 %627 
                                       f32_3 %628 = OpLoad %417 
                                       f32_3 %629 = OpLoad %417 
                                         f32 %630 = OpDot %628 %629 
                                                      OpStore %342 %630 
                                         f32 %631 = OpLoad %342 
                                         f32 %633 = OpFAdd %631 %632 
                                                      OpStore %342 %633 
                                         f32 %634 = OpLoad %331 
                                         f32 %635 = OpLoad %342 
                                         f32 %636 = OpFDiv %634 %635 
                                                      OpStore %331 %636 
                                         f32 %637 = OpLoad %208 
                                         f32 %638 = OpLoad %331 
                                         f32 %639 = OpFAdd %637 %638 
                                                      OpStore %208 %639 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         i32 %640 = OpLoad %322 
                                         i32 %641 = OpIAdd %640 %224 
                                                      OpStore %322 %641 
                                                      OpBranch %323 
                                             %325 = OpLabel 
                                         f32 %642 = OpLoad %208 
                                Uniform f32* %643 = OpAccessChain %33 %282 %132 
                                         f32 %644 = OpLoad %643 
                                         f32 %645 = OpFMul %642 %644 
                                Private f32* %646 = OpAccessChain %9 %70 
                                                      OpStore %646 %645 
                                Private f32* %647 = OpAccessChain %9 %70 
                                         f32 %648 = OpLoad %647 
                                Uniform f32* %649 = OpAccessChain %33 %282 %70 
                                         f32 %650 = OpLoad %649 
                                         f32 %651 = OpFMul %648 %650 
                                Private f32* %652 = OpAccessChain %9 %70 
                                                      OpStore %652 %651 
                                Private f32* %653 = OpAccessChain %9 %70 
                                         f32 %654 = OpLoad %653 
                                Uniform f32* %655 = OpAccessChain %33 %282 %108 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFDiv %654 %656 
                                Private f32* %658 = OpAccessChain %9 %70 
                                                      OpStore %658 %657 
                                Private f32* %659 = OpAccessChain %9 %70 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpExtInst %1 4 %660 
                                         f32 %663 = OpExtInst %1 40 %661 %662 
                                Private f32* %664 = OpAccessChain %9 %70 
                                                      OpStore %664 %663 
                                Private f32* %665 = OpAccessChain %9 %70 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpExtInst %1 30 %666 
                                Private f32* %668 = OpAccessChain %9 %70 
                                                      OpStore %668 %667 
                                Private f32* %669 = OpAccessChain %9 %70 
                                         f32 %670 = OpLoad %669 
                                         f32 %672 = OpFMul %670 %671 
                                Private f32* %673 = OpAccessChain %9 %70 
                                                      OpStore %673 %672 
                                Private f32* %676 = OpAccessChain %9 %70 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpExtInst %1 29 %677 
                                 Output f32* %680 = OpAccessChain %675 %70 
                                                      OpStore %680 %678 
                                       f32_3 %681 = OpLoad %78 
                                       f32_3 %684 = OpFMul %681 %683 
                                       f32_3 %686 = OpFAdd %684 %685 
                                       f32_4 %687 = OpLoad %675 
                                       f32_4 %688 = OpVectorShuffle %687 %686 0 4 5 6 
                                                      OpStore %675 %688 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec2 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
vec3 u_xlat14;
int u_xlati14;
bvec2 u_xlatb14;
vec2 u_xlat18;
ivec2 u_xlati18;
bvec2 u_xlatb18;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
bool u_xlatb30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = 2.0 / u_xlat18.x;
    u_xlat10.xy = u_xlat1.xy * u_xlat18.xx;
    u_xlat10.z = u_xlat18.x + -1.0;
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat9 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat18.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat18.x / u_xlat0.x;
    u_xlatb18.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati18.x = int((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu));
    u_xlatb3.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati18.y = int((uint(u_xlatb3.y) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu));
    u_xlati18.xy = ivec2(uvec2(u_xlati18.xy) & uvec2(1u, 1u));
    u_xlati18.x = u_xlati18.y + u_xlati18.x;
    u_xlat18.x = float(u_xlati18.x);
    u_xlatb27 = 9.99999975e-06>=u_xlat0.x;
    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat27 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 100000000.0;
    u_xlat3.z = u_xlat0.x * _ProjectionParams.z + u_xlat18.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat4.xy;
    u_xlat27 = (-u_xlat3.z) + 1.0;
    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat18.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat18.xy = u_xlat18.xy * _ScreenParams.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat18.xy);
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat18.x = u_xlat18.x * 52.9829178;
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat5.x = 12.9898005;
    u_xlat27 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat29 = float(u_xlati_loop_1);
        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
        u_xlat30 = u_xlat5.y * 78.2330017;
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = fract(u_xlat30);
        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = u_xlat30 * 6.28318548;
        u_xlat7 = sin(u_xlat30);
        u_xlat8.x = cos(u_xlat30);
        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
        u_xlat30 = sqrt(u_xlat30);
        u_xlat8.y = u_xlat7;
        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
        u_xlat29 = u_xlat29 + 1.0;
        u_xlat29 = u_xlat29 / _AOParams.w;
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = u_xlat29 * _AOParams.y;
        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
        u_xlatb29 = u_xlat29>=0.0;
        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
        u_xlat22.xy = u_xlat14.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
        u_xlat29 = (-u_xlat14.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
        u_xlat14.xy = u_xlat22.xy * vec2(0.5, 0.5);
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat6 = textureLod(_CameraDepthTexture, u_xlat14.xy, 0.0);
        u_xlat29 = u_xlat6.x * _ZBufferParams.x;
        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
        u_xlat29 = u_xlat9 * u_xlat29 + _ZBufferParams.y;
        u_xlat29 = u_xlat30 / u_xlat29;
        u_xlatb14.xy = lessThan(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb30 = u_xlatb14.y || u_xlatb14.x;
        u_xlati30 = u_xlatb30 ? 1 : int(0);
        u_xlatb14.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat22.xyxx).xy;
        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
        u_xlati14 = u_xlatb14.x ? 1 : int(0);
        u_xlati30 = u_xlati30 + u_xlati14;
        u_xlat30 = float(u_xlati30);
        u_xlatb14.x = 9.99999975e-06>=u_xlat29;
        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
        u_xlat30 = u_xlat30 + u_xlat14.x;
        u_xlat30 = u_xlat30 * 100000000.0;
        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
        u_xlat22.xy = u_xlat22.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
        u_xlat29 = (-u_xlat6.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
        u_xlat29 = max(u_xlat29, 0.0);
        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat30 = u_xlat30 + 9.99999975e-05;
        u_xlat29 = u_xlat29 / u_xlat30;
        u_xlat27 = u_xlat27 + u_xlat29;
    }
    u_xlat0.x = u_xlat27 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    SV_Target0.x = exp2(u_xlat0.x);
    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 691
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %675 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %98 DescriptorSet 98 
                                                      OpDecorate %98 Binding 98 
                                                      OpDecorate %675 Location 675 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeStruct %30 %27 %27 %27 %27 %6 %27 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 5 
                                              %36 = OpTypePointer Uniform %6 
                               Private f32_3* %43 = OpVariable Private 
                                              %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %45 = OpTypePointer UniformConstant %44 
         UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
                                              %48 = OpTypeSampler 
                                              %49 = OpTypePointer UniformConstant %48 
                     UniformConstant sampler* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeSampledImage %44 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %18 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %19 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %66 = OpVariable Private 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Private %6 
                                          f32 %73 = OpConstant 3.674022E-40 
                               Private f32_3* %78 = OpVariable Private 
                                          f32 %88 = OpConstant 3.674022E-40 
                                          u32 %90 = OpConstant 2 
                               Private f32_3* %92 = OpVariable Private 
                                        f32_3 %94 = OpConstantComposite %19 %19 %88 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                     UniformConstant sampler* %98 = OpVariable UniformConstant 
                                Private f32* %106 = OpVariable Private 
                                         i32 %107 = OpConstant 2 
                                         u32 %108 = OpConstant 3 
                                         i32 %115 = OpConstant 3 
                                         u32 %132 = OpConstant 1 
                                             %143 = OpTypeBool 
                                             %144 = OpTypeVector %143 2 
                                             %145 = OpTypePointer Private %144 
                             Private bool_2* %146 = OpVariable Private 
                                       f32_4 %149 = OpConstantComposite %18 %18 %18 %18 
                                             %150 = OpTypeVector %143 4 
                                             %153 = OpTypeVector %34 2 
                                             %154 = OpTypePointer Private %153 
                              Private i32_2* %155 = OpVariable Private 
                                             %156 = OpTypePointer Private %143 
                                         u32 %160 = OpConstant 4294967295 
                                             %168 = OpTypePointer Private %34 
                             Private bool_2* %170 = OpVariable Private 
                                       f32_4 %171 = OpConstantComposite %19 %19 %18 %18 
                                             %188 = OpTypeVector %28 2 
                                       u32_2 %190 = OpConstantComposite %132 %132 
                               Private bool* %203 = OpVariable Private 
                                         f32 %204 = OpConstant 3.674022E-40 
                                Private f32* %208 = OpVariable Private 
                                         f32 %218 = OpConstant 3.674022E-40 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %224 = OpConstant 1 
                                       f32_2 %233 = OpConstantComposite %73 %73 
                                       f32_2 %235 = OpConstantComposite %88 %88 
                                         i32 %241 = OpConstant 0 
                                             %242 = OpTypePointer Uniform %27 
                              Private f32_2* %250 = OpVariable Private 
                                Private i32* %281 = OpVariable Private 
                                         i32 %282 = OpConstant 6 
                                         i32 %292 = OpConstant 4 
                                         f32 %299 = OpConstant 3.674022E-40 
                                         f32 %300 = OpConstant 3.674022E-40 
                                       f32_2 %301 = OpConstantComposite %299 %300 
                                         f32 %311 = OpConstant 3.674022E-40 
                              Private f32_2* %318 = OpVariable Private 
                                         f32 %319 = OpConstant 3.674022E-40 
                                             %321 = OpTypePointer Function %34 
                                Private f32* %331 = OpVariable Private 
                                             %334 = OpTypePointer Input %6 
                                         f32 %337 = OpConstant 3.674022E-40 
                                Private f32* %342 = OpVariable Private 
                                         f32 %345 = OpConstant 3.674022E-40 
                                         f32 %350 = OpConstant 3.674022E-40 
                              Private f32_3* %360 = OpVariable Private 
                                       f32_2 %366 = OpConstantComposite %19 %345 
                                         f32 %379 = OpConstant 3.674022E-40 
                                Private f32* %381 = OpVariable Private 
                              Private f32_2* %384 = OpVariable Private 
                              Private f32_3* %417 = OpVariable Private 
                               Private bool* %426 = OpVariable Private 
                                             %430 = OpTypePointer Function %7 
                              Private f32_2* %442 = OpVariable Private 
                                       f32_2 %481 = OpConstantComposite %19 %19 
                                         f32 %484 = OpConstant 3.674022E-40 
                                       f32_2 %485 = OpConstantComposite %484 %484 
                             Private bool_2* %530 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                                Private i32* %541 = OpVariable Private 
                                       f32_4 %544 = OpConstantComposite %73 %73 %18 %18 
                                Private i32* %555 = OpVariable Private 
                                         f32 %622 = OpConstant 3.674022E-40 
                                         f32 %632 = OpConstant 3.674022E-40 
                                         f32 %662 = OpConstant 3.674022E-40 
                                         f32 %671 = OpConstant 3.674022E-40 
                                             %674 = OpTypePointer Output %27 
                               Output f32_4* %675 = OpVariable Output 
                                             %679 = OpTypePointer Output %6 
                                         f32 %682 = OpConstant 3.674022E-40 
                                       f32_3 %683 = OpConstantComposite %484 %484 %682 
                                       f32_3 %685 = OpConstantComposite %484 %484 %484 
                                Private i32* %690 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %322 = OpVariable Function 
                             Function f32_3* %431 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %37 = OpAccessChain %33 %35 
                                          f32 %38 = OpLoad %37 
                                        f32_2 %39 = OpCompositeConstruct %38 %38 
                                        f32_2 %40 = OpFMul %26 %39 
                                        f32_3 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %9 %42 
                          read_only Texture2D %47 = OpLoad %46 
                                      sampler %51 = OpLoad %50 
                   read_only Texture2DSampled %53 = OpSampledImage %47 %51 
                                        f32_3 %54 = OpLoad %9 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                        f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %43 %57 
                                        f32_3 %58 = OpLoad %43 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %43 %64 
                                        f32_3 %67 = OpLoad %43 
                                        f32_3 %68 = OpLoad %43 
                                          f32 %69 = OpDot %67 %68 
                                 Private f32* %72 = OpAccessChain %66 %70 
                                                      OpStore %72 %69 
                                 Private f32* %74 = OpAccessChain %66 %70 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFDiv %73 %75 
                                 Private f32* %77 = OpAccessChain %66 %70 
                                                      OpStore %77 %76 
                                        f32_3 %79 = OpLoad %43 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpLoad %66 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                        f32_2 %83 = OpFMul %80 %82 
                                        f32_3 %84 = OpLoad %78 
                                        f32_3 %85 = OpVectorShuffle %84 %83 3 4 2 
                                                      OpStore %78 %85 
                                 Private f32* %86 = OpAccessChain %66 %70 
                                          f32 %87 = OpLoad %86 
                                          f32 %89 = OpFAdd %87 %88 
                                 Private f32* %91 = OpAccessChain %78 %90 
                                                      OpStore %91 %89 
                                        f32_3 %93 = OpLoad %78 
                                        f32_3 %95 = OpFMul %93 %94 
                                                      OpStore %92 %95 
                          read_only Texture2D %97 = OpLoad %96 
                                      sampler %99 = OpLoad %98 
                  read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                                       f32_3 %101 = OpLoad %9 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpImageSampleExplicitLod %100 %102 Lod %27 
                                         f32 %104 = OpCompositeExtract %103 0 
                                Private f32* %105 = OpAccessChain %9 %70 
                                                      OpStore %105 %104 
                                Uniform f32* %109 = OpAccessChain %33 %107 %108 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %111 %19 
                                                      OpStore %106 %112 
                                Private f32* %113 = OpAccessChain %9 %70 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %33 %115 %70 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %114 %117 
                                Private f32* %119 = OpAccessChain %9 %70 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %33 %107 %108 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFNegate %121 
                                Private f32* %123 = OpAccessChain %9 %70 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFMul %122 %124 
                                         f32 %126 = OpFAdd %125 %19 
                                Private f32* %127 = OpAccessChain %66 %70 
                                                      OpStore %127 %126 
                                         f32 %128 = OpLoad %106 
                                Private f32* %129 = OpAccessChain %9 %70 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %128 %130 
                                Uniform f32* %133 = OpAccessChain %33 %115 %132 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFAdd %131 %134 
                                Private f32* %136 = OpAccessChain %9 %70 
                                                      OpStore %136 %135 
                                Private f32* %137 = OpAccessChain %66 %70 
                                         f32 %138 = OpLoad %137 
                                Private f32* %139 = OpAccessChain %9 %70 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFDiv %138 %140 
                                Private f32* %142 = OpAccessChain %9 %70 
                                                      OpStore %142 %141 
                                       f32_2 %147 = OpLoad vs_TEXCOORD0 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 1 0 1 
                                      bool_4 %151 = OpFOrdLessThan %148 %149 
                                      bool_2 %152 = OpVectorShuffle %151 %151 0 1 
                                                      OpStore %146 %152 
                               Private bool* %157 = OpAccessChain %146 %132 
                                        bool %158 = OpLoad %157 
                                         u32 %159 = OpSelect %158 %132 %70 
                                         u32 %161 = OpIMul %159 %160 
                               Private bool* %162 = OpAccessChain %146 %70 
                                        bool %163 = OpLoad %162 
                                         u32 %164 = OpSelect %163 %132 %70 
                                         u32 %165 = OpIMul %164 %160 
                                         u32 %166 = OpBitwiseOr %161 %165 
                                         i32 %167 = OpBitcast %166 
                                Private i32* %169 = OpAccessChain %155 %70 
                                                      OpStore %169 %167 
                                       f32_2 %172 = OpLoad vs_TEXCOORD0 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 0 
                                      bool_4 %174 = OpFOrdLessThan %171 %173 
                                      bool_2 %175 = OpVectorShuffle %174 %174 0 1 
                                                      OpStore %170 %175 
                               Private bool* %176 = OpAccessChain %170 %132 
                                        bool %177 = OpLoad %176 
                                         u32 %178 = OpSelect %177 %132 %70 
                                         u32 %179 = OpIMul %178 %160 
                               Private bool* %180 = OpAccessChain %170 %70 
                                        bool %181 = OpLoad %180 
                                         u32 %182 = OpSelect %181 %132 %70 
                                         u32 %183 = OpIMul %182 %160 
                                         u32 %184 = OpBitwiseOr %179 %183 
                                         i32 %185 = OpBitcast %184 
                                Private i32* %186 = OpAccessChain %155 %132 
                                                      OpStore %186 %185 
                                       i32_2 %187 = OpLoad %155 
                                       u32_2 %189 = OpBitcast %187 
                                       u32_2 %191 = OpBitwiseAnd %189 %190 
                                       i32_2 %192 = OpBitcast %191 
                                                      OpStore %155 %192 
                                Private i32* %193 = OpAccessChain %155 %132 
                                         i32 %194 = OpLoad %193 
                                Private i32* %195 = OpAccessChain %155 %70 
                                         i32 %196 = OpLoad %195 
                                         i32 %197 = OpIAdd %194 %196 
                                Private i32* %198 = OpAccessChain %155 %70 
                                                      OpStore %198 %197 
                                Private i32* %199 = OpAccessChain %155 %70 
                                         i32 %200 = OpLoad %199 
                                         f32 %201 = OpConvertSToF %200 
                                Private f32* %202 = OpAccessChain %66 %70 
                                                      OpStore %202 %201 
                                Private f32* %205 = OpAccessChain %9 %70 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %203 %207 
                                        bool %209 = OpLoad %203 
                                         f32 %210 = OpSelect %209 %19 %18 
                                                      OpStore %208 %210 
                                         f32 %211 = OpLoad %208 
                                Private f32* %212 = OpAccessChain %66 %70 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %66 %70 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %66 %70 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                Private f32* %220 = OpAccessChain %66 %70 
                                                      OpStore %220 %219 
                                Private f32* %222 = OpAccessChain %9 %70 
                                         f32 %223 = OpLoad %222 
                                Uniform f32* %225 = OpAccessChain %33 %224 %90 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %223 %226 
                                Private f32* %228 = OpAccessChain %66 %70 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %227 %229 
                                Private f32* %231 = OpAccessChain %221 %90 
                                                      OpStore %231 %230 
                                       f32_2 %232 = OpLoad vs_TEXCOORD0 
                                       f32_2 %234 = OpFMul %232 %233 
                                       f32_2 %236 = OpFAdd %234 %235 
                                       f32_3 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %236 3 1 4 
                                                      OpStore %9 %238 
                                       f32_3 %239 = OpLoad %9 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 2 
                              Uniform f32_4* %243 = OpAccessChain %33 %241 %107 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpFNegate %245 
                                       f32_2 %247 = OpFAdd %240 %246 
                                       f32_3 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %247 3 1 4 
                                                      OpStore %9 %249 
                                Uniform f32* %251 = OpAccessChain %33 %241 %241 %70 
                                         f32 %252 = OpLoad %251 
                                Private f32* %253 = OpAccessChain %250 %70 
                                                      OpStore %253 %252 
                                Uniform f32* %254 = OpAccessChain %33 %241 %224 %132 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %250 %132 
                                                      OpStore %256 %255 
                                       f32_3 %257 = OpLoad %9 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 2 
                                       f32_2 %259 = OpLoad %250 
                                       f32_2 %260 = OpFDiv %258 %259 
                                       f32_3 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %260 3 1 4 
                                                      OpStore %9 %262 
                                Private f32* %263 = OpAccessChain %221 %90 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                         f32 %266 = OpFAdd %265 %19 
                                                      OpStore %208 %266 
                                Uniform f32* %267 = OpAccessChain %33 %107 %108 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %208 
                                         f32 %270 = OpFMul %268 %269 
                                Private f32* %271 = OpAccessChain %221 %90 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %208 %273 
                                         f32 %274 = OpLoad %208 
                                       f32_2 %275 = OpCompositeConstruct %274 %274 
                                       f32_3 %276 = OpLoad %9 
                                       f32_2 %277 = OpVectorShuffle %276 %276 0 2 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %221 
                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                      OpStore %221 %280 
                                Uniform f32* %283 = OpAccessChain %33 %282 %108 
                                         f32 %284 = OpLoad %283 
                                         i32 %285 = OpConvertFToS %284 
                                                      OpStore %281 %285 
                                       f32_2 %286 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %287 = OpAccessChain %33 %282 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_2 %290 = OpFMul %286 %289 
                                                      OpStore %66 %290 
                                       f32_2 %291 = OpLoad %66 
                              Uniform f32_4* %293 = OpAccessChain %33 %292 
                                       f32_4 %294 = OpLoad %293 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                       f32_2 %296 = OpFMul %291 %295 
                                                      OpStore %66 %296 
                                       f32_2 %297 = OpLoad %66 
                                       f32_2 %298 = OpExtInst %1 8 %297 
                                                      OpStore %66 %298 
                                       f32_2 %302 = OpLoad %66 
                                         f32 %303 = OpDot %301 %302 
                                Private f32* %304 = OpAccessChain %66 %70 
                                                      OpStore %304 %303 
                                Private f32* %305 = OpAccessChain %66 %70 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpExtInst %1 10 %306 
                                Private f32* %308 = OpAccessChain %66 %70 
                                                      OpStore %308 %307 
                                Private f32* %309 = OpAccessChain %66 %70 
                                         f32 %310 = OpLoad %309 
                                         f32 %312 = OpFMul %310 %311 
                                Private f32* %313 = OpAccessChain %66 %70 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %66 %70 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpExtInst %1 10 %315 
                                Private f32* %317 = OpAccessChain %66 %70 
                                                      OpStore %317 %316 
                                Private f32* %320 = OpAccessChain %318 %70 
                                                      OpStore %320 %319 
                                                      OpStore %208 %18 
                                                      OpStore %322 %241 
                                                      OpBranch %323 
                                             %323 = OpLabel 
                                                      OpLoopMerge %325 %326 None 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         i32 %328 = OpLoad %322 
                                         i32 %329 = OpLoad %281 
                                        bool %330 = OpSLessThan %328 %329 
                                                      OpBranchConditional %330 %324 %325 
                                             %324 = OpLabel 
                                         i32 %332 = OpLoad %322 
                                         f32 %333 = OpConvertSToF %332 
                                                      OpStore %331 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD0 %70 
                                         f32 %336 = OpLoad %335 
                                         f32 %338 = OpFMul %336 %337 
                                         f32 %339 = OpLoad %331 
                                         f32 %340 = OpFAdd %338 %339 
                                Private f32* %341 = OpAccessChain %318 %132 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %318 %132 
                                         f32 %344 = OpLoad %343 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %342 %346 
                                         f32 %347 = OpLoad %342 
                                         f32 %348 = OpExtInst %1 13 %347 
                                                      OpStore %342 %348 
                                         f32 %349 = OpLoad %342 
                                         f32 %351 = OpFMul %349 %350 
                                                      OpStore %342 %351 
                                         f32 %352 = OpLoad %342 
                                         f32 %353 = OpExtInst %1 10 %352 
                                                      OpStore %342 %353 
                                Private f32* %354 = OpAccessChain %66 %70 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpLoad %342 
                                         f32 %357 = OpFAdd %355 %356 
                                                      OpStore %342 %357 
                                         f32 %358 = OpLoad %342 
                                         f32 %359 = OpExtInst %1 10 %358 
                                                      OpStore %342 %359 
                                         f32 %361 = OpLoad %342 
                                         f32 %362 = OpFMul %361 %73 
                                         f32 %363 = OpFAdd %362 %88 
                                Private f32* %364 = OpAccessChain %360 %90 
                                                      OpStore %364 %363 
                                       f32_2 %365 = OpLoad %318 
                                         f32 %367 = OpDot %365 %366 
                                                      OpStore %342 %367 
                                         f32 %368 = OpLoad %342 
                                         f32 %369 = OpExtInst %1 13 %368 
                                                      OpStore %342 %369 
                                         f32 %370 = OpLoad %342 
                                         f32 %371 = OpFMul %370 %350 
                                                      OpStore %342 %371 
                                         f32 %372 = OpLoad %342 
                                         f32 %373 = OpExtInst %1 10 %372 
                                                      OpStore %342 %373 
                                Private f32* %374 = OpAccessChain %66 %70 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpLoad %342 
                                         f32 %377 = OpFAdd %375 %376 
                                                      OpStore %342 %377 
                                         f32 %378 = OpLoad %342 
                                         f32 %380 = OpFMul %378 %379 
                                                      OpStore %342 %380 
                                         f32 %382 = OpLoad %342 
                                         f32 %383 = OpExtInst %1 13 %382 
                                                      OpStore %381 %383 
                                         f32 %385 = OpLoad %342 
                                         f32 %386 = OpExtInst %1 14 %385 
                                Private f32* %387 = OpAccessChain %384 %70 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %360 %90 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                Private f32* %391 = OpAccessChain %360 %90 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFMul %390 %392 
                                         f32 %394 = OpFAdd %393 %19 
                                                      OpStore %342 %394 
                                         f32 %395 = OpLoad %342 
                                         f32 %396 = OpExtInst %1 31 %395 
                                                      OpStore %342 %396 
                                         f32 %397 = OpLoad %381 
                                Private f32* %398 = OpAccessChain %384 %132 
                                                      OpStore %398 %397 
                                         f32 %399 = OpLoad %342 
                                       f32_2 %400 = OpCompositeConstruct %399 %399 
                                       f32_2 %401 = OpLoad %384 
                                       f32_2 %402 = OpFMul %400 %401 
                                       f32_3 %403 = OpLoad %360 
                                       f32_3 %404 = OpVectorShuffle %403 %402 3 4 2 
                                                      OpStore %360 %404 
                                         f32 %405 = OpLoad %331 
                                         f32 %406 = OpFAdd %405 %19 
                                                      OpStore %331 %406 
                                         f32 %407 = OpLoad %331 
                                Uniform f32* %408 = OpAccessChain %33 %282 %108 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFDiv %407 %409 
                                                      OpStore %331 %410 
                                         f32 %411 = OpLoad %331 
                                         f32 %412 = OpExtInst %1 31 %411 
                                                      OpStore %331 %412 
                                         f32 %413 = OpLoad %331 
                                Uniform f32* %414 = OpAccessChain %33 %282 %132 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %413 %415 
                                                      OpStore %331 %416 
                                         f32 %418 = OpLoad %331 
                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
                                       f32_3 %420 = OpLoad %360 
                                       f32_3 %421 = OpFMul %419 %420 
                                                      OpStore %417 %421 
                                       f32_3 %422 = OpLoad %92 
                                       f32_3 %423 = OpFNegate %422 
                                       f32_3 %424 = OpLoad %417 
                                         f32 %425 = OpDot %423 %424 
                                                      OpStore %331 %425 
                                         f32 %427 = OpLoad %331 
                                        bool %428 = OpFOrdGreaterThanEqual %427 %18 
                                                      OpStore %426 %428 
                                        bool %429 = OpLoad %426 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %429 %432 %436 
                                             %432 = OpLabel 
                                       f32_3 %434 = OpLoad %417 
                                       f32_3 %435 = OpFNegate %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                       f32_3 %437 = OpLoad %417 
                                                      OpStore %431 %437 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                       f32_3 %438 = OpLoad %431 
                                                      OpStore %417 %438 
                                       f32_3 %439 = OpLoad %221 
                                       f32_3 %440 = OpLoad %417 
                                       f32_3 %441 = OpFAdd %439 %440 
                                                      OpStore %417 %441 
                                       f32_3 %443 = OpLoad %417 
                                       f32_2 %444 = OpVectorShuffle %443 %443 1 1 
                              Uniform f32_4* %445 = OpAccessChain %33 %241 %224 
                                       f32_4 %446 = OpLoad %445 
                                       f32_2 %447 = OpVectorShuffle %446 %446 0 1 
                                       f32_2 %448 = OpFMul %444 %447 
                                                      OpStore %442 %448 
                              Uniform f32_4* %449 = OpAccessChain %33 %241 %241 
                                       f32_4 %450 = OpLoad %449 
                                       f32_2 %451 = OpVectorShuffle %450 %450 0 1 
                                       f32_3 %452 = OpLoad %417 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpFMul %451 %453 
                                       f32_2 %455 = OpLoad %442 
                                       f32_2 %456 = OpFAdd %454 %455 
                                                      OpStore %442 %456 
                              Uniform f32_4* %457 = OpAccessChain %33 %241 %107 
                                       f32_4 %458 = OpLoad %457 
                                       f32_2 %459 = OpVectorShuffle %458 %458 0 1 
                                       f32_3 %460 = OpLoad %417 
                                       f32_2 %461 = OpVectorShuffle %460 %460 2 2 
                                       f32_2 %462 = OpFMul %459 %461 
                                       f32_2 %463 = OpLoad %442 
                                       f32_2 %464 = OpFAdd %462 %463 
                                                      OpStore %442 %464 
                                Private f32* %465 = OpAccessChain %417 %90 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %19 
                                                      OpStore %331 %468 
                                Uniform f32* %469 = OpAccessChain %33 %107 %108 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpLoad %331 
                                         f32 %472 = OpFMul %470 %471 
                                Private f32* %473 = OpAccessChain %417 %90 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFAdd %472 %474 
                                                      OpStore %331 %475 
                                       f32_2 %476 = OpLoad %442 
                                         f32 %477 = OpLoad %331 
                                       f32_2 %478 = OpCompositeConstruct %477 %477 
                                       f32_2 %479 = OpFDiv %476 %478 
                                                      OpStore %442 %479 
                                       f32_2 %480 = OpLoad %442 
                                       f32_2 %482 = OpFAdd %480 %481 
                                                      OpStore %442 %482 
                                       f32_2 %483 = OpLoad %442 
                                       f32_2 %486 = OpFMul %483 %485 
                                       f32_3 %487 = OpLoad %417 
                                       f32_3 %488 = OpVectorShuffle %487 %486 3 4 2 
                                                      OpStore %417 %488 
                                       f32_3 %489 = OpLoad %417 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_2 %491 = OpCompositeConstruct %18 %18 
                                       f32_2 %492 = OpCompositeConstruct %19 %19 
                                       f32_2 %493 = OpExtInst %1 43 %490 %491 %492 
                                       f32_3 %494 = OpLoad %417 
                                       f32_3 %495 = OpVectorShuffle %494 %493 3 4 2 
                                                      OpStore %417 %495 
                                       f32_3 %496 = OpLoad %417 
                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
                                Uniform f32* %498 = OpAccessChain %33 %35 
                                         f32 %499 = OpLoad %498 
                                       f32_2 %500 = OpCompositeConstruct %499 %499 
                                       f32_2 %501 = OpFMul %497 %500 
                                       f32_3 %502 = OpLoad %417 
                                       f32_3 %503 = OpVectorShuffle %502 %501 3 4 2 
                                                      OpStore %417 %503 
                         read_only Texture2D %504 = OpLoad %96 
                                     sampler %505 = OpLoad %98 
                  read_only Texture2DSampled %506 = OpSampledImage %504 %505 
                                       f32_3 %507 = OpLoad %417 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
                                       f32_4 %509 = OpImageSampleExplicitLod %506 %508 Lod %27 
                                         f32 %510 = OpCompositeExtract %509 0 
                                                      OpStore %331 %510 
                                         f32 %511 = OpLoad %331 
                                Uniform f32* %512 = OpAccessChain %33 %115 %70 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                                      OpStore %331 %514 
                                Uniform f32* %515 = OpAccessChain %33 %107 %108 
                                         f32 %516 = OpLoad %515 
                                         f32 %517 = OpFNegate %516 
                                         f32 %518 = OpLoad %331 
                                         f32 %519 = OpFMul %517 %518 
                                         f32 %520 = OpFAdd %519 %19 
                                                      OpStore %342 %520 
                                         f32 %521 = OpLoad %106 
                                         f32 %522 = OpLoad %331 
                                         f32 %523 = OpFMul %521 %522 
                                Uniform f32* %524 = OpAccessChain %33 %115 %132 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFAdd %523 %525 
                                                      OpStore %331 %526 
                                         f32 %527 = OpLoad %342 
                                         f32 %528 = OpLoad %331 
                                         f32 %529 = OpFDiv %527 %528 
                                                      OpStore %331 %529 
                                       f32_2 %531 = OpLoad %442 
                                       f32_4 %532 = OpVectorShuffle %531 %531 0 1 0 0 
                                      bool_4 %533 = OpFOrdLessThan %532 %149 
                                      bool_2 %534 = OpVectorShuffle %533 %533 0 1 
                                                      OpStore %530 %534 
                               Private bool* %536 = OpAccessChain %530 %132 
                                        bool %537 = OpLoad %536 
                               Private bool* %538 = OpAccessChain %530 %70 
                                        bool %539 = OpLoad %538 
                                        bool %540 = OpLogicalOr %537 %539 
                                                      OpStore %535 %540 
                                        bool %542 = OpLoad %535 
                                         i32 %543 = OpSelect %542 %224 %241 
                                                      OpStore %541 %543 
                                       f32_2 %545 = OpLoad %442 
                                       f32_4 %546 = OpVectorShuffle %545 %545 0 1 0 0 
                                      bool_4 %547 = OpFOrdLessThan %544 %546 
                                      bool_2 %548 = OpVectorShuffle %547 %547 0 1 
                                                      OpStore %530 %548 
                               Private bool* %549 = OpAccessChain %530 %132 
                                        bool %550 = OpLoad %549 
                               Private bool* %551 = OpAccessChain %530 %70 
                                        bool %552 = OpLoad %551 
                                        bool %553 = OpLogicalOr %550 %552 
                               Private bool* %554 = OpAccessChain %530 %70 
                                                      OpStore %554 %553 
                               Private bool* %556 = OpAccessChain %530 %70 
                                        bool %557 = OpLoad %556 
                                         i32 %558 = OpSelect %557 %224 %241 
                                                      OpStore %555 %558 
                                         i32 %559 = OpLoad %541 
                                         i32 %560 = OpLoad %555 
                                         i32 %561 = OpIAdd %559 %560 
                                                      OpStore %541 %561 
                                         i32 %562 = OpLoad %541 
                                         f32 %563 = OpConvertSToF %562 
                                                      OpStore %342 %563 
                                         f32 %564 = OpLoad %331 
                                        bool %565 = OpFOrdGreaterThanEqual %204 %564 
                               Private bool* %566 = OpAccessChain %530 %70 
                                                      OpStore %566 %565 
                               Private bool* %567 = OpAccessChain %530 %70 
                                        bool %568 = OpLoad %567 
                                         f32 %569 = OpSelect %568 %19 %18 
                                Private f32* %570 = OpAccessChain %417 %70 
                                                      OpStore %570 %569 
                                         f32 %571 = OpLoad %342 
                                Private f32* %572 = OpAccessChain %417 %70 
                                         f32 %573 = OpLoad %572 
                                         f32 %574 = OpFAdd %571 %573 
                                                      OpStore %342 %574 
                                         f32 %575 = OpLoad %342 
                                         f32 %576 = OpFMul %575 %218 
                                                      OpStore %342 %576 
                                         f32 %577 = OpLoad %331 
                                Uniform f32* %578 = OpAccessChain %33 %224 %90 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFMul %577 %579 
                                         f32 %581 = OpLoad %342 
                                         f32 %582 = OpFAdd %580 %581 
                                Private f32* %583 = OpAccessChain %360 %90 
                                                      OpStore %583 %582 
                                       f32_2 %584 = OpLoad %442 
                              Uniform f32_4* %585 = OpAccessChain %33 %241 %107 
                                       f32_4 %586 = OpLoad %585 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 1 
                                       f32_2 %588 = OpFNegate %587 
                                       f32_2 %589 = OpFAdd %584 %588 
                                                      OpStore %442 %589 
                                       f32_2 %590 = OpLoad %442 
                                       f32_2 %591 = OpFAdd %590 %235 
                                                      OpStore %442 %591 
                                       f32_2 %592 = OpLoad %442 
                                       f32_2 %593 = OpLoad %250 
                                       f32_2 %594 = OpFDiv %592 %593 
                                                      OpStore %442 %594 
                                Private f32* %595 = OpAccessChain %360 %90 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                         f32 %598 = OpFAdd %597 %19 
                                                      OpStore %331 %598 
                                Uniform f32* %599 = OpAccessChain %33 %107 %108 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpLoad %331 
                                         f32 %602 = OpFMul %600 %601 
                                Private f32* %603 = OpAccessChain %360 %90 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFAdd %602 %604 
                                                      OpStore %331 %605 
                                         f32 %606 = OpLoad %331 
                                       f32_2 %607 = OpCompositeConstruct %606 %606 
                                       f32_2 %608 = OpLoad %442 
                                       f32_2 %609 = OpFMul %607 %608 
                                       f32_3 %610 = OpLoad %360 
                                       f32_3 %611 = OpVectorShuffle %610 %609 3 4 2 
                                                      OpStore %360 %611 
                                       f32_3 %612 = OpLoad %221 
                                       f32_3 %613 = OpFNegate %612 
                                       f32_3 %614 = OpLoad %360 
                                       f32_3 %615 = OpFAdd %613 %614 
                                                      OpStore %417 %615 
                                       f32_3 %616 = OpLoad %417 
                                       f32_3 %617 = OpLoad %92 
                                         f32 %618 = OpDot %616 %617 
                                                      OpStore %331 %618 
                                Private f32* %619 = OpAccessChain %221 %90 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFNegate %620 
                                         f32 %623 = OpFMul %621 %622 
                                         f32 %624 = OpLoad %331 
                                         f32 %625 = OpFAdd %623 %624 
                                                      OpStore %331 %625 
                                         f32 %626 = OpLoad %331 
                                         f32 %627 = OpExtInst %1 40 %626 %18 
                                                      OpStore %331 %627 
                                       f32_3 %628 = OpLoad %417 
                                       f32_3 %629 = OpLoad %417 
                                         f32 %630 = OpDot %628 %629 
                                                      OpStore %342 %630 
                                         f32 %631 = OpLoad %342 
                                         f32 %633 = OpFAdd %631 %632 
                                                      OpStore %342 %633 
                                         f32 %634 = OpLoad %331 
                                         f32 %635 = OpLoad %342 
                                         f32 %636 = OpFDiv %634 %635 
                                                      OpStore %331 %636 
                                         f32 %637 = OpLoad %208 
                                         f32 %638 = OpLoad %331 
                                         f32 %639 = OpFAdd %637 %638 
                                                      OpStore %208 %639 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         i32 %640 = OpLoad %322 
                                         i32 %641 = OpIAdd %640 %224 
                                                      OpStore %322 %641 
                                                      OpBranch %323 
                                             %325 = OpLabel 
                                         f32 %642 = OpLoad %208 
                                Uniform f32* %643 = OpAccessChain %33 %282 %132 
                                         f32 %644 = OpLoad %643 
                                         f32 %645 = OpFMul %642 %644 
                                Private f32* %646 = OpAccessChain %9 %70 
                                                      OpStore %646 %645 
                                Private f32* %647 = OpAccessChain %9 %70 
                                         f32 %648 = OpLoad %647 
                                Uniform f32* %649 = OpAccessChain %33 %282 %70 
                                         f32 %650 = OpLoad %649 
                                         f32 %651 = OpFMul %648 %650 
                                Private f32* %652 = OpAccessChain %9 %70 
                                                      OpStore %652 %651 
                                Private f32* %653 = OpAccessChain %9 %70 
                                         f32 %654 = OpLoad %653 
                                Uniform f32* %655 = OpAccessChain %33 %282 %108 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFDiv %654 %656 
                                Private f32* %658 = OpAccessChain %9 %70 
                                                      OpStore %658 %657 
                                Private f32* %659 = OpAccessChain %9 %70 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpExtInst %1 4 %660 
                                         f32 %663 = OpExtInst %1 40 %661 %662 
                                Private f32* %664 = OpAccessChain %9 %70 
                                                      OpStore %664 %663 
                                Private f32* %665 = OpAccessChain %9 %70 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpExtInst %1 30 %666 
                                Private f32* %668 = OpAccessChain %9 %70 
                                                      OpStore %668 %667 
                                Private f32* %669 = OpAccessChain %9 %70 
                                         f32 %670 = OpLoad %669 
                                         f32 %672 = OpFMul %670 %671 
                                Private f32* %673 = OpAccessChain %9 %70 
                                                      OpStore %673 %672 
                                Private f32* %676 = OpAccessChain %9 %70 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpExtInst %1 29 %677 
                                 Output f32* %680 = OpAccessChain %675 %70 
                                                      OpStore %680 %678 
                                       f32_3 %681 = OpLoad %78 
                                       f32_3 %684 = OpFMul %681 %683 
                                       f32_3 %686 = OpFAdd %684 %685 
                                       f32_4 %687 = OpLoad %675 
                                       f32_4 %688 = OpVectorShuffle %687 %686 0 4 5 6 
                                                      OpStore %675 %688 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec3 _FogParams;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec2 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
vec3 u_xlat14;
int u_xlati14;
bvec2 u_xlatb14;
vec2 u_xlat18;
ivec2 u_xlati18;
bvec2 u_xlatb18;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
bool u_xlatb30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = 2.0 / u_xlat18.x;
    u_xlat10.xy = u_xlat1.xy * u_xlat18.xx;
    u_xlat10.z = u_xlat18.x + -1.0;
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat9 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat18.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat18.x / u_xlat0.x;
    u_xlatb18.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati18.x = int((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu));
    u_xlatb3.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati18.y = int((uint(u_xlatb3.y) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu));
    u_xlati18.xy = ivec2(uvec2(u_xlati18.xy) & uvec2(1u, 1u));
    u_xlati18.x = u_xlati18.y + u_xlati18.x;
    u_xlat18.x = float(u_xlati18.x);
    u_xlatb27 = 9.99999975e-06>=u_xlat0.x;
    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat27 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 100000000.0;
    u_xlat3.z = u_xlat0.x * _ProjectionParams.z + u_xlat18.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat4.xy;
    u_xlat27 = (-u_xlat3.z) + 1.0;
    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat18.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat18.xy = u_xlat18.xy * _ScreenParams.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat18.xy);
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat18.x = u_xlat18.x * 52.9829178;
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat5.x = 12.9898005;
    u_xlat27 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat29 = float(u_xlati_loop_1);
        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
        u_xlat30 = u_xlat5.y * 78.2330017;
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = fract(u_xlat30);
        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = u_xlat30 * 6.28318548;
        u_xlat7 = sin(u_xlat30);
        u_xlat8.x = cos(u_xlat30);
        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
        u_xlat30 = sqrt(u_xlat30);
        u_xlat8.y = u_xlat7;
        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
        u_xlat29 = u_xlat29 + 1.0;
        u_xlat29 = u_xlat29 / _AOParams.w;
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = u_xlat29 * _AOParams.y;
        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
        u_xlatb29 = u_xlat29>=0.0;
        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
        u_xlat22.xy = u_xlat14.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
        u_xlat29 = (-u_xlat14.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
        u_xlat14.xy = u_xlat22.xy * vec2(0.5, 0.5);
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat6 = textureLod(_CameraDepthTexture, u_xlat14.xy, 0.0);
        u_xlat29 = u_xlat6.x * _ZBufferParams.x;
        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
        u_xlat29 = u_xlat9 * u_xlat29 + _ZBufferParams.y;
        u_xlat29 = u_xlat30 / u_xlat29;
        u_xlatb14.xy = lessThan(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb30 = u_xlatb14.y || u_xlatb14.x;
        u_xlati30 = u_xlatb30 ? 1 : int(0);
        u_xlatb14.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat22.xyxx).xy;
        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
        u_xlati14 = u_xlatb14.x ? 1 : int(0);
        u_xlati30 = u_xlati30 + u_xlati14;
        u_xlat30 = float(u_xlati30);
        u_xlatb14.x = 9.99999975e-06>=u_xlat29;
        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
        u_xlat30 = u_xlat30 + u_xlat14.x;
        u_xlat30 = u_xlat30 * 100000000.0;
        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
        u_xlat22.xy = u_xlat22.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
        u_xlat29 = (-u_xlat6.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
        u_xlat29 = max(u_xlat29, 0.0);
        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat30 = u_xlat30 + 9.99999975e-05;
        u_xlat29 = u_xlat29 / u_xlat30;
        u_xlat27 = u_xlat27 + u_xlat29;
    }
    u_xlat0.x = u_xlat27 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat18.x = u_xlat2.x * _ZBufferParams.x;
    u_xlat27 = (-unity_OrthoParams.w) * u_xlat18.x + 1.0;
    u_xlat9 = u_xlat9 * u_xlat18.x + _ZBufferParams.y;
    u_xlat9 = u_xlat27 / u_xlat9;
    u_xlat9 = u_xlat9 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat9 = u_xlat9 * _FogParams.x;
    u_xlat9 = u_xlat9 * (-u_xlat9);
    u_xlat9 = exp2(u_xlat9);
    SV_Target0.x = u_xlat9 * u_xlat0.x;
    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 746
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %681 %729 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %98 DescriptorSet 98 
                                                      OpDecorate %98 Binding 98 
                                                      OpDecorate vs_TEXCOORD1 Location 681 
                                                      OpDecorate %729 Location 729 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeStruct %30 %27 %27 %27 %27 %6 %7 %27 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_3; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 5 
                                              %36 = OpTypePointer Uniform %6 
                               Private f32_3* %43 = OpVariable Private 
                                              %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %45 = OpTypePointer UniformConstant %44 
         UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
                                              %48 = OpTypeSampler 
                                              %49 = OpTypePointer UniformConstant %48 
                     UniformConstant sampler* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeSampledImage %44 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %18 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %19 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %66 = OpVariable Private 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Private %6 
                                          f32 %73 = OpConstant 3.674022E-40 
                               Private f32_3* %78 = OpVariable Private 
                                          f32 %88 = OpConstant 3.674022E-40 
                                          u32 %90 = OpConstant 2 
                               Private f32_3* %92 = OpVariable Private 
                                        f32_3 %94 = OpConstantComposite %19 %19 %88 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                     UniformConstant sampler* %98 = OpVariable UniformConstant 
                                Private f32* %106 = OpVariable Private 
                                         i32 %107 = OpConstant 2 
                                         u32 %108 = OpConstant 3 
                                         i32 %115 = OpConstant 3 
                                         u32 %132 = OpConstant 1 
                                             %143 = OpTypeBool 
                                             %144 = OpTypeVector %143 2 
                                             %145 = OpTypePointer Private %144 
                             Private bool_2* %146 = OpVariable Private 
                                       f32_4 %149 = OpConstantComposite %18 %18 %18 %18 
                                             %150 = OpTypeVector %143 4 
                                             %153 = OpTypeVector %34 2 
                                             %154 = OpTypePointer Private %153 
                              Private i32_2* %155 = OpVariable Private 
                                             %156 = OpTypePointer Private %143 
                                         u32 %160 = OpConstant 4294967295 
                                             %168 = OpTypePointer Private %34 
                             Private bool_2* %170 = OpVariable Private 
                                       f32_4 %171 = OpConstantComposite %19 %19 %18 %18 
                                             %188 = OpTypeVector %28 2 
                                       u32_2 %190 = OpConstantComposite %132 %132 
                               Private bool* %203 = OpVariable Private 
                                         f32 %204 = OpConstant 3.674022E-40 
                                Private f32* %208 = OpVariable Private 
                                         f32 %218 = OpConstant 3.674022E-40 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %224 = OpConstant 1 
                                       f32_2 %233 = OpConstantComposite %73 %73 
                                       f32_2 %235 = OpConstantComposite %88 %88 
                                         i32 %241 = OpConstant 0 
                                             %242 = OpTypePointer Uniform %27 
                              Private f32_2* %250 = OpVariable Private 
                                Private i32* %281 = OpVariable Private 
                                         i32 %282 = OpConstant 7 
                                         i32 %292 = OpConstant 4 
                                         f32 %299 = OpConstant 3.674022E-40 
                                         f32 %300 = OpConstant 3.674022E-40 
                                       f32_2 %301 = OpConstantComposite %299 %300 
                                         f32 %311 = OpConstant 3.674022E-40 
                              Private f32_2* %318 = OpVariable Private 
                                         f32 %319 = OpConstant 3.674022E-40 
                                             %321 = OpTypePointer Function %34 
                                Private f32* %331 = OpVariable Private 
                                             %334 = OpTypePointer Input %6 
                                         f32 %337 = OpConstant 3.674022E-40 
                                Private f32* %342 = OpVariable Private 
                                         f32 %345 = OpConstant 3.674022E-40 
                                         f32 %350 = OpConstant 3.674022E-40 
                              Private f32_3* %360 = OpVariable Private 
                                       f32_2 %366 = OpConstantComposite %19 %345 
                                         f32 %379 = OpConstant 3.674022E-40 
                                Private f32* %381 = OpVariable Private 
                              Private f32_2* %384 = OpVariable Private 
                              Private f32_3* %417 = OpVariable Private 
                               Private bool* %426 = OpVariable Private 
                                             %430 = OpTypePointer Function %7 
                              Private f32_2* %442 = OpVariable Private 
                                       f32_2 %481 = OpConstantComposite %19 %19 
                                         f32 %484 = OpConstant 3.674022E-40 
                                       f32_2 %485 = OpConstantComposite %484 %484 
                             Private bool_2* %530 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                                Private i32* %541 = OpVariable Private 
                                       f32_4 %544 = OpConstantComposite %73 %73 %18 %18 
                                Private i32* %555 = OpVariable Private 
                                         f32 %622 = OpConstant 3.674022E-40 
                                         f32 %632 = OpConstant 3.674022E-40 
                                         f32 %662 = OpConstant 3.674022E-40 
                                         f32 %671 = OpConstant 3.674022E-40 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         i32 %718 = OpConstant 6 
                                             %728 = OpTypePointer Output %27 
                               Output f32_4* %729 = OpVariable Output 
                                             %734 = OpTypePointer Output %6 
                                         f32 %737 = OpConstant 3.674022E-40 
                                       f32_3 %738 = OpConstantComposite %484 %484 %737 
                                       f32_3 %740 = OpConstantComposite %484 %484 %484 
                                Private i32* %745 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %322 = OpVariable Function 
                             Function f32_3* %431 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %37 = OpAccessChain %33 %35 
                                          f32 %38 = OpLoad %37 
                                        f32_2 %39 = OpCompositeConstruct %38 %38 
                                        f32_2 %40 = OpFMul %26 %39 
                                        f32_3 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %9 %42 
                          read_only Texture2D %47 = OpLoad %46 
                                      sampler %51 = OpLoad %50 
                   read_only Texture2DSampled %53 = OpSampledImage %47 %51 
                                        f32_3 %54 = OpLoad %9 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                        f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %43 %57 
                                        f32_3 %58 = OpLoad %43 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %43 %64 
                                        f32_3 %67 = OpLoad %43 
                                        f32_3 %68 = OpLoad %43 
                                          f32 %69 = OpDot %67 %68 
                                 Private f32* %72 = OpAccessChain %66 %70 
                                                      OpStore %72 %69 
                                 Private f32* %74 = OpAccessChain %66 %70 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFDiv %73 %75 
                                 Private f32* %77 = OpAccessChain %66 %70 
                                                      OpStore %77 %76 
                                        f32_3 %79 = OpLoad %43 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpLoad %66 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                        f32_2 %83 = OpFMul %80 %82 
                                        f32_3 %84 = OpLoad %78 
                                        f32_3 %85 = OpVectorShuffle %84 %83 3 4 2 
                                                      OpStore %78 %85 
                                 Private f32* %86 = OpAccessChain %66 %70 
                                          f32 %87 = OpLoad %86 
                                          f32 %89 = OpFAdd %87 %88 
                                 Private f32* %91 = OpAccessChain %78 %90 
                                                      OpStore %91 %89 
                                        f32_3 %93 = OpLoad %78 
                                        f32_3 %95 = OpFMul %93 %94 
                                                      OpStore %92 %95 
                          read_only Texture2D %97 = OpLoad %96 
                                      sampler %99 = OpLoad %98 
                  read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                                       f32_3 %101 = OpLoad %9 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpImageSampleExplicitLod %100 %102 Lod %27 
                                         f32 %104 = OpCompositeExtract %103 0 
                                Private f32* %105 = OpAccessChain %9 %70 
                                                      OpStore %105 %104 
                                Uniform f32* %109 = OpAccessChain %33 %107 %108 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %111 %19 
                                                      OpStore %106 %112 
                                Private f32* %113 = OpAccessChain %9 %70 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %33 %115 %70 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %114 %117 
                                Private f32* %119 = OpAccessChain %9 %70 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %33 %107 %108 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFNegate %121 
                                Private f32* %123 = OpAccessChain %9 %70 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFMul %122 %124 
                                         f32 %126 = OpFAdd %125 %19 
                                Private f32* %127 = OpAccessChain %66 %70 
                                                      OpStore %127 %126 
                                         f32 %128 = OpLoad %106 
                                Private f32* %129 = OpAccessChain %9 %70 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %128 %130 
                                Uniform f32* %133 = OpAccessChain %33 %115 %132 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFAdd %131 %134 
                                Private f32* %136 = OpAccessChain %9 %70 
                                                      OpStore %136 %135 
                                Private f32* %137 = OpAccessChain %66 %70 
                                         f32 %138 = OpLoad %137 
                                Private f32* %139 = OpAccessChain %9 %70 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFDiv %138 %140 
                                Private f32* %142 = OpAccessChain %9 %70 
                                                      OpStore %142 %141 
                                       f32_2 %147 = OpLoad vs_TEXCOORD0 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 1 0 1 
                                      bool_4 %151 = OpFOrdLessThan %148 %149 
                                      bool_2 %152 = OpVectorShuffle %151 %151 0 1 
                                                      OpStore %146 %152 
                               Private bool* %157 = OpAccessChain %146 %132 
                                        bool %158 = OpLoad %157 
                                         u32 %159 = OpSelect %158 %132 %70 
                                         u32 %161 = OpIMul %159 %160 
                               Private bool* %162 = OpAccessChain %146 %70 
                                        bool %163 = OpLoad %162 
                                         u32 %164 = OpSelect %163 %132 %70 
                                         u32 %165 = OpIMul %164 %160 
                                         u32 %166 = OpBitwiseOr %161 %165 
                                         i32 %167 = OpBitcast %166 
                                Private i32* %169 = OpAccessChain %155 %70 
                                                      OpStore %169 %167 
                                       f32_2 %172 = OpLoad vs_TEXCOORD0 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 0 
                                      bool_4 %174 = OpFOrdLessThan %171 %173 
                                      bool_2 %175 = OpVectorShuffle %174 %174 0 1 
                                                      OpStore %170 %175 
                               Private bool* %176 = OpAccessChain %170 %132 
                                        bool %177 = OpLoad %176 
                                         u32 %178 = OpSelect %177 %132 %70 
                                         u32 %179 = OpIMul %178 %160 
                               Private bool* %180 = OpAccessChain %170 %70 
                                        bool %181 = OpLoad %180 
                                         u32 %182 = OpSelect %181 %132 %70 
                                         u32 %183 = OpIMul %182 %160 
                                         u32 %184 = OpBitwiseOr %179 %183 
                                         i32 %185 = OpBitcast %184 
                                Private i32* %186 = OpAccessChain %155 %132 
                                                      OpStore %186 %185 
                                       i32_2 %187 = OpLoad %155 
                                       u32_2 %189 = OpBitcast %187 
                                       u32_2 %191 = OpBitwiseAnd %189 %190 
                                       i32_2 %192 = OpBitcast %191 
                                                      OpStore %155 %192 
                                Private i32* %193 = OpAccessChain %155 %132 
                                         i32 %194 = OpLoad %193 
                                Private i32* %195 = OpAccessChain %155 %70 
                                         i32 %196 = OpLoad %195 
                                         i32 %197 = OpIAdd %194 %196 
                                Private i32* %198 = OpAccessChain %155 %70 
                                                      OpStore %198 %197 
                                Private i32* %199 = OpAccessChain %155 %70 
                                         i32 %200 = OpLoad %199 
                                         f32 %201 = OpConvertSToF %200 
                                Private f32* %202 = OpAccessChain %66 %70 
                                                      OpStore %202 %201 
                                Private f32* %205 = OpAccessChain %9 %70 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %203 %207 
                                        bool %209 = OpLoad %203 
                                         f32 %210 = OpSelect %209 %19 %18 
                                                      OpStore %208 %210 
                                         f32 %211 = OpLoad %208 
                                Private f32* %212 = OpAccessChain %66 %70 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %66 %70 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %66 %70 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                Private f32* %220 = OpAccessChain %66 %70 
                                                      OpStore %220 %219 
                                Private f32* %222 = OpAccessChain %9 %70 
                                         f32 %223 = OpLoad %222 
                                Uniform f32* %225 = OpAccessChain %33 %224 %90 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %223 %226 
                                Private f32* %228 = OpAccessChain %66 %70 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %227 %229 
                                Private f32* %231 = OpAccessChain %221 %90 
                                                      OpStore %231 %230 
                                       f32_2 %232 = OpLoad vs_TEXCOORD0 
                                       f32_2 %234 = OpFMul %232 %233 
                                       f32_2 %236 = OpFAdd %234 %235 
                                       f32_3 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %236 3 1 4 
                                                      OpStore %9 %238 
                                       f32_3 %239 = OpLoad %9 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 2 
                              Uniform f32_4* %243 = OpAccessChain %33 %241 %107 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpFNegate %245 
                                       f32_2 %247 = OpFAdd %240 %246 
                                       f32_3 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %247 3 1 4 
                                                      OpStore %9 %249 
                                Uniform f32* %251 = OpAccessChain %33 %241 %241 %70 
                                         f32 %252 = OpLoad %251 
                                Private f32* %253 = OpAccessChain %250 %70 
                                                      OpStore %253 %252 
                                Uniform f32* %254 = OpAccessChain %33 %241 %224 %132 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %250 %132 
                                                      OpStore %256 %255 
                                       f32_3 %257 = OpLoad %9 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 2 
                                       f32_2 %259 = OpLoad %250 
                                       f32_2 %260 = OpFDiv %258 %259 
                                       f32_3 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %260 3 1 4 
                                                      OpStore %9 %262 
                                Private f32* %263 = OpAccessChain %221 %90 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                         f32 %266 = OpFAdd %265 %19 
                                                      OpStore %208 %266 
                                Uniform f32* %267 = OpAccessChain %33 %107 %108 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %208 
                                         f32 %270 = OpFMul %268 %269 
                                Private f32* %271 = OpAccessChain %221 %90 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %208 %273 
                                         f32 %274 = OpLoad %208 
                                       f32_2 %275 = OpCompositeConstruct %274 %274 
                                       f32_3 %276 = OpLoad %9 
                                       f32_2 %277 = OpVectorShuffle %276 %276 0 2 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %221 
                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                      OpStore %221 %280 
                                Uniform f32* %283 = OpAccessChain %33 %282 %108 
                                         f32 %284 = OpLoad %283 
                                         i32 %285 = OpConvertFToS %284 
                                                      OpStore %281 %285 
                                       f32_2 %286 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %287 = OpAccessChain %33 %282 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_2 %290 = OpFMul %286 %289 
                                                      OpStore %66 %290 
                                       f32_2 %291 = OpLoad %66 
                              Uniform f32_4* %293 = OpAccessChain %33 %292 
                                       f32_4 %294 = OpLoad %293 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                       f32_2 %296 = OpFMul %291 %295 
                                                      OpStore %66 %296 
                                       f32_2 %297 = OpLoad %66 
                                       f32_2 %298 = OpExtInst %1 8 %297 
                                                      OpStore %66 %298 
                                       f32_2 %302 = OpLoad %66 
                                         f32 %303 = OpDot %301 %302 
                                Private f32* %304 = OpAccessChain %66 %70 
                                                      OpStore %304 %303 
                                Private f32* %305 = OpAccessChain %66 %70 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpExtInst %1 10 %306 
                                Private f32* %308 = OpAccessChain %66 %70 
                                                      OpStore %308 %307 
                                Private f32* %309 = OpAccessChain %66 %70 
                                         f32 %310 = OpLoad %309 
                                         f32 %312 = OpFMul %310 %311 
                                Private f32* %313 = OpAccessChain %66 %70 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %66 %70 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpExtInst %1 10 %315 
                                Private f32* %317 = OpAccessChain %66 %70 
                                                      OpStore %317 %316 
                                Private f32* %320 = OpAccessChain %318 %70 
                                                      OpStore %320 %319 
                                                      OpStore %208 %18 
                                                      OpStore %322 %241 
                                                      OpBranch %323 
                                             %323 = OpLabel 
                                                      OpLoopMerge %325 %326 None 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         i32 %328 = OpLoad %322 
                                         i32 %329 = OpLoad %281 
                                        bool %330 = OpSLessThan %328 %329 
                                                      OpBranchConditional %330 %324 %325 
                                             %324 = OpLabel 
                                         i32 %332 = OpLoad %322 
                                         f32 %333 = OpConvertSToF %332 
                                                      OpStore %331 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD0 %70 
                                         f32 %336 = OpLoad %335 
                                         f32 %338 = OpFMul %336 %337 
                                         f32 %339 = OpLoad %331 
                                         f32 %340 = OpFAdd %338 %339 
                                Private f32* %341 = OpAccessChain %318 %132 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %318 %132 
                                         f32 %344 = OpLoad %343 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %342 %346 
                                         f32 %347 = OpLoad %342 
                                         f32 %348 = OpExtInst %1 13 %347 
                                                      OpStore %342 %348 
                                         f32 %349 = OpLoad %342 
                                         f32 %351 = OpFMul %349 %350 
                                                      OpStore %342 %351 
                                         f32 %352 = OpLoad %342 
                                         f32 %353 = OpExtInst %1 10 %352 
                                                      OpStore %342 %353 
                                Private f32* %354 = OpAccessChain %66 %70 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpLoad %342 
                                         f32 %357 = OpFAdd %355 %356 
                                                      OpStore %342 %357 
                                         f32 %358 = OpLoad %342 
                                         f32 %359 = OpExtInst %1 10 %358 
                                                      OpStore %342 %359 
                                         f32 %361 = OpLoad %342 
                                         f32 %362 = OpFMul %361 %73 
                                         f32 %363 = OpFAdd %362 %88 
                                Private f32* %364 = OpAccessChain %360 %90 
                                                      OpStore %364 %363 
                                       f32_2 %365 = OpLoad %318 
                                         f32 %367 = OpDot %365 %366 
                                                      OpStore %342 %367 
                                         f32 %368 = OpLoad %342 
                                         f32 %369 = OpExtInst %1 13 %368 
                                                      OpStore %342 %369 
                                         f32 %370 = OpLoad %342 
                                         f32 %371 = OpFMul %370 %350 
                                                      OpStore %342 %371 
                                         f32 %372 = OpLoad %342 
                                         f32 %373 = OpExtInst %1 10 %372 
                                                      OpStore %342 %373 
                                Private f32* %374 = OpAccessChain %66 %70 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpLoad %342 
                                         f32 %377 = OpFAdd %375 %376 
                                                      OpStore %342 %377 
                                         f32 %378 = OpLoad %342 
                                         f32 %380 = OpFMul %378 %379 
                                                      OpStore %342 %380 
                                         f32 %382 = OpLoad %342 
                                         f32 %383 = OpExtInst %1 13 %382 
                                                      OpStore %381 %383 
                                         f32 %385 = OpLoad %342 
                                         f32 %386 = OpExtInst %1 14 %385 
                                Private f32* %387 = OpAccessChain %384 %70 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %360 %90 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                Private f32* %391 = OpAccessChain %360 %90 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFMul %390 %392 
                                         f32 %394 = OpFAdd %393 %19 
                                                      OpStore %342 %394 
                                         f32 %395 = OpLoad %342 
                                         f32 %396 = OpExtInst %1 31 %395 
                                                      OpStore %342 %396 
                                         f32 %397 = OpLoad %381 
                                Private f32* %398 = OpAccessChain %384 %132 
                                                      OpStore %398 %397 
                                         f32 %399 = OpLoad %342 
                                       f32_2 %400 = OpCompositeConstruct %399 %399 
                                       f32_2 %401 = OpLoad %384 
                                       f32_2 %402 = OpFMul %400 %401 
                                       f32_3 %403 = OpLoad %360 
                                       f32_3 %404 = OpVectorShuffle %403 %402 3 4 2 
                                                      OpStore %360 %404 
                                         f32 %405 = OpLoad %331 
                                         f32 %406 = OpFAdd %405 %19 
                                                      OpStore %331 %406 
                                         f32 %407 = OpLoad %331 
                                Uniform f32* %408 = OpAccessChain %33 %282 %108 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFDiv %407 %409 
                                                      OpStore %331 %410 
                                         f32 %411 = OpLoad %331 
                                         f32 %412 = OpExtInst %1 31 %411 
                                                      OpStore %331 %412 
                                         f32 %413 = OpLoad %331 
                                Uniform f32* %414 = OpAccessChain %33 %282 %132 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %413 %415 
                                                      OpStore %331 %416 
                                         f32 %418 = OpLoad %331 
                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
                                       f32_3 %420 = OpLoad %360 
                                       f32_3 %421 = OpFMul %419 %420 
                                                      OpStore %417 %421 
                                       f32_3 %422 = OpLoad %92 
                                       f32_3 %423 = OpFNegate %422 
                                       f32_3 %424 = OpLoad %417 
                                         f32 %425 = OpDot %423 %424 
                                                      OpStore %331 %425 
                                         f32 %427 = OpLoad %331 
                                        bool %428 = OpFOrdGreaterThanEqual %427 %18 
                                                      OpStore %426 %428 
                                        bool %429 = OpLoad %426 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %429 %432 %436 
                                             %432 = OpLabel 
                                       f32_3 %434 = OpLoad %417 
                                       f32_3 %435 = OpFNegate %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                       f32_3 %437 = OpLoad %417 
                                                      OpStore %431 %437 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                       f32_3 %438 = OpLoad %431 
                                                      OpStore %417 %438 
                                       f32_3 %439 = OpLoad %221 
                                       f32_3 %440 = OpLoad %417 
                                       f32_3 %441 = OpFAdd %439 %440 
                                                      OpStore %417 %441 
                                       f32_3 %443 = OpLoad %417 
                                       f32_2 %444 = OpVectorShuffle %443 %443 1 1 
                              Uniform f32_4* %445 = OpAccessChain %33 %241 %224 
                                       f32_4 %446 = OpLoad %445 
                                       f32_2 %447 = OpVectorShuffle %446 %446 0 1 
                                       f32_2 %448 = OpFMul %444 %447 
                                                      OpStore %442 %448 
                              Uniform f32_4* %449 = OpAccessChain %33 %241 %241 
                                       f32_4 %450 = OpLoad %449 
                                       f32_2 %451 = OpVectorShuffle %450 %450 0 1 
                                       f32_3 %452 = OpLoad %417 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpFMul %451 %453 
                                       f32_2 %455 = OpLoad %442 
                                       f32_2 %456 = OpFAdd %454 %455 
                                                      OpStore %442 %456 
                              Uniform f32_4* %457 = OpAccessChain %33 %241 %107 
                                       f32_4 %458 = OpLoad %457 
                                       f32_2 %459 = OpVectorShuffle %458 %458 0 1 
                                       f32_3 %460 = OpLoad %417 
                                       f32_2 %461 = OpVectorShuffle %460 %460 2 2 
                                       f32_2 %462 = OpFMul %459 %461 
                                       f32_2 %463 = OpLoad %442 
                                       f32_2 %464 = OpFAdd %462 %463 
                                                      OpStore %442 %464 
                                Private f32* %465 = OpAccessChain %417 %90 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %19 
                                                      OpStore %331 %468 
                                Uniform f32* %469 = OpAccessChain %33 %107 %108 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpLoad %331 
                                         f32 %472 = OpFMul %470 %471 
                                Private f32* %473 = OpAccessChain %417 %90 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFAdd %472 %474 
                                                      OpStore %331 %475 
                                       f32_2 %476 = OpLoad %442 
                                         f32 %477 = OpLoad %331 
                                       f32_2 %478 = OpCompositeConstruct %477 %477 
                                       f32_2 %479 = OpFDiv %476 %478 
                                                      OpStore %442 %479 
                                       f32_2 %480 = OpLoad %442 
                                       f32_2 %482 = OpFAdd %480 %481 
                                                      OpStore %442 %482 
                                       f32_2 %483 = OpLoad %442 
                                       f32_2 %486 = OpFMul %483 %485 
                                       f32_3 %487 = OpLoad %417 
                                       f32_3 %488 = OpVectorShuffle %487 %486 3 4 2 
                                                      OpStore %417 %488 
                                       f32_3 %489 = OpLoad %417 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_2 %491 = OpCompositeConstruct %18 %18 
                                       f32_2 %492 = OpCompositeConstruct %19 %19 
                                       f32_2 %493 = OpExtInst %1 43 %490 %491 %492 
                                       f32_3 %494 = OpLoad %417 
                                       f32_3 %495 = OpVectorShuffle %494 %493 3 4 2 
                                                      OpStore %417 %495 
                                       f32_3 %496 = OpLoad %417 
                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
                                Uniform f32* %498 = OpAccessChain %33 %35 
                                         f32 %499 = OpLoad %498 
                                       f32_2 %500 = OpCompositeConstruct %499 %499 
                                       f32_2 %501 = OpFMul %497 %500 
                                       f32_3 %502 = OpLoad %417 
                                       f32_3 %503 = OpVectorShuffle %502 %501 3 4 2 
                                                      OpStore %417 %503 
                         read_only Texture2D %504 = OpLoad %96 
                                     sampler %505 = OpLoad %98 
                  read_only Texture2DSampled %506 = OpSampledImage %504 %505 
                                       f32_3 %507 = OpLoad %417 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
                                       f32_4 %509 = OpImageSampleExplicitLod %506 %508 Lod %27 
                                         f32 %510 = OpCompositeExtract %509 0 
                                                      OpStore %331 %510 
                                         f32 %511 = OpLoad %331 
                                Uniform f32* %512 = OpAccessChain %33 %115 %70 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                                      OpStore %331 %514 
                                Uniform f32* %515 = OpAccessChain %33 %107 %108 
                                         f32 %516 = OpLoad %515 
                                         f32 %517 = OpFNegate %516 
                                         f32 %518 = OpLoad %331 
                                         f32 %519 = OpFMul %517 %518 
                                         f32 %520 = OpFAdd %519 %19 
                                                      OpStore %342 %520 
                                         f32 %521 = OpLoad %106 
                                         f32 %522 = OpLoad %331 
                                         f32 %523 = OpFMul %521 %522 
                                Uniform f32* %524 = OpAccessChain %33 %115 %132 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFAdd %523 %525 
                                                      OpStore %331 %526 
                                         f32 %527 = OpLoad %342 
                                         f32 %528 = OpLoad %331 
                                         f32 %529 = OpFDiv %527 %528 
                                                      OpStore %331 %529 
                                       f32_2 %531 = OpLoad %442 
                                       f32_4 %532 = OpVectorShuffle %531 %531 0 1 0 0 
                                      bool_4 %533 = OpFOrdLessThan %532 %149 
                                      bool_2 %534 = OpVectorShuffle %533 %533 0 1 
                                                      OpStore %530 %534 
                               Private bool* %536 = OpAccessChain %530 %132 
                                        bool %537 = OpLoad %536 
                               Private bool* %538 = OpAccessChain %530 %70 
                                        bool %539 = OpLoad %538 
                                        bool %540 = OpLogicalOr %537 %539 
                                                      OpStore %535 %540 
                                        bool %542 = OpLoad %535 
                                         i32 %543 = OpSelect %542 %224 %241 
                                                      OpStore %541 %543 
                                       f32_2 %545 = OpLoad %442 
                                       f32_4 %546 = OpVectorShuffle %545 %545 0 1 0 0 
                                      bool_4 %547 = OpFOrdLessThan %544 %546 
                                      bool_2 %548 = OpVectorShuffle %547 %547 0 1 
                                                      OpStore %530 %548 
                               Private bool* %549 = OpAccessChain %530 %132 
                                        bool %550 = OpLoad %549 
                               Private bool* %551 = OpAccessChain %530 %70 
                                        bool %552 = OpLoad %551 
                                        bool %553 = OpLogicalOr %550 %552 
                               Private bool* %554 = OpAccessChain %530 %70 
                                                      OpStore %554 %553 
                               Private bool* %556 = OpAccessChain %530 %70 
                                        bool %557 = OpLoad %556 
                                         i32 %558 = OpSelect %557 %224 %241 
                                                      OpStore %555 %558 
                                         i32 %559 = OpLoad %541 
                                         i32 %560 = OpLoad %555 
                                         i32 %561 = OpIAdd %559 %560 
                                                      OpStore %541 %561 
                                         i32 %562 = OpLoad %541 
                                         f32 %563 = OpConvertSToF %562 
                                                      OpStore %342 %563 
                                         f32 %564 = OpLoad %331 
                                        bool %565 = OpFOrdGreaterThanEqual %204 %564 
                               Private bool* %566 = OpAccessChain %530 %70 
                                                      OpStore %566 %565 
                               Private bool* %567 = OpAccessChain %530 %70 
                                        bool %568 = OpLoad %567 
                                         f32 %569 = OpSelect %568 %19 %18 
                                Private f32* %570 = OpAccessChain %417 %70 
                                                      OpStore %570 %569 
                                         f32 %571 = OpLoad %342 
                                Private f32* %572 = OpAccessChain %417 %70 
                                         f32 %573 = OpLoad %572 
                                         f32 %574 = OpFAdd %571 %573 
                                                      OpStore %342 %574 
                                         f32 %575 = OpLoad %342 
                                         f32 %576 = OpFMul %575 %218 
                                                      OpStore %342 %576 
                                         f32 %577 = OpLoad %331 
                                Uniform f32* %578 = OpAccessChain %33 %224 %90 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFMul %577 %579 
                                         f32 %581 = OpLoad %342 
                                         f32 %582 = OpFAdd %580 %581 
                                Private f32* %583 = OpAccessChain %360 %90 
                                                      OpStore %583 %582 
                                       f32_2 %584 = OpLoad %442 
                              Uniform f32_4* %585 = OpAccessChain %33 %241 %107 
                                       f32_4 %586 = OpLoad %585 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 1 
                                       f32_2 %588 = OpFNegate %587 
                                       f32_2 %589 = OpFAdd %584 %588 
                                                      OpStore %442 %589 
                                       f32_2 %590 = OpLoad %442 
                                       f32_2 %591 = OpFAdd %590 %235 
                                                      OpStore %442 %591 
                                       f32_2 %592 = OpLoad %442 
                                       f32_2 %593 = OpLoad %250 
                                       f32_2 %594 = OpFDiv %592 %593 
                                                      OpStore %442 %594 
                                Private f32* %595 = OpAccessChain %360 %90 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                         f32 %598 = OpFAdd %597 %19 
                                                      OpStore %331 %598 
                                Uniform f32* %599 = OpAccessChain %33 %107 %108 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpLoad %331 
                                         f32 %602 = OpFMul %600 %601 
                                Private f32* %603 = OpAccessChain %360 %90 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFAdd %602 %604 
                                                      OpStore %331 %605 
                                         f32 %606 = OpLoad %331 
                                       f32_2 %607 = OpCompositeConstruct %606 %606 
                                       f32_2 %608 = OpLoad %442 
                                       f32_2 %609 = OpFMul %607 %608 
                                       f32_3 %610 = OpLoad %360 
                                       f32_3 %611 = OpVectorShuffle %610 %609 3 4 2 
                                                      OpStore %360 %611 
                                       f32_3 %612 = OpLoad %221 
                                       f32_3 %613 = OpFNegate %612 
                                       f32_3 %614 = OpLoad %360 
                                       f32_3 %615 = OpFAdd %613 %614 
                                                      OpStore %417 %615 
                                       f32_3 %616 = OpLoad %417 
                                       f32_3 %617 = OpLoad %92 
                                         f32 %618 = OpDot %616 %617 
                                                      OpStore %331 %618 
                                Private f32* %619 = OpAccessChain %221 %90 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFNegate %620 
                                         f32 %623 = OpFMul %621 %622 
                                         f32 %624 = OpLoad %331 
                                         f32 %625 = OpFAdd %623 %624 
                                                      OpStore %331 %625 
                                         f32 %626 = OpLoad %331 
                                         f32 %627 = OpExtInst %1 40 %626 %18 
                                                      OpStore %331 %627 
                                       f32_3 %628 = OpLoad %417 
                                       f32_3 %629 = OpLoad %417 
                                         f32 %630 = OpDot %628 %629 
                                                      OpStore %342 %630 
                                         f32 %631 = OpLoad %342 
                                         f32 %633 = OpFAdd %631 %632 
                                                      OpStore %342 %633 
                                         f32 %634 = OpLoad %331 
                                         f32 %635 = OpLoad %342 
                                         f32 %636 = OpFDiv %634 %635 
                                                      OpStore %331 %636 
                                         f32 %637 = OpLoad %208 
                                         f32 %638 = OpLoad %331 
                                         f32 %639 = OpFAdd %637 %638 
                                                      OpStore %208 %639 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         i32 %640 = OpLoad %322 
                                         i32 %641 = OpIAdd %640 %224 
                                                      OpStore %322 %641 
                                                      OpBranch %323 
                                             %325 = OpLabel 
                                         f32 %642 = OpLoad %208 
                                Uniform f32* %643 = OpAccessChain %33 %282 %132 
                                         f32 %644 = OpLoad %643 
                                         f32 %645 = OpFMul %642 %644 
                                Private f32* %646 = OpAccessChain %9 %70 
                                                      OpStore %646 %645 
                                Private f32* %647 = OpAccessChain %9 %70 
                                         f32 %648 = OpLoad %647 
                                Uniform f32* %649 = OpAccessChain %33 %282 %70 
                                         f32 %650 = OpLoad %649 
                                         f32 %651 = OpFMul %648 %650 
                                Private f32* %652 = OpAccessChain %9 %70 
                                                      OpStore %652 %651 
                                Private f32* %653 = OpAccessChain %9 %70 
                                         f32 %654 = OpLoad %653 
                                Uniform f32* %655 = OpAccessChain %33 %282 %108 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFDiv %654 %656 
                                Private f32* %658 = OpAccessChain %9 %70 
                                                      OpStore %658 %657 
                                Private f32* %659 = OpAccessChain %9 %70 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpExtInst %1 4 %660 
                                         f32 %663 = OpExtInst %1 40 %661 %662 
                                Private f32* %664 = OpAccessChain %9 %70 
                                                      OpStore %664 %663 
                                Private f32* %665 = OpAccessChain %9 %70 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpExtInst %1 30 %666 
                                Private f32* %668 = OpAccessChain %9 %70 
                                                      OpStore %668 %667 
                                Private f32* %669 = OpAccessChain %9 %70 
                                         f32 %670 = OpLoad %669 
                                         f32 %672 = OpFMul %670 %671 
                                Private f32* %673 = OpAccessChain %9 %70 
                                                      OpStore %673 %672 
                                Private f32* %674 = OpAccessChain %9 %70 
                                         f32 %675 = OpLoad %674 
                                         f32 %676 = OpExtInst %1 29 %675 
                                Private f32* %677 = OpAccessChain %9 %70 
                                                      OpStore %677 %676 
                         read_only Texture2D %678 = OpLoad %96 
                                     sampler %679 = OpLoad %98 
                  read_only Texture2DSampled %680 = OpSampledImage %678 %679 
                                       f32_2 %682 = OpLoad vs_TEXCOORD1 
                                       f32_4 %683 = OpImageSampleImplicitLod %680 %682 
                                         f32 %684 = OpCompositeExtract %683 0 
                                Private f32* %685 = OpAccessChain %66 %70 
                                                      OpStore %685 %684 
                                Private f32* %686 = OpAccessChain %66 %70 
                                         f32 %687 = OpLoad %686 
                                Uniform f32* %688 = OpAccessChain %33 %115 %70 
                                         f32 %689 = OpLoad %688 
                                         f32 %690 = OpFMul %687 %689 
                                Private f32* %691 = OpAccessChain %66 %70 
                                                      OpStore %691 %690 
                                Uniform f32* %692 = OpAccessChain %33 %107 %108 
                                         f32 %693 = OpLoad %692 
                                         f32 %694 = OpFNegate %693 
                                Private f32* %695 = OpAccessChain %66 %70 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFMul %694 %696 
                                         f32 %698 = OpFAdd %697 %19 
                                                      OpStore %208 %698 
                                         f32 %699 = OpLoad %106 
                                Private f32* %700 = OpAccessChain %66 %70 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpFMul %699 %701 
                                Uniform f32* %703 = OpAccessChain %33 %115 %132 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %702 %704 
                                                      OpStore %106 %705 
                                         f32 %706 = OpLoad %208 
                                         f32 %707 = OpLoad %106 
                                         f32 %708 = OpFDiv %706 %707 
                                                      OpStore %106 %708 
                                         f32 %709 = OpLoad %106 
                                Uniform f32* %710 = OpAccessChain %33 %224 %90 
                                         f32 %711 = OpLoad %710 
                                         f32 %712 = OpFMul %709 %711 
                                Uniform f32* %713 = OpAccessChain %33 %224 %132 
                                         f32 %714 = OpLoad %713 
                                         f32 %715 = OpFNegate %714 
                                         f32 %716 = OpFAdd %712 %715 
                                                      OpStore %106 %716 
                                         f32 %717 = OpLoad %106 
                                Uniform f32* %719 = OpAccessChain %33 %718 %70 
                                         f32 %720 = OpLoad %719 
                                         f32 %721 = OpFMul %717 %720 
                                                      OpStore %106 %721 
                                         f32 %722 = OpLoad %106 
                                         f32 %723 = OpLoad %106 
                                         f32 %724 = OpFNegate %723 
                                         f32 %725 = OpFMul %722 %724 
                                                      OpStore %106 %725 
                                         f32 %726 = OpLoad %106 
                                         f32 %727 = OpExtInst %1 29 %726 
                                                      OpStore %106 %727 
                                         f32 %730 = OpLoad %106 
                                Private f32* %731 = OpAccessChain %9 %70 
                                         f32 %732 = OpLoad %731 
                                         f32 %733 = OpFMul %730 %732 
                                 Output f32* %735 = OpAccessChain %729 %70 
                                                      OpStore %735 %733 
                                       f32_3 %736 = OpLoad %78 
                                       f32_3 %739 = OpFMul %736 %738 
                                       f32_3 %741 = OpFAdd %739 %740 
                                       f32_4 %742 = OpLoad %729 
                                       f32_4 %743 = OpVectorShuffle %742 %741 0 4 5 6 
                                                      OpStore %729 %743 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec3 _FogParams;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec2 u_xlat4;
vec2 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec2 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
vec3 u_xlat14;
int u_xlati14;
bvec2 u_xlatb14;
vec2 u_xlat18;
ivec2 u_xlati18;
bvec2 u_xlatb18;
vec2 u_xlat22;
float u_xlat27;
bool u_xlatb27;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
int u_xlati30;
bool u_xlatb30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = 2.0 / u_xlat18.x;
    u_xlat10.xy = u_xlat1.xy * u_xlat18.xx;
    u_xlat10.z = u_xlat18.x + -1.0;
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat9 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat18.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat18.x / u_xlat0.x;
    u_xlatb18.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati18.x = int((uint(u_xlatb18.y) * 0xffffffffu) | (uint(u_xlatb18.x) * 0xffffffffu));
    u_xlatb3.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati18.y = int((uint(u_xlatb3.y) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu));
    u_xlati18.xy = ivec2(uvec2(u_xlati18.xy) & uvec2(1u, 1u));
    u_xlati18.x = u_xlati18.y + u_xlati18.x;
    u_xlat18.x = float(u_xlati18.x);
    u_xlatb27 = 9.99999975e-06>=u_xlat0.x;
    u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat27 + u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 100000000.0;
    u_xlat3.z = u_xlat0.x * _ProjectionParams.z + u_xlat18.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat4.xy;
    u_xlat27 = (-u_xlat3.z) + 1.0;
    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat18.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat18.xy = u_xlat18.xy * _ScreenParams.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat18.xy);
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat18.x = u_xlat18.x * 52.9829178;
    u_xlat18.x = fract(u_xlat18.x);
    u_xlat5.x = 12.9898005;
    u_xlat27 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat29 = float(u_xlati_loop_1);
        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
        u_xlat30 = u_xlat5.y * 78.2330017;
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = fract(u_xlat30);
        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
        u_xlat30 = sin(u_xlat30);
        u_xlat30 = u_xlat30 * 43758.5469;
        u_xlat30 = fract(u_xlat30);
        u_xlat30 = u_xlat18.x + u_xlat30;
        u_xlat30 = u_xlat30 * 6.28318548;
        u_xlat7 = sin(u_xlat30);
        u_xlat8.x = cos(u_xlat30);
        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
        u_xlat30 = sqrt(u_xlat30);
        u_xlat8.y = u_xlat7;
        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
        u_xlat29 = u_xlat29 + 1.0;
        u_xlat29 = u_xlat29 / _AOParams.w;
        u_xlat29 = sqrt(u_xlat29);
        u_xlat29 = u_xlat29 * _AOParams.y;
        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
        u_xlatb29 = u_xlat29>=0.0;
        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
        u_xlat22.xy = u_xlat14.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
        u_xlat29 = (-u_xlat14.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
        u_xlat14.xy = u_xlat22.xy * vec2(0.5, 0.5);
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat6 = textureLod(_CameraDepthTexture, u_xlat14.xy, 0.0);
        u_xlat29 = u_xlat6.x * _ZBufferParams.x;
        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
        u_xlat29 = u_xlat9 * u_xlat29 + _ZBufferParams.y;
        u_xlat29 = u_xlat30 / u_xlat29;
        u_xlatb14.xy = lessThan(u_xlat22.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb30 = u_xlatb14.y || u_xlatb14.x;
        u_xlati30 = u_xlatb30 ? 1 : int(0);
        u_xlatb14.xy = lessThan(vec4(2.0, 2.0, 0.0, 0.0), u_xlat22.xyxx).xy;
        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
        u_xlati14 = u_xlatb14.x ? 1 : int(0);
        u_xlati30 = u_xlati30 + u_xlati14;
        u_xlat30 = float(u_xlati30);
        u_xlatb14.x = 9.99999975e-06>=u_xlat29;
        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
        u_xlat30 = u_xlat30 + u_xlat14.x;
        u_xlat30 = u_xlat30 * 100000000.0;
        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
        u_xlat22.xy = u_xlat22.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
        u_xlat29 = (-u_xlat6.z) + 1.0;
        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
        u_xlat29 = max(u_xlat29, 0.0);
        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat30 = u_xlat30 + 9.99999975e-05;
        u_xlat29 = u_xlat29 / u_xlat30;
        u_xlat27 = u_xlat27 + u_xlat29;
    }
    u_xlat0.x = u_xlat27 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat18.x = u_xlat2.x * _ZBufferParams.x;
    u_xlat27 = (-unity_OrthoParams.w) * u_xlat18.x + 1.0;
    u_xlat9 = u_xlat9 * u_xlat18.x + _ZBufferParams.y;
    u_xlat9 = u_xlat27 / u_xlat9;
    u_xlat9 = u_xlat9 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat9 = (-u_xlat9) + _FogParams.z;
    u_xlat18.x = (-_FogParams.y) + _FogParams.z;
    u_xlat9 = u_xlat9 / u_xlat18.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    SV_Target0.x = u_xlat9 * u_xlat0.x;
    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 754
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %681 %737 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpMemberDecorate %31 0 Offset 31 
                                                      OpMemberDecorate %31 1 Offset 31 
                                                      OpMemberDecorate %31 2 Offset 31 
                                                      OpMemberDecorate %31 3 Offset 31 
                                                      OpMemberDecorate %31 4 Offset 31 
                                                      OpMemberDecorate %31 5 Offset 31 
                                                      OpMemberDecorate %31 6 Offset 31 
                                                      OpMemberDecorate %31 7 Offset 31 
                                                      OpDecorate %31 Block 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %50 DescriptorSet 50 
                                                      OpDecorate %50 Binding 50 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %98 DescriptorSet 98 
                                                      OpDecorate %98 Binding 98 
                                                      OpDecorate vs_TEXCOORD1 Location 681 
                                                      OpDecorate %737 Location 737 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeStruct %30 %27 %27 %27 %27 %6 %7 %27 
                                              %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_3; f32_4;}* %33 = OpVariable Uniform 
                                              %34 = OpTypeInt 32 1 
                                          i32 %35 = OpConstant 5 
                                              %36 = OpTypePointer Uniform %6 
                               Private f32_3* %43 = OpVariable Private 
                                              %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %45 = OpTypePointer UniformConstant %44 
         UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
                                              %48 = OpTypeSampler 
                                              %49 = OpTypePointer UniformConstant %48 
                     UniformConstant sampler* %50 = OpVariable UniformConstant 
                                              %52 = OpTypeSampledImage %44 
                                          f32 %59 = OpConstant 3.674022E-40 
                                        f32_3 %60 = OpConstantComposite %59 %59 %18 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_3 %63 = OpConstantComposite %62 %62 %19 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %66 = OpVariable Private 
                                          u32 %70 = OpConstant 0 
                                              %71 = OpTypePointer Private %6 
                                          f32 %73 = OpConstant 3.674022E-40 
                               Private f32_3* %78 = OpVariable Private 
                                          f32 %88 = OpConstant 3.674022E-40 
                                          u32 %90 = OpConstant 2 
                               Private f32_3* %92 = OpVariable Private 
                                        f32_3 %94 = OpConstantComposite %19 %19 %88 
         UniformConstant read_only Texture2D* %96 = OpVariable UniformConstant 
                     UniformConstant sampler* %98 = OpVariable UniformConstant 
                                Private f32* %106 = OpVariable Private 
                                         i32 %107 = OpConstant 2 
                                         u32 %108 = OpConstant 3 
                                         i32 %115 = OpConstant 3 
                                         u32 %132 = OpConstant 1 
                                             %143 = OpTypeBool 
                                             %144 = OpTypeVector %143 2 
                                             %145 = OpTypePointer Private %144 
                             Private bool_2* %146 = OpVariable Private 
                                       f32_4 %149 = OpConstantComposite %18 %18 %18 %18 
                                             %150 = OpTypeVector %143 4 
                                             %153 = OpTypeVector %34 2 
                                             %154 = OpTypePointer Private %153 
                              Private i32_2* %155 = OpVariable Private 
                                             %156 = OpTypePointer Private %143 
                                         u32 %160 = OpConstant 4294967295 
                                             %168 = OpTypePointer Private %34 
                             Private bool_2* %170 = OpVariable Private 
                                       f32_4 %171 = OpConstantComposite %19 %19 %18 %18 
                                             %188 = OpTypeVector %28 2 
                                       u32_2 %190 = OpConstantComposite %132 %132 
                               Private bool* %203 = OpVariable Private 
                                         f32 %204 = OpConstant 3.674022E-40 
                                Private f32* %208 = OpVariable Private 
                                         f32 %218 = OpConstant 3.674022E-40 
                              Private f32_3* %221 = OpVariable Private 
                                         i32 %224 = OpConstant 1 
                                       f32_2 %233 = OpConstantComposite %73 %73 
                                       f32_2 %235 = OpConstantComposite %88 %88 
                                         i32 %241 = OpConstant 0 
                                             %242 = OpTypePointer Uniform %27 
                              Private f32_2* %250 = OpVariable Private 
                                Private i32* %281 = OpVariable Private 
                                         i32 %282 = OpConstant 7 
                                         i32 %292 = OpConstant 4 
                                         f32 %299 = OpConstant 3.674022E-40 
                                         f32 %300 = OpConstant 3.674022E-40 
                                       f32_2 %301 = OpConstantComposite %299 %300 
                                         f32 %311 = OpConstant 3.674022E-40 
                              Private f32_2* %318 = OpVariable Private 
                                         f32 %319 = OpConstant 3.674022E-40 
                                             %321 = OpTypePointer Function %34 
                                Private f32* %331 = OpVariable Private 
                                             %334 = OpTypePointer Input %6 
                                         f32 %337 = OpConstant 3.674022E-40 
                                Private f32* %342 = OpVariable Private 
                                         f32 %345 = OpConstant 3.674022E-40 
                                         f32 %350 = OpConstant 3.674022E-40 
                              Private f32_3* %360 = OpVariable Private 
                                       f32_2 %366 = OpConstantComposite %19 %345 
                                         f32 %379 = OpConstant 3.674022E-40 
                                Private f32* %381 = OpVariable Private 
                              Private f32_2* %384 = OpVariable Private 
                              Private f32_3* %417 = OpVariable Private 
                               Private bool* %426 = OpVariable Private 
                                             %430 = OpTypePointer Function %7 
                              Private f32_2* %442 = OpVariable Private 
                                       f32_2 %481 = OpConstantComposite %19 %19 
                                         f32 %484 = OpConstant 3.674022E-40 
                                       f32_2 %485 = OpConstantComposite %484 %484 
                             Private bool_2* %530 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                                Private i32* %541 = OpVariable Private 
                                       f32_4 %544 = OpConstantComposite %73 %73 %18 %18 
                                Private i32* %555 = OpVariable Private 
                                         f32 %622 = OpConstant 3.674022E-40 
                                         f32 %632 = OpConstant 3.674022E-40 
                                         f32 %662 = OpConstant 3.674022E-40 
                                         f32 %671 = OpConstant 3.674022E-40 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         i32 %719 = OpConstant 6 
                                             %736 = OpTypePointer Output %27 
                               Output f32_4* %737 = OpVariable Output 
                                             %742 = OpTypePointer Output %6 
                                         f32 %745 = OpConstant 3.674022E-40 
                                       f32_3 %746 = OpConstantComposite %484 %484 %745 
                                       f32_3 %748 = OpConstantComposite %484 %484 %484 
                                Private i32* %753 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %322 = OpVariable Function 
                             Function f32_3* %431 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %37 = OpAccessChain %33 %35 
                                          f32 %38 = OpLoad %37 
                                        f32_2 %39 = OpCompositeConstruct %38 %38 
                                        f32_2 %40 = OpFMul %26 %39 
                                        f32_3 %41 = OpLoad %9 
                                        f32_3 %42 = OpVectorShuffle %41 %40 3 4 2 
                                                      OpStore %9 %42 
                          read_only Texture2D %47 = OpLoad %46 
                                      sampler %51 = OpLoad %50 
                   read_only Texture2DSampled %53 = OpSampledImage %47 %51 
                                        f32_3 %54 = OpLoad %9 
                                        f32_2 %55 = OpVectorShuffle %54 %54 0 1 
                                        f32_4 %56 = OpImageSampleImplicitLod %53 %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                                      OpStore %43 %57 
                                        f32_3 %58 = OpLoad %43 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_3 %64 = OpFAdd %61 %63 
                                                      OpStore %43 %64 
                                        f32_3 %67 = OpLoad %43 
                                        f32_3 %68 = OpLoad %43 
                                          f32 %69 = OpDot %67 %68 
                                 Private f32* %72 = OpAccessChain %66 %70 
                                                      OpStore %72 %69 
                                 Private f32* %74 = OpAccessChain %66 %70 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFDiv %73 %75 
                                 Private f32* %77 = OpAccessChain %66 %70 
                                                      OpStore %77 %76 
                                        f32_3 %79 = OpLoad %43 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_2 %81 = OpLoad %66 
                                        f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                        f32_2 %83 = OpFMul %80 %82 
                                        f32_3 %84 = OpLoad %78 
                                        f32_3 %85 = OpVectorShuffle %84 %83 3 4 2 
                                                      OpStore %78 %85 
                                 Private f32* %86 = OpAccessChain %66 %70 
                                          f32 %87 = OpLoad %86 
                                          f32 %89 = OpFAdd %87 %88 
                                 Private f32* %91 = OpAccessChain %78 %90 
                                                      OpStore %91 %89 
                                        f32_3 %93 = OpLoad %78 
                                        f32_3 %95 = OpFMul %93 %94 
                                                      OpStore %92 %95 
                          read_only Texture2D %97 = OpLoad %96 
                                      sampler %99 = OpLoad %98 
                  read_only Texture2DSampled %100 = OpSampledImage %97 %99 
                                       f32_3 %101 = OpLoad %9 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpImageSampleExplicitLod %100 %102 Lod %27 
                                         f32 %104 = OpCompositeExtract %103 0 
                                Private f32* %105 = OpAccessChain %9 %70 
                                                      OpStore %105 %104 
                                Uniform f32* %109 = OpAccessChain %33 %107 %108 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                         f32 %112 = OpFAdd %111 %19 
                                                      OpStore %106 %112 
                                Private f32* %113 = OpAccessChain %9 %70 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %33 %115 %70 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFMul %114 %117 
                                Private f32* %119 = OpAccessChain %9 %70 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %33 %107 %108 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFNegate %121 
                                Private f32* %123 = OpAccessChain %9 %70 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFMul %122 %124 
                                         f32 %126 = OpFAdd %125 %19 
                                Private f32* %127 = OpAccessChain %66 %70 
                                                      OpStore %127 %126 
                                         f32 %128 = OpLoad %106 
                                Private f32* %129 = OpAccessChain %9 %70 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFMul %128 %130 
                                Uniform f32* %133 = OpAccessChain %33 %115 %132 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFAdd %131 %134 
                                Private f32* %136 = OpAccessChain %9 %70 
                                                      OpStore %136 %135 
                                Private f32* %137 = OpAccessChain %66 %70 
                                         f32 %138 = OpLoad %137 
                                Private f32* %139 = OpAccessChain %9 %70 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFDiv %138 %140 
                                Private f32* %142 = OpAccessChain %9 %70 
                                                      OpStore %142 %141 
                                       f32_2 %147 = OpLoad vs_TEXCOORD0 
                                       f32_4 %148 = OpVectorShuffle %147 %147 0 1 0 1 
                                      bool_4 %151 = OpFOrdLessThan %148 %149 
                                      bool_2 %152 = OpVectorShuffle %151 %151 0 1 
                                                      OpStore %146 %152 
                               Private bool* %157 = OpAccessChain %146 %132 
                                        bool %158 = OpLoad %157 
                                         u32 %159 = OpSelect %158 %132 %70 
                                         u32 %161 = OpIMul %159 %160 
                               Private bool* %162 = OpAccessChain %146 %70 
                                        bool %163 = OpLoad %162 
                                         u32 %164 = OpSelect %163 %132 %70 
                                         u32 %165 = OpIMul %164 %160 
                                         u32 %166 = OpBitwiseOr %161 %165 
                                         i32 %167 = OpBitcast %166 
                                Private i32* %169 = OpAccessChain %155 %70 
                                                      OpStore %169 %167 
                                       f32_2 %172 = OpLoad vs_TEXCOORD0 
                                       f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 0 
                                      bool_4 %174 = OpFOrdLessThan %171 %173 
                                      bool_2 %175 = OpVectorShuffle %174 %174 0 1 
                                                      OpStore %170 %175 
                               Private bool* %176 = OpAccessChain %170 %132 
                                        bool %177 = OpLoad %176 
                                         u32 %178 = OpSelect %177 %132 %70 
                                         u32 %179 = OpIMul %178 %160 
                               Private bool* %180 = OpAccessChain %170 %70 
                                        bool %181 = OpLoad %180 
                                         u32 %182 = OpSelect %181 %132 %70 
                                         u32 %183 = OpIMul %182 %160 
                                         u32 %184 = OpBitwiseOr %179 %183 
                                         i32 %185 = OpBitcast %184 
                                Private i32* %186 = OpAccessChain %155 %132 
                                                      OpStore %186 %185 
                                       i32_2 %187 = OpLoad %155 
                                       u32_2 %189 = OpBitcast %187 
                                       u32_2 %191 = OpBitwiseAnd %189 %190 
                                       i32_2 %192 = OpBitcast %191 
                                                      OpStore %155 %192 
                                Private i32* %193 = OpAccessChain %155 %132 
                                         i32 %194 = OpLoad %193 
                                Private i32* %195 = OpAccessChain %155 %70 
                                         i32 %196 = OpLoad %195 
                                         i32 %197 = OpIAdd %194 %196 
                                Private i32* %198 = OpAccessChain %155 %70 
                                                      OpStore %198 %197 
                                Private i32* %199 = OpAccessChain %155 %70 
                                         i32 %200 = OpLoad %199 
                                         f32 %201 = OpConvertSToF %200 
                                Private f32* %202 = OpAccessChain %66 %70 
                                                      OpStore %202 %201 
                                Private f32* %205 = OpAccessChain %9 %70 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %203 %207 
                                        bool %209 = OpLoad %203 
                                         f32 %210 = OpSelect %209 %19 %18 
                                                      OpStore %208 %210 
                                         f32 %211 = OpLoad %208 
                                Private f32* %212 = OpAccessChain %66 %70 
                                         f32 %213 = OpLoad %212 
                                         f32 %214 = OpFAdd %211 %213 
                                Private f32* %215 = OpAccessChain %66 %70 
                                                      OpStore %215 %214 
                                Private f32* %216 = OpAccessChain %66 %70 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                Private f32* %220 = OpAccessChain %66 %70 
                                                      OpStore %220 %219 
                                Private f32* %222 = OpAccessChain %9 %70 
                                         f32 %223 = OpLoad %222 
                                Uniform f32* %225 = OpAccessChain %33 %224 %90 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %223 %226 
                                Private f32* %228 = OpAccessChain %66 %70 
                                         f32 %229 = OpLoad %228 
                                         f32 %230 = OpFAdd %227 %229 
                                Private f32* %231 = OpAccessChain %221 %90 
                                                      OpStore %231 %230 
                                       f32_2 %232 = OpLoad vs_TEXCOORD0 
                                       f32_2 %234 = OpFMul %232 %233 
                                       f32_2 %236 = OpFAdd %234 %235 
                                       f32_3 %237 = OpLoad %9 
                                       f32_3 %238 = OpVectorShuffle %237 %236 3 1 4 
                                                      OpStore %9 %238 
                                       f32_3 %239 = OpLoad %9 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 2 
                              Uniform f32_4* %243 = OpAccessChain %33 %241 %107 
                                       f32_4 %244 = OpLoad %243 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpFNegate %245 
                                       f32_2 %247 = OpFAdd %240 %246 
                                       f32_3 %248 = OpLoad %9 
                                       f32_3 %249 = OpVectorShuffle %248 %247 3 1 4 
                                                      OpStore %9 %249 
                                Uniform f32* %251 = OpAccessChain %33 %241 %241 %70 
                                         f32 %252 = OpLoad %251 
                                Private f32* %253 = OpAccessChain %250 %70 
                                                      OpStore %253 %252 
                                Uniform f32* %254 = OpAccessChain %33 %241 %224 %132 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %250 %132 
                                                      OpStore %256 %255 
                                       f32_3 %257 = OpLoad %9 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 2 
                                       f32_2 %259 = OpLoad %250 
                                       f32_2 %260 = OpFDiv %258 %259 
                                       f32_3 %261 = OpLoad %9 
                                       f32_3 %262 = OpVectorShuffle %261 %260 3 1 4 
                                                      OpStore %9 %262 
                                Private f32* %263 = OpAccessChain %221 %90 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFNegate %264 
                                         f32 %266 = OpFAdd %265 %19 
                                                      OpStore %208 %266 
                                Uniform f32* %267 = OpAccessChain %33 %107 %108 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %208 
                                         f32 %270 = OpFMul %268 %269 
                                Private f32* %271 = OpAccessChain %221 %90 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %208 %273 
                                         f32 %274 = OpLoad %208 
                                       f32_2 %275 = OpCompositeConstruct %274 %274 
                                       f32_3 %276 = OpLoad %9 
                                       f32_2 %277 = OpVectorShuffle %276 %276 0 2 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %221 
                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                      OpStore %221 %280 
                                Uniform f32* %283 = OpAccessChain %33 %282 %108 
                                         f32 %284 = OpLoad %283 
                                         i32 %285 = OpConvertFToS %284 
                                                      OpStore %281 %285 
                                       f32_2 %286 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %287 = OpAccessChain %33 %282 
                                       f32_4 %288 = OpLoad %287 
                                       f32_2 %289 = OpVectorShuffle %288 %288 2 2 
                                       f32_2 %290 = OpFMul %286 %289 
                                                      OpStore %66 %290 
                                       f32_2 %291 = OpLoad %66 
                              Uniform f32_4* %293 = OpAccessChain %33 %292 
                                       f32_4 %294 = OpLoad %293 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                       f32_2 %296 = OpFMul %291 %295 
                                                      OpStore %66 %296 
                                       f32_2 %297 = OpLoad %66 
                                       f32_2 %298 = OpExtInst %1 8 %297 
                                                      OpStore %66 %298 
                                       f32_2 %302 = OpLoad %66 
                                         f32 %303 = OpDot %301 %302 
                                Private f32* %304 = OpAccessChain %66 %70 
                                                      OpStore %304 %303 
                                Private f32* %305 = OpAccessChain %66 %70 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpExtInst %1 10 %306 
                                Private f32* %308 = OpAccessChain %66 %70 
                                                      OpStore %308 %307 
                                Private f32* %309 = OpAccessChain %66 %70 
                                         f32 %310 = OpLoad %309 
                                         f32 %312 = OpFMul %310 %311 
                                Private f32* %313 = OpAccessChain %66 %70 
                                                      OpStore %313 %312 
                                Private f32* %314 = OpAccessChain %66 %70 
                                         f32 %315 = OpLoad %314 
                                         f32 %316 = OpExtInst %1 10 %315 
                                Private f32* %317 = OpAccessChain %66 %70 
                                                      OpStore %317 %316 
                                Private f32* %320 = OpAccessChain %318 %70 
                                                      OpStore %320 %319 
                                                      OpStore %208 %18 
                                                      OpStore %322 %241 
                                                      OpBranch %323 
                                             %323 = OpLabel 
                                                      OpLoopMerge %325 %326 None 
                                                      OpBranch %327 
                                             %327 = OpLabel 
                                         i32 %328 = OpLoad %322 
                                         i32 %329 = OpLoad %281 
                                        bool %330 = OpSLessThan %328 %329 
                                                      OpBranchConditional %330 %324 %325 
                                             %324 = OpLabel 
                                         i32 %332 = OpLoad %322 
                                         f32 %333 = OpConvertSToF %332 
                                                      OpStore %331 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD0 %70 
                                         f32 %336 = OpLoad %335 
                                         f32 %338 = OpFMul %336 %337 
                                         f32 %339 = OpLoad %331 
                                         f32 %340 = OpFAdd %338 %339 
                                Private f32* %341 = OpAccessChain %318 %132 
                                                      OpStore %341 %340 
                                Private f32* %343 = OpAccessChain %318 %132 
                                         f32 %344 = OpLoad %343 
                                         f32 %346 = OpFMul %344 %345 
                                                      OpStore %342 %346 
                                         f32 %347 = OpLoad %342 
                                         f32 %348 = OpExtInst %1 13 %347 
                                                      OpStore %342 %348 
                                         f32 %349 = OpLoad %342 
                                         f32 %351 = OpFMul %349 %350 
                                                      OpStore %342 %351 
                                         f32 %352 = OpLoad %342 
                                         f32 %353 = OpExtInst %1 10 %352 
                                                      OpStore %342 %353 
                                Private f32* %354 = OpAccessChain %66 %70 
                                         f32 %355 = OpLoad %354 
                                         f32 %356 = OpLoad %342 
                                         f32 %357 = OpFAdd %355 %356 
                                                      OpStore %342 %357 
                                         f32 %358 = OpLoad %342 
                                         f32 %359 = OpExtInst %1 10 %358 
                                                      OpStore %342 %359 
                                         f32 %361 = OpLoad %342 
                                         f32 %362 = OpFMul %361 %73 
                                         f32 %363 = OpFAdd %362 %88 
                                Private f32* %364 = OpAccessChain %360 %90 
                                                      OpStore %364 %363 
                                       f32_2 %365 = OpLoad %318 
                                         f32 %367 = OpDot %365 %366 
                                                      OpStore %342 %367 
                                         f32 %368 = OpLoad %342 
                                         f32 %369 = OpExtInst %1 13 %368 
                                                      OpStore %342 %369 
                                         f32 %370 = OpLoad %342 
                                         f32 %371 = OpFMul %370 %350 
                                                      OpStore %342 %371 
                                         f32 %372 = OpLoad %342 
                                         f32 %373 = OpExtInst %1 10 %372 
                                                      OpStore %342 %373 
                                Private f32* %374 = OpAccessChain %66 %70 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpLoad %342 
                                         f32 %377 = OpFAdd %375 %376 
                                                      OpStore %342 %377 
                                         f32 %378 = OpLoad %342 
                                         f32 %380 = OpFMul %378 %379 
                                                      OpStore %342 %380 
                                         f32 %382 = OpLoad %342 
                                         f32 %383 = OpExtInst %1 13 %382 
                                                      OpStore %381 %383 
                                         f32 %385 = OpLoad %342 
                                         f32 %386 = OpExtInst %1 14 %385 
                                Private f32* %387 = OpAccessChain %384 %70 
                                                      OpStore %387 %386 
                                Private f32* %388 = OpAccessChain %360 %90 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFNegate %389 
                                Private f32* %391 = OpAccessChain %360 %90 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpFMul %390 %392 
                                         f32 %394 = OpFAdd %393 %19 
                                                      OpStore %342 %394 
                                         f32 %395 = OpLoad %342 
                                         f32 %396 = OpExtInst %1 31 %395 
                                                      OpStore %342 %396 
                                         f32 %397 = OpLoad %381 
                                Private f32* %398 = OpAccessChain %384 %132 
                                                      OpStore %398 %397 
                                         f32 %399 = OpLoad %342 
                                       f32_2 %400 = OpCompositeConstruct %399 %399 
                                       f32_2 %401 = OpLoad %384 
                                       f32_2 %402 = OpFMul %400 %401 
                                       f32_3 %403 = OpLoad %360 
                                       f32_3 %404 = OpVectorShuffle %403 %402 3 4 2 
                                                      OpStore %360 %404 
                                         f32 %405 = OpLoad %331 
                                         f32 %406 = OpFAdd %405 %19 
                                                      OpStore %331 %406 
                                         f32 %407 = OpLoad %331 
                                Uniform f32* %408 = OpAccessChain %33 %282 %108 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpFDiv %407 %409 
                                                      OpStore %331 %410 
                                         f32 %411 = OpLoad %331 
                                         f32 %412 = OpExtInst %1 31 %411 
                                                      OpStore %331 %412 
                                         f32 %413 = OpLoad %331 
                                Uniform f32* %414 = OpAccessChain %33 %282 %132 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %413 %415 
                                                      OpStore %331 %416 
                                         f32 %418 = OpLoad %331 
                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
                                       f32_3 %420 = OpLoad %360 
                                       f32_3 %421 = OpFMul %419 %420 
                                                      OpStore %417 %421 
                                       f32_3 %422 = OpLoad %92 
                                       f32_3 %423 = OpFNegate %422 
                                       f32_3 %424 = OpLoad %417 
                                         f32 %425 = OpDot %423 %424 
                                                      OpStore %331 %425 
                                         f32 %427 = OpLoad %331 
                                        bool %428 = OpFOrdGreaterThanEqual %427 %18 
                                                      OpStore %426 %428 
                                        bool %429 = OpLoad %426 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %429 %432 %436 
                                             %432 = OpLabel 
                                       f32_3 %434 = OpLoad %417 
                                       f32_3 %435 = OpFNegate %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                       f32_3 %437 = OpLoad %417 
                                                      OpStore %431 %437 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                       f32_3 %438 = OpLoad %431 
                                                      OpStore %417 %438 
                                       f32_3 %439 = OpLoad %221 
                                       f32_3 %440 = OpLoad %417 
                                       f32_3 %441 = OpFAdd %439 %440 
                                                      OpStore %417 %441 
                                       f32_3 %443 = OpLoad %417 
                                       f32_2 %444 = OpVectorShuffle %443 %443 1 1 
                              Uniform f32_4* %445 = OpAccessChain %33 %241 %224 
                                       f32_4 %446 = OpLoad %445 
                                       f32_2 %447 = OpVectorShuffle %446 %446 0 1 
                                       f32_2 %448 = OpFMul %444 %447 
                                                      OpStore %442 %448 
                              Uniform f32_4* %449 = OpAccessChain %33 %241 %241 
                                       f32_4 %450 = OpLoad %449 
                                       f32_2 %451 = OpVectorShuffle %450 %450 0 1 
                                       f32_3 %452 = OpLoad %417 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpFMul %451 %453 
                                       f32_2 %455 = OpLoad %442 
                                       f32_2 %456 = OpFAdd %454 %455 
                                                      OpStore %442 %456 
                              Uniform f32_4* %457 = OpAccessChain %33 %241 %107 
                                       f32_4 %458 = OpLoad %457 
                                       f32_2 %459 = OpVectorShuffle %458 %458 0 1 
                                       f32_3 %460 = OpLoad %417 
                                       f32_2 %461 = OpVectorShuffle %460 %460 2 2 
                                       f32_2 %462 = OpFMul %459 %461 
                                       f32_2 %463 = OpLoad %442 
                                       f32_2 %464 = OpFAdd %462 %463 
                                                      OpStore %442 %464 
                                Private f32* %465 = OpAccessChain %417 %90 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                         f32 %468 = OpFAdd %467 %19 
                                                      OpStore %331 %468 
                                Uniform f32* %469 = OpAccessChain %33 %107 %108 
                                         f32 %470 = OpLoad %469 
                                         f32 %471 = OpLoad %331 
                                         f32 %472 = OpFMul %470 %471 
                                Private f32* %473 = OpAccessChain %417 %90 
                                         f32 %474 = OpLoad %473 
                                         f32 %475 = OpFAdd %472 %474 
                                                      OpStore %331 %475 
                                       f32_2 %476 = OpLoad %442 
                                         f32 %477 = OpLoad %331 
                                       f32_2 %478 = OpCompositeConstruct %477 %477 
                                       f32_2 %479 = OpFDiv %476 %478 
                                                      OpStore %442 %479 
                                       f32_2 %480 = OpLoad %442 
                                       f32_2 %482 = OpFAdd %480 %481 
                                                      OpStore %442 %482 
                                       f32_2 %483 = OpLoad %442 
                                       f32_2 %486 = OpFMul %483 %485 
                                       f32_3 %487 = OpLoad %417 
                                       f32_3 %488 = OpVectorShuffle %487 %486 3 4 2 
                                                      OpStore %417 %488 
                                       f32_3 %489 = OpLoad %417 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_2 %491 = OpCompositeConstruct %18 %18 
                                       f32_2 %492 = OpCompositeConstruct %19 %19 
                                       f32_2 %493 = OpExtInst %1 43 %490 %491 %492 
                                       f32_3 %494 = OpLoad %417 
                                       f32_3 %495 = OpVectorShuffle %494 %493 3 4 2 
                                                      OpStore %417 %495 
                                       f32_3 %496 = OpLoad %417 
                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
                                Uniform f32* %498 = OpAccessChain %33 %35 
                                         f32 %499 = OpLoad %498 
                                       f32_2 %500 = OpCompositeConstruct %499 %499 
                                       f32_2 %501 = OpFMul %497 %500 
                                       f32_3 %502 = OpLoad %417 
                                       f32_3 %503 = OpVectorShuffle %502 %501 3 4 2 
                                                      OpStore %417 %503 
                         read_only Texture2D %504 = OpLoad %96 
                                     sampler %505 = OpLoad %98 
                  read_only Texture2DSampled %506 = OpSampledImage %504 %505 
                                       f32_3 %507 = OpLoad %417 
                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
                                       f32_4 %509 = OpImageSampleExplicitLod %506 %508 Lod %27 
                                         f32 %510 = OpCompositeExtract %509 0 
                                                      OpStore %331 %510 
                                         f32 %511 = OpLoad %331 
                                Uniform f32* %512 = OpAccessChain %33 %115 %70 
                                         f32 %513 = OpLoad %512 
                                         f32 %514 = OpFMul %511 %513 
                                                      OpStore %331 %514 
                                Uniform f32* %515 = OpAccessChain %33 %107 %108 
                                         f32 %516 = OpLoad %515 
                                         f32 %517 = OpFNegate %516 
                                         f32 %518 = OpLoad %331 
                                         f32 %519 = OpFMul %517 %518 
                                         f32 %520 = OpFAdd %519 %19 
                                                      OpStore %342 %520 
                                         f32 %521 = OpLoad %106 
                                         f32 %522 = OpLoad %331 
                                         f32 %523 = OpFMul %521 %522 
                                Uniform f32* %524 = OpAccessChain %33 %115 %132 
                                         f32 %525 = OpLoad %524 
                                         f32 %526 = OpFAdd %523 %525 
                                                      OpStore %331 %526 
                                         f32 %527 = OpLoad %342 
                                         f32 %528 = OpLoad %331 
                                         f32 %529 = OpFDiv %527 %528 
                                                      OpStore %331 %529 
                                       f32_2 %531 = OpLoad %442 
                                       f32_4 %532 = OpVectorShuffle %531 %531 0 1 0 0 
                                      bool_4 %533 = OpFOrdLessThan %532 %149 
                                      bool_2 %534 = OpVectorShuffle %533 %533 0 1 
                                                      OpStore %530 %534 
                               Private bool* %536 = OpAccessChain %530 %132 
                                        bool %537 = OpLoad %536 
                               Private bool* %538 = OpAccessChain %530 %70 
                                        bool %539 = OpLoad %538 
                                        bool %540 = OpLogicalOr %537 %539 
                                                      OpStore %535 %540 
                                        bool %542 = OpLoad %535 
                                         i32 %543 = OpSelect %542 %224 %241 
                                                      OpStore %541 %543 
                                       f32_2 %545 = OpLoad %442 
                                       f32_4 %546 = OpVectorShuffle %545 %545 0 1 0 0 
                                      bool_4 %547 = OpFOrdLessThan %544 %546 
                                      bool_2 %548 = OpVectorShuffle %547 %547 0 1 
                                                      OpStore %530 %548 
                               Private bool* %549 = OpAccessChain %530 %132 
                                        bool %550 = OpLoad %549 
                               Private bool* %551 = OpAccessChain %530 %70 
                                        bool %552 = OpLoad %551 
                                        bool %553 = OpLogicalOr %550 %552 
                               Private bool* %554 = OpAccessChain %530 %70 
                                                      OpStore %554 %553 
                               Private bool* %556 = OpAccessChain %530 %70 
                                        bool %557 = OpLoad %556 
                                         i32 %558 = OpSelect %557 %224 %241 
                                                      OpStore %555 %558 
                                         i32 %559 = OpLoad %541 
                                         i32 %560 = OpLoad %555 
                                         i32 %561 = OpIAdd %559 %560 
                                                      OpStore %541 %561 
                                         i32 %562 = OpLoad %541 
                                         f32 %563 = OpConvertSToF %562 
                                                      OpStore %342 %563 
                                         f32 %564 = OpLoad %331 
                                        bool %565 = OpFOrdGreaterThanEqual %204 %564 
                               Private bool* %566 = OpAccessChain %530 %70 
                                                      OpStore %566 %565 
                               Private bool* %567 = OpAccessChain %530 %70 
                                        bool %568 = OpLoad %567 
                                         f32 %569 = OpSelect %568 %19 %18 
                                Private f32* %570 = OpAccessChain %417 %70 
                                                      OpStore %570 %569 
                                         f32 %571 = OpLoad %342 
                                Private f32* %572 = OpAccessChain %417 %70 
                                         f32 %573 = OpLoad %572 
                                         f32 %574 = OpFAdd %571 %573 
                                                      OpStore %342 %574 
                                         f32 %575 = OpLoad %342 
                                         f32 %576 = OpFMul %575 %218 
                                                      OpStore %342 %576 
                                         f32 %577 = OpLoad %331 
                                Uniform f32* %578 = OpAccessChain %33 %224 %90 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFMul %577 %579 
                                         f32 %581 = OpLoad %342 
                                         f32 %582 = OpFAdd %580 %581 
                                Private f32* %583 = OpAccessChain %360 %90 
                                                      OpStore %583 %582 
                                       f32_2 %584 = OpLoad %442 
                              Uniform f32_4* %585 = OpAccessChain %33 %241 %107 
                                       f32_4 %586 = OpLoad %585 
                                       f32_2 %587 = OpVectorShuffle %586 %586 0 1 
                                       f32_2 %588 = OpFNegate %587 
                                       f32_2 %589 = OpFAdd %584 %588 
                                                      OpStore %442 %589 
                                       f32_2 %590 = OpLoad %442 
                                       f32_2 %591 = OpFAdd %590 %235 
                                                      OpStore %442 %591 
                                       f32_2 %592 = OpLoad %442 
                                       f32_2 %593 = OpLoad %250 
                                       f32_2 %594 = OpFDiv %592 %593 
                                                      OpStore %442 %594 
                                Private f32* %595 = OpAccessChain %360 %90 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                         f32 %598 = OpFAdd %597 %19 
                                                      OpStore %331 %598 
                                Uniform f32* %599 = OpAccessChain %33 %107 %108 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpLoad %331 
                                         f32 %602 = OpFMul %600 %601 
                                Private f32* %603 = OpAccessChain %360 %90 
                                         f32 %604 = OpLoad %603 
                                         f32 %605 = OpFAdd %602 %604 
                                                      OpStore %331 %605 
                                         f32 %606 = OpLoad %331 
                                       f32_2 %607 = OpCompositeConstruct %606 %606 
                                       f32_2 %608 = OpLoad %442 
                                       f32_2 %609 = OpFMul %607 %608 
                                       f32_3 %610 = OpLoad %360 
                                       f32_3 %611 = OpVectorShuffle %610 %609 3 4 2 
                                                      OpStore %360 %611 
                                       f32_3 %612 = OpLoad %221 
                                       f32_3 %613 = OpFNegate %612 
                                       f32_3 %614 = OpLoad %360 
                                       f32_3 %615 = OpFAdd %613 %614 
                                                      OpStore %417 %615 
                                       f32_3 %616 = OpLoad %417 
                                       f32_3 %617 = OpLoad %92 
                                         f32 %618 = OpDot %616 %617 
                                                      OpStore %331 %618 
                                Private f32* %619 = OpAccessChain %221 %90 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFNegate %620 
                                         f32 %623 = OpFMul %621 %622 
                                         f32 %624 = OpLoad %331 
                                         f32 %625 = OpFAdd %623 %624 
                                                      OpStore %331 %625 
                                         f32 %626 = OpLoad %331 
                                         f32 %627 = OpExtInst %1 40 %626 %18 
                                                      OpStore %331 %627 
                                       f32_3 %628 = OpLoad %417 
                                       f32_3 %629 = OpLoad %417 
                                         f32 %630 = OpDot %628 %629 
                                                      OpStore %342 %630 
                                         f32 %631 = OpLoad %342 
                                         f32 %633 = OpFAdd %631 %632 
                                                      OpStore %342 %633 
                                         f32 %634 = OpLoad %331 
                                         f32 %635 = OpLoad %342 
                                         f32 %636 = OpFDiv %634 %635 
                                                      OpStore %331 %636 
                                         f32 %637 = OpLoad %208 
                                         f32 %638 = OpLoad %331 
                                         f32 %639 = OpFAdd %637 %638 
                                                      OpStore %208 %639 
                                                      OpBranch %326 
                                             %326 = OpLabel 
                                         i32 %640 = OpLoad %322 
                                         i32 %641 = OpIAdd %640 %224 
                                                      OpStore %322 %641 
                                                      OpBranch %323 
                                             %325 = OpLabel 
                                         f32 %642 = OpLoad %208 
                                Uniform f32* %643 = OpAccessChain %33 %282 %132 
                                         f32 %644 = OpLoad %643 
                                         f32 %645 = OpFMul %642 %644 
                                Private f32* %646 = OpAccessChain %9 %70 
                                                      OpStore %646 %645 
                                Private f32* %647 = OpAccessChain %9 %70 
                                         f32 %648 = OpLoad %647 
                                Uniform f32* %649 = OpAccessChain %33 %282 %70 
                                         f32 %650 = OpLoad %649 
                                         f32 %651 = OpFMul %648 %650 
                                Private f32* %652 = OpAccessChain %9 %70 
                                                      OpStore %652 %651 
                                Private f32* %653 = OpAccessChain %9 %70 
                                         f32 %654 = OpLoad %653 
                                Uniform f32* %655 = OpAccessChain %33 %282 %108 
                                         f32 %656 = OpLoad %655 
                                         f32 %657 = OpFDiv %654 %656 
                                Private f32* %658 = OpAccessChain %9 %70 
                                                      OpStore %658 %657 
                                Private f32* %659 = OpAccessChain %9 %70 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpExtInst %1 4 %660 
                                         f32 %663 = OpExtInst %1 40 %661 %662 
                                Private f32* %664 = OpAccessChain %9 %70 
                                                      OpStore %664 %663 
                                Private f32* %665 = OpAccessChain %9 %70 
                                         f32 %666 = OpLoad %665 
                                         f32 %667 = OpExtInst %1 30 %666 
                                Private f32* %668 = OpAccessChain %9 %70 
                                                      OpStore %668 %667 
                                Private f32* %669 = OpAccessChain %9 %70 
                                         f32 %670 = OpLoad %669 
                                         f32 %672 = OpFMul %670 %671 
                                Private f32* %673 = OpAccessChain %9 %70 
                                                      OpStore %673 %672 
                                Private f32* %674 = OpAccessChain %9 %70 
                                         f32 %675 = OpLoad %674 
                                         f32 %676 = OpExtInst %1 29 %675 
                                Private f32* %677 = OpAccessChain %9 %70 
                                                      OpStore %677 %676 
                         read_only Texture2D %678 = OpLoad %96 
                                     sampler %679 = OpLoad %98 
                  read_only Texture2DSampled %680 = OpSampledImage %678 %679 
                                       f32_2 %682 = OpLoad vs_TEXCOORD1 
                                       f32_4 %683 = OpImageSampleImplicitLod %680 %682 
                                         f32 %684 = OpCompositeExtract %683 0 
                                Private f32* %685 = OpAccessChain %66 %70 
                                                      OpStore %685 %684 
                                Private f32* %686 = OpAccessChain %66 %70 
                                         f32 %687 = OpLoad %686 
                                Uniform f32* %688 = OpAccessChain %33 %115 %70 
                                         f32 %689 = OpLoad %688 
                                         f32 %690 = OpFMul %687 %689 
                                Private f32* %691 = OpAccessChain %66 %70 
                                                      OpStore %691 %690 
                                Uniform f32* %692 = OpAccessChain %33 %107 %108 
                                         f32 %693 = OpLoad %692 
                                         f32 %694 = OpFNegate %693 
                                Private f32* %695 = OpAccessChain %66 %70 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFMul %694 %696 
                                         f32 %698 = OpFAdd %697 %19 
                                                      OpStore %208 %698 
                                         f32 %699 = OpLoad %106 
                                Private f32* %700 = OpAccessChain %66 %70 
                                         f32 %701 = OpLoad %700 
                                         f32 %702 = OpFMul %699 %701 
                                Uniform f32* %703 = OpAccessChain %33 %115 %132 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %702 %704 
                                                      OpStore %106 %705 
                                         f32 %706 = OpLoad %208 
                                         f32 %707 = OpLoad %106 
                                         f32 %708 = OpFDiv %706 %707 
                                                      OpStore %106 %708 
                                         f32 %709 = OpLoad %106 
                                Uniform f32* %710 = OpAccessChain %33 %224 %90 
                                         f32 %711 = OpLoad %710 
                                         f32 %712 = OpFMul %709 %711 
                                Uniform f32* %713 = OpAccessChain %33 %224 %132 
                                         f32 %714 = OpLoad %713 
                                         f32 %715 = OpFNegate %714 
                                         f32 %716 = OpFAdd %712 %715 
                                                      OpStore %106 %716 
                                         f32 %717 = OpLoad %106 
                                         f32 %718 = OpFNegate %717 
                                Uniform f32* %720 = OpAccessChain %33 %719 %90 
                                         f32 %721 = OpLoad %720 
                                         f32 %722 = OpFAdd %718 %721 
                                                      OpStore %106 %722 
                                Uniform f32* %723 = OpAccessChain %33 %719 %132 
                                         f32 %724 = OpLoad %723 
                                         f32 %725 = OpFNegate %724 
                                Uniform f32* %726 = OpAccessChain %33 %719 %90 
                                         f32 %727 = OpLoad %726 
                                         f32 %728 = OpFAdd %725 %727 
                                Private f32* %729 = OpAccessChain %66 %70 
                                                      OpStore %729 %728 
                                         f32 %730 = OpLoad %106 
                                Private f32* %731 = OpAccessChain %66 %70 
                                         f32 %732 = OpLoad %731 
                                         f32 %733 = OpFDiv %730 %732 
                                                      OpStore %106 %733 
                                         f32 %734 = OpLoad %106 
                                         f32 %735 = OpExtInst %1 43 %734 %18 %19 
                                                      OpStore %106 %735 
                                         f32 %738 = OpLoad %106 
                                Private f32* %739 = OpAccessChain %9 %70 
                                         f32 %740 = OpLoad %739 
                                         f32 %741 = OpFMul %738 %740 
                                 Output f32* %743 = OpAccessChain %737 %70 
                                                      OpStore %743 %741 
                                       f32_3 %744 = OpLoad %78 
                                       f32_3 %747 = OpFMul %744 %746 
                                       f32_3 %749 = OpFAdd %747 %748 
                                       f32_4 %750 = OpLoad %737 
                                       f32_4 %751 = OpVectorShuffle %750 %749 0 4 5 6 
                                                      OpStore %737 %751 
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
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" }
""
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" }
""
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 97176
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec2 u_xlat7;
float u_xlat8;
vec3 u_xlat12;
ivec2 u_xlati12;
bvec2 u_xlatb12;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
vec2 u_xlat19;
float u_xlat20;
bvec2 u_xlatb20;
float u_xlat24;
bool u_xlatb24;
int u_xlati25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb16.x = u_xlat16.x!=0.0;
    u_xlat16.x = (u_xlatb16.x) ? -1.0 : -0.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat8 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat16.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat8 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat16.x / u_xlat0.x;
    u_xlatb16.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati16.x = int((uint(u_xlatb16.y) * 0xffffffffu) | (uint(u_xlatb16.x) * 0xffffffffu));
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati16.y = int((uint(u_xlatb2.y) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu));
    u_xlati16.xy = ivec2(uvec2(u_xlati16.xy) & uvec2(1u, 1u));
    u_xlati16.x = u_xlati16.y + u_xlati16.x;
    u_xlat16.x = float(u_xlati16.x);
    u_xlatb24 = 9.99999975e-06>=u_xlat0.x;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat24 + u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 100000000.0;
    u_xlat2.z = u_xlat0.x * _ProjectionParams.z + u_xlat16.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat3.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat3.xy;
    u_xlat24 = (-u_xlat2.z) + 1.0;
    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat16.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat16.xy = u_xlat16.xy * _ScreenParams.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat16.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat16.xy);
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 52.9829178;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat4.x = 12.9898005;
    u_xlat24 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat26 = float(u_xlati_loop_1);
        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
        u_xlat19.x = u_xlat4.y * 78.2330017;
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = u_xlat19.x * 6.28318548;
        u_xlat6 = sin(u_xlat19.x);
        u_xlat7.x = cos(u_xlat19.x);
        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
        u_xlat19.x = sqrt(u_xlat19.x);
        u_xlat7.y = u_xlat6;
        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
        u_xlat26 = u_xlat26 + 1.0;
        u_xlat26 = u_xlat26 / _AOParams.w;
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = u_xlat26 * _AOParams.y;
        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
        u_xlatb26 = u_xlat26>=0.0;
        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
        u_xlat19.xy = u_xlat12.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
        u_xlat26 = (-u_xlat12.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
        u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
        u_xlat12.xy = u_xlat12.xy * vec2(_RenderViewportScaleFactor);
        u_xlat5 = textureLod(_CameraDepthTexture, u_xlat12.xy, 0.0);
        u_xlat26 = u_xlat5.x * _ZBufferParams.x;
        u_xlat12.x = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
        u_xlat26 = u_xlat8 * u_xlat26 + _ZBufferParams.y;
        u_xlat26 = u_xlat12.x / u_xlat26;
        u_xlatb12.xy = lessThan(u_xlat19.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
        u_xlatb20.xy = lessThan(vec4(2.0, 2.0, 2.0, 2.0), u_xlat19.xyxy).xy;
        u_xlati12.y = int((uint(u_xlatb20.y) * 0xffffffffu) | (uint(u_xlatb20.x) * 0xffffffffu));
        u_xlati12.xy = ivec2(uvec2(u_xlati12.xy) & uvec2(1u, 1u));
        u_xlati12.x = u_xlati12.y + u_xlati12.x;
        u_xlat12.x = float(u_xlati12.x);
        u_xlatb20.x = 9.99999975e-06>=u_xlat26;
        u_xlat20 = u_xlatb20.x ? 1.0 : float(0.0);
        u_xlat12.x = u_xlat20 + u_xlat12.x;
        u_xlat12.x = u_xlat12.x * 100000000.0;
        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
        u_xlat19.xy = u_xlat19.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
        u_xlat26 = (-u_xlat5.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
        u_xlat26 = u_xlat26 / u_xlat19.x;
        u_xlat24 = u_xlat24 + u_xlat26;
    }
    u_xlat0.x = u_xlat24 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    SV_Target0.x = exp2(u_xlat0.x);
    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 768
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %753 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %48 DescriptorSet 48 
                                                      OpDecorate %48 Binding 48 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %129 DescriptorSet 129 
                                                      OpDecorate %129 Binding 129 
                                                      OpDecorate %131 DescriptorSet 131 
                                                      OpDecorate %131 Binding 131 
                                                      OpDecorate %753 Location 753 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeArray %27 %29 
                                              %32 = OpTypeStruct %30 %31 %27 %27 %27 %27 %6 %27 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 6 
                                              %37 = OpTypePointer Uniform %6 
                                              %44 = OpTypePointer Private %27 
                               Private f32_4* %45 = OpVariable Private 
                                              %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %47 = OpTypePointer UniformConstant %46 
         UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                              %50 = OpTypeSampler 
                                              %51 = OpTypePointer UniformConstant %50 
                     UniformConstant sampler* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampledImage %46 
                                              %62 = OpTypePointer Private %10 
                               Private f32_2* %63 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Private %6 
                                              %72 = OpTypeBool 
                                              %73 = OpTypeVector %72 2 
                                              %74 = OpTypePointer Private %73 
                              Private bool_2* %75 = OpVariable Private 
                                              %79 = OpTypePointer Private %72 
                                          f32 %83 = OpConstant 3.674022E-40 
                                          f32 %84 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                        f32_3 %90 = OpConstantComposite %89 %89 %89 
                               Private f32_3* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 1 
                                             %101 = OpTypePointer Uniform %27 
                                         i32 %106 = OpConstant 0 
                                         i32 %117 = OpConstant 2 
        UniformConstant read_only Texture2D* %129 = OpVariable UniformConstant 
                    UniformConstant sampler* %131 = OpVariable UniformConstant 
                                Private f32* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 3 
                                         u32 %141 = OpConstant 3 
                                         i32 %148 = OpConstant 4 
                                         u32 %165 = OpConstant 1 
                                       f32_4 %178 = OpConstantComposite %18 %18 %18 %18 
                                             %179 = OpTypeVector %72 4 
                                             %182 = OpTypeVector %35 2 
                                             %183 = OpTypePointer Private %182 
                              Private i32_2* %184 = OpVariable Private 
                                         u32 %188 = OpConstant 4294967295 
                                             %196 = OpTypePointer Private %35 
                             Private bool_2* %198 = OpVariable Private 
                                       f32_4 %199 = OpConstantComposite %19 %19 %18 %18 
                                             %216 = OpTypeVector %28 2 
                                       u32_2 %218 = OpConstantComposite %165 %165 
                               Private bool* %231 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                Private f32* %236 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                         u32 %251 = OpConstant 2 
                                       f32_2 %260 = OpConstantComposite %89 %89 
                                       f32_2 %262 = OpConstantComposite %83 %83 
                              Private f32_2* %275 = OpVariable Private 
                                Private i32* %306 = OpVariable Private 
                                         i32 %307 = OpConstant 7 
                                         i32 %317 = OpConstant 5 
                                         f32 %324 = OpConstant 3.674022E-40 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_2 %326 = OpConstantComposite %324 %325 
                                         f32 %336 = OpConstant 3.674022E-40 
                              Private f32_2* %343 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                             %346 = OpTypePointer Function %35 
                                Private f32* %356 = OpVariable Private 
                                             %359 = OpTypePointer Input %6 
                                         f32 %362 = OpConstant 3.674022E-40 
                              Private f32_2* %367 = OpVariable Private 
                                         f32 %370 = OpConstant 3.674022E-40 
                                         f32 %379 = OpConstant 3.674022E-40 
                              Private f32_3* %396 = OpVariable Private 
                                       f32_2 %403 = OpConstantComposite %19 %370 
                                         f32 %426 = OpConstant 3.674022E-40 
                                Private f32* %429 = OpVariable Private 
                              Private f32_2* %433 = OpVariable Private 
                              Private f32_3* %470 = OpVariable Private 
                               Private bool* %480 = OpVariable Private 
                                             %484 = OpTypePointer Function %7 
                                       f32_2 %534 = OpConstantComposite %19 %19 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_2 %538 = OpConstantComposite %537 %537 
                             Private bool_2* %585 = OpVariable Private 
                              Private i32_2* %590 = OpVariable Private 
                             Private bool_2* %602 = OpVariable Private 
                                       f32_4 %603 = OpConstantComposite %89 %89 %89 %89 
                                Private f32* %636 = OpVariable Private 
                                         f32 %696 = OpConstant 3.674022E-40 
                                         f32 %708 = OpConstant 3.674022E-40 
                                         f32 %740 = OpConstant 3.674022E-40 
                                         f32 %749 = OpConstant 3.674022E-40 
                                             %752 = OpTypePointer Output %27 
                               Output f32_4* %753 = OpVariable Output 
                                             %757 = OpTypePointer Output %6 
                                       f32_3 %761 = OpConstantComposite %537 %537 %537 
                                Private i32* %767 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %347 = OpVariable Function 
                             Function f32_3* %485 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %38 = OpAccessChain %34 %36 
                                          f32 %39 = OpLoad %38 
                                        f32_2 %40 = OpCompositeConstruct %39 %39 
                                        f32_2 %41 = OpFMul %26 %40 
                                        f32_3 %42 = OpLoad %9 
                                        f32_3 %43 = OpVectorShuffle %42 %41 3 4 2 
                                                      OpStore %9 %43 
                          read_only Texture2D %49 = OpLoad %48 
                                      sampler %53 = OpLoad %52 
                   read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                        f32_3 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_4 %60 = OpLoad %45 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %45 %61 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_4 %66 = OpLoad %45 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                          f32 %68 = OpDot %65 %67 
                                 Private f32* %71 = OpAccessChain %63 %69 
                                                      OpStore %71 %68 
                                 Private f32* %76 = OpAccessChain %63 %69 
                                          f32 %77 = OpLoad %76 
                                         bool %78 = OpFOrdNotEqual %77 %18 
                                Private bool* %80 = OpAccessChain %75 %69 
                                                      OpStore %80 %78 
                                Private bool* %81 = OpAccessChain %75 %69 
                                         bool %82 = OpLoad %81 
                                          f32 %85 = OpSelect %82 %83 %84 
                                 Private f32* %86 = OpAccessChain %63 %69 
                                                      OpStore %86 %85 
                                        f32_4 %87 = OpLoad %45 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_2 %92 = OpLoad %63 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFAdd %91 %93 
                                        f32_4 %95 = OpLoad %45 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %45 %96 
                                        f32_4 %98 = OpLoad %45 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                              Uniform f32_4* %102 = OpAccessChain %34 %100 %100 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFMul %99 %104 
                                                      OpStore %97 %105 
                              Uniform f32_4* %107 = OpAccessChain %34 %100 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_4 %110 = OpLoad %45 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_3 %113 = OpLoad %97 
                                       f32_3 %114 = OpFAdd %112 %113 
                                       f32_4 %115 = OpLoad %45 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 6 
                                                      OpStore %45 %116 
                              Uniform f32_4* %118 = OpAccessChain %34 %100 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_4 %121 = OpLoad %45 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %45 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 3 
                                       f32_3 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %45 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %45 %128 
                         read_only Texture2D %130 = OpLoad %129 
                                     sampler %132 = OpLoad %131 
                  read_only Texture2DSampled %133 = OpSampledImage %130 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_4 %136 = OpImageSampleExplicitLod %133 %135 Lod %27 
                                         f32 %137 = OpCompositeExtract %136 0 
                                Private f32* %138 = OpAccessChain %9 %69 
                                                      OpStore %138 %137 
                                Uniform f32* %142 = OpAccessChain %34 %140 %141 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFNegate %143 
                                         f32 %145 = OpFAdd %144 %19 
                                                      OpStore %139 %145 
                                Private f32* %146 = OpAccessChain %9 %69 
                                         f32 %147 = OpLoad %146 
                                Uniform f32* %149 = OpAccessChain %34 %148 %69 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %147 %150 
                                Private f32* %152 = OpAccessChain %9 %69 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %34 %140 %141 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                Private f32* %156 = OpAccessChain %9 %69 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                         f32 %159 = OpFAdd %158 %19 
                                Private f32* %160 = OpAccessChain %63 %69 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %139 
                                Private f32* %162 = OpAccessChain %9 %69 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Uniform f32* %166 = OpAccessChain %34 %148 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %164 %167 
                                Private f32* %169 = OpAccessChain %9 %69 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %63 %69 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %9 %69 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFDiv %171 %173 
                                Private f32* %175 = OpAccessChain %9 %69 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad vs_TEXCOORD0 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 1 0 1 
                                      bool_4 %180 = OpFOrdLessThan %177 %178 
                                      bool_2 %181 = OpVectorShuffle %180 %180 0 1 
                                                      OpStore %75 %181 
                               Private bool* %185 = OpAccessChain %75 %165 
                                        bool %186 = OpLoad %185 
                                         u32 %187 = OpSelect %186 %165 %69 
                                         u32 %189 = OpIMul %187 %188 
                               Private bool* %190 = OpAccessChain %75 %69 
                                        bool %191 = OpLoad %190 
                                         u32 %192 = OpSelect %191 %165 %69 
                                         u32 %193 = OpIMul %192 %188 
                                         u32 %194 = OpBitwiseOr %189 %193 
                                         i32 %195 = OpBitcast %194 
                                Private i32* %197 = OpAccessChain %184 %69 
                                                      OpStore %197 %195 
                                       f32_2 %200 = OpLoad vs_TEXCOORD0 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 1 0 0 
                                      bool_4 %202 = OpFOrdLessThan %199 %201 
                                      bool_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore %198 %203 
                               Private bool* %204 = OpAccessChain %198 %165 
                                        bool %205 = OpLoad %204 
                                         u32 %206 = OpSelect %205 %165 %69 
                                         u32 %207 = OpIMul %206 %188 
                               Private bool* %208 = OpAccessChain %198 %69 
                                        bool %209 = OpLoad %208 
                                         u32 %210 = OpSelect %209 %165 %69 
                                         u32 %211 = OpIMul %210 %188 
                                         u32 %212 = OpBitwiseOr %207 %211 
                                         i32 %213 = OpBitcast %212 
                                Private i32* %214 = OpAccessChain %184 %165 
                                                      OpStore %214 %213 
                                       i32_2 %215 = OpLoad %184 
                                       u32_2 %217 = OpBitcast %215 
                                       u32_2 %219 = OpBitwiseAnd %217 %218 
                                       i32_2 %220 = OpBitcast %219 
                                                      OpStore %184 %220 
                                Private i32* %221 = OpAccessChain %184 %165 
                                         i32 %222 = OpLoad %221 
                                Private i32* %223 = OpAccessChain %184 %69 
                                         i32 %224 = OpLoad %223 
                                         i32 %225 = OpIAdd %222 %224 
                                Private i32* %226 = OpAccessChain %184 %69 
                                                      OpStore %226 %225 
                                Private i32* %227 = OpAccessChain %184 %69 
                                         i32 %228 = OpLoad %227 
                                         f32 %229 = OpConvertSToF %228 
                                Private f32* %230 = OpAccessChain %63 %69 
                                                      OpStore %230 %229 
                                Private f32* %233 = OpAccessChain %9 %69 
                                         f32 %234 = OpLoad %233 
                                        bool %235 = OpFOrdGreaterThanEqual %232 %234 
                                                      OpStore %231 %235 
                                        bool %237 = OpLoad %231 
                                         f32 %238 = OpSelect %237 %19 %18 
                                                      OpStore %236 %238 
                                         f32 %239 = OpLoad %236 
                                Private f32* %240 = OpAccessChain %63 %69 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %63 %69 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %63 %69 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpFMul %245 %246 
                                Private f32* %248 = OpAccessChain %63 %69 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %9 %69 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %252 = OpAccessChain %34 %117 %251 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %250 %253 
                                Private f32* %255 = OpAccessChain %63 %69 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                Private f32* %258 = OpAccessChain %97 %251 
                                                      OpStore %258 %257 
                                       f32_2 %259 = OpLoad vs_TEXCOORD0 
                                       f32_2 %261 = OpFMul %259 %260 
                                       f32_2 %263 = OpFAdd %261 %262 
                                       f32_3 %264 = OpLoad %9 
                                       f32_3 %265 = OpVectorShuffle %264 %263 3 1 4 
                                                      OpStore %9 %265 
                                       f32_3 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 2 
                              Uniform f32_4* %268 = OpAccessChain %34 %106 %117 
                                       f32_4 %269 = OpLoad %268 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_2 %271 = OpFNegate %270 
                                       f32_2 %272 = OpFAdd %267 %271 
                                       f32_3 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %272 3 1 4 
                                                      OpStore %9 %274 
                                Uniform f32* %276 = OpAccessChain %34 %106 %106 %69 
                                         f32 %277 = OpLoad %276 
                                Private f32* %278 = OpAccessChain %275 %69 
                                                      OpStore %278 %277 
                                Uniform f32* %279 = OpAccessChain %34 %106 %100 %165 
                                         f32 %280 = OpLoad %279 
                                Private f32* %281 = OpAccessChain %275 %165 
                                                      OpStore %281 %280 
                                       f32_3 %282 = OpLoad %9 
                                       f32_2 %283 = OpVectorShuffle %282 %282 0 2 
                                       f32_2 %284 = OpLoad %275 
                                       f32_2 %285 = OpFDiv %283 %284 
                                       f32_3 %286 = OpLoad %9 
                                       f32_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %9 %287 
                                Private f32* %288 = OpAccessChain %97 %251 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %19 
                                                      OpStore %236 %291 
                                Uniform f32* %292 = OpAccessChain %34 %140 %141 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpLoad %236 
                                         f32 %295 = OpFMul %293 %294 
                                Private f32* %296 = OpAccessChain %97 %251 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFAdd %295 %297 
                                                      OpStore %236 %298 
                                         f32 %299 = OpLoad %236 
                                       f32_2 %300 = OpCompositeConstruct %299 %299 
                                       f32_3 %301 = OpLoad %9 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %97 
                                       f32_3 %305 = OpVectorShuffle %304 %303 3 4 2 
                                                      OpStore %97 %305 
                                Uniform f32* %308 = OpAccessChain %34 %307 %141 
                                         f32 %309 = OpLoad %308 
                                         i32 %310 = OpConvertFToS %309 
                                                      OpStore %306 %310 
                                       f32_2 %311 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %312 = OpAccessChain %34 %307 
                                       f32_4 %313 = OpLoad %312 
                                       f32_2 %314 = OpVectorShuffle %313 %313 2 2 
                                       f32_2 %315 = OpFMul %311 %314 
                                                      OpStore %63 %315 
                                       f32_2 %316 = OpLoad %63 
                              Uniform f32_4* %318 = OpAccessChain %34 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_2 %320 = OpVectorShuffle %319 %319 0 1 
                                       f32_2 %321 = OpFMul %316 %320 
                                                      OpStore %63 %321 
                                       f32_2 %322 = OpLoad %63 
                                       f32_2 %323 = OpExtInst %1 8 %322 
                                                      OpStore %63 %323 
                                       f32_2 %327 = OpLoad %63 
                                         f32 %328 = OpDot %326 %327 
                                Private f32* %329 = OpAccessChain %63 %69 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %63 %69 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpExtInst %1 10 %331 
                                Private f32* %333 = OpAccessChain %63 %69 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %63 %69 
                                         f32 %335 = OpLoad %334 
                                         f32 %337 = OpFMul %335 %336 
                                Private f32* %338 = OpAccessChain %63 %69 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %63 %69 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpExtInst %1 10 %340 
                                Private f32* %342 = OpAccessChain %63 %69 
                                                      OpStore %342 %341 
                                Private f32* %345 = OpAccessChain %343 %69 
                                                      OpStore %345 %344 
                                                      OpStore %236 %18 
                                                      OpStore %347 %106 
                                                      OpBranch %348 
                                             %348 = OpLabel 
                                                      OpLoopMerge %350 %351 None 
                                                      OpBranch %352 
                                             %352 = OpLabel 
                                         i32 %353 = OpLoad %347 
                                         i32 %354 = OpLoad %306 
                                        bool %355 = OpSLessThan %353 %354 
                                                      OpBranchConditional %355 %349 %350 
                                             %349 = OpLabel 
                                         i32 %357 = OpLoad %347 
                                         f32 %358 = OpConvertSToF %357 
                                                      OpStore %356 %358 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD0 %69 
                                         f32 %361 = OpLoad %360 
                                         f32 %363 = OpFMul %361 %362 
                                         f32 %364 = OpLoad %356 
                                         f32 %365 = OpFAdd %363 %364 
                                Private f32* %366 = OpAccessChain %343 %165 
                                                      OpStore %366 %365 
                                Private f32* %368 = OpAccessChain %343 %165 
                                         f32 %369 = OpLoad %368 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %367 %69 
                                                      OpStore %372 %371 
                                Private f32* %373 = OpAccessChain %367 %69 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpExtInst %1 13 %374 
                                Private f32* %376 = OpAccessChain %367 %69 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %367 %69 
                                         f32 %378 = OpLoad %377 
                                         f32 %380 = OpFMul %378 %379 
                                Private f32* %381 = OpAccessChain %367 %69 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %367 %69 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 10 %383 
                                Private f32* %385 = OpAccessChain %367 %69 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %63 %69 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %367 %69 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %387 %389 
                                Private f32* %391 = OpAccessChain %367 %69 
                                                      OpStore %391 %390 
                                Private f32* %392 = OpAccessChain %367 %69 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpExtInst %1 10 %393 
                                Private f32* %395 = OpAccessChain %367 %69 
                                                      OpStore %395 %394 
                                Private f32* %397 = OpAccessChain %367 %69 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %398 %89 
                                         f32 %400 = OpFAdd %399 %83 
                                Private f32* %401 = OpAccessChain %396 %251 
                                                      OpStore %401 %400 
                                       f32_2 %402 = OpLoad %343 
                                         f32 %404 = OpDot %402 %403 
                                Private f32* %405 = OpAccessChain %367 %69 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %367 %69 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpExtInst %1 13 %407 
                                Private f32* %409 = OpAccessChain %367 %69 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %367 %69 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFMul %411 %379 
                                Private f32* %413 = OpAccessChain %367 %69 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %367 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpExtInst %1 10 %415 
                                Private f32* %417 = OpAccessChain %367 %69 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %63 %69 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %367 %69 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFAdd %419 %421 
                                Private f32* %423 = OpAccessChain %367 %69 
                                                      OpStore %423 %422 
                                Private f32* %424 = OpAccessChain %367 %69 
                                         f32 %425 = OpLoad %424 
                                         f32 %427 = OpFMul %425 %426 
                                Private f32* %428 = OpAccessChain %367 %69 
                                                      OpStore %428 %427 
                                Private f32* %430 = OpAccessChain %367 %69 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpExtInst %1 13 %431 
                                                      OpStore %429 %432 
                                Private f32* %434 = OpAccessChain %367 %69 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 14 %435 
                                Private f32* %437 = OpAccessChain %433 %69 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %396 %251 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFNegate %439 
                                Private f32* %441 = OpAccessChain %396 %251 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFMul %440 %442 
                                         f32 %444 = OpFAdd %443 %19 
                                Private f32* %445 = OpAccessChain %367 %69 
                                                      OpStore %445 %444 
                                Private f32* %446 = OpAccessChain %367 %69 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpExtInst %1 31 %447 
                                Private f32* %449 = OpAccessChain %367 %69 
                                                      OpStore %449 %448 
                                         f32 %450 = OpLoad %429 
                                Private f32* %451 = OpAccessChain %433 %165 
                                                      OpStore %451 %450 
                                       f32_2 %452 = OpLoad %367 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpLoad %433 
                                       f32_2 %455 = OpFMul %453 %454 
                                       f32_3 %456 = OpLoad %396 
                                       f32_3 %457 = OpVectorShuffle %456 %455 3 4 2 
                                                      OpStore %396 %457 
                                         f32 %458 = OpLoad %356 
                                         f32 %459 = OpFAdd %458 %19 
                                                      OpStore %356 %459 
                                         f32 %460 = OpLoad %356 
                                Uniform f32* %461 = OpAccessChain %34 %307 %141 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFDiv %460 %462 
                                                      OpStore %356 %463 
                                         f32 %464 = OpLoad %356 
                                         f32 %465 = OpExtInst %1 31 %464 
                                                      OpStore %356 %465 
                                         f32 %466 = OpLoad %356 
                                Uniform f32* %467 = OpAccessChain %34 %307 %165 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFMul %466 %468 
                                                      OpStore %356 %469 
                                         f32 %471 = OpLoad %356 
                                       f32_3 %472 = OpCompositeConstruct %471 %471 %471 
                                       f32_3 %473 = OpLoad %396 
                                       f32_3 %474 = OpFMul %472 %473 
                                                      OpStore %470 %474 
                                       f32_4 %475 = OpLoad %45 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpFNegate %476 
                                       f32_3 %478 = OpLoad %470 
                                         f32 %479 = OpDot %477 %478 
                                                      OpStore %356 %479 
                                         f32 %481 = OpLoad %356 
                                        bool %482 = OpFOrdGreaterThanEqual %481 %18 
                                                      OpStore %480 %482 
                                        bool %483 = OpLoad %480 
                                                      OpSelectionMerge %487 None 
                                                      OpBranchConditional %483 %486 %490 
                                             %486 = OpLabel 
                                       f32_3 %488 = OpLoad %470 
                                       f32_3 %489 = OpFNegate %488 
                                                      OpStore %485 %489 
                                                      OpBranch %487 
                                             %490 = OpLabel 
                                       f32_3 %491 = OpLoad %470 
                                                      OpStore %485 %491 
                                                      OpBranch %487 
                                             %487 = OpLabel 
                                       f32_3 %492 = OpLoad %485 
                                                      OpStore %470 %492 
                                       f32_3 %493 = OpLoad %97 
                                       f32_3 %494 = OpLoad %470 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %470 %495 
                                       f32_3 %496 = OpLoad %470 
                                       f32_2 %497 = OpVectorShuffle %496 %496 1 1 
                              Uniform f32_4* %498 = OpAccessChain %34 %106 %100 
                                       f32_4 %499 = OpLoad %498 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                                       f32_2 %501 = OpFMul %497 %500 
                                                      OpStore %367 %501 
                              Uniform f32_4* %502 = OpAccessChain %34 %106 %106 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_3 %505 = OpLoad %470 
                                       f32_2 %506 = OpVectorShuffle %505 %505 0 0 
                                       f32_2 %507 = OpFMul %504 %506 
                                       f32_2 %508 = OpLoad %367 
                                       f32_2 %509 = OpFAdd %507 %508 
                                                      OpStore %367 %509 
                              Uniform f32_4* %510 = OpAccessChain %34 %106 %117 
                                       f32_4 %511 = OpLoad %510 
                                       f32_2 %512 = OpVectorShuffle %511 %511 0 1 
                                       f32_3 %513 = OpLoad %470 
                                       f32_2 %514 = OpVectorShuffle %513 %513 2 2 
                                       f32_2 %515 = OpFMul %512 %514 
                                       f32_2 %516 = OpLoad %367 
                                       f32_2 %517 = OpFAdd %515 %516 
                                                      OpStore %367 %517 
                                Private f32* %518 = OpAccessChain %470 %251 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFNegate %519 
                                         f32 %521 = OpFAdd %520 %19 
                                                      OpStore %356 %521 
                                Uniform f32* %522 = OpAccessChain %34 %140 %141 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpLoad %356 
                                         f32 %525 = OpFMul %523 %524 
                                Private f32* %526 = OpAccessChain %470 %251 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpFAdd %525 %527 
                                                      OpStore %356 %528 
                                       f32_2 %529 = OpLoad %367 
                                         f32 %530 = OpLoad %356 
                                       f32_2 %531 = OpCompositeConstruct %530 %530 
                                       f32_2 %532 = OpFDiv %529 %531 
                                                      OpStore %367 %532 
                                       f32_2 %533 = OpLoad %367 
                                       f32_2 %535 = OpFAdd %533 %534 
                                                      OpStore %367 %535 
                                       f32_2 %536 = OpLoad %367 
                                       f32_2 %539 = OpFMul %536 %538 
                                       f32_3 %540 = OpLoad %470 
                                       f32_3 %541 = OpVectorShuffle %540 %539 3 4 2 
                                                      OpStore %470 %541 
                                       f32_3 %542 = OpLoad %470 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                                       f32_2 %544 = OpCompositeConstruct %18 %18 
                                       f32_2 %545 = OpCompositeConstruct %19 %19 
                                       f32_2 %546 = OpExtInst %1 43 %543 %544 %545 
                                       f32_3 %547 = OpLoad %470 
                                       f32_3 %548 = OpVectorShuffle %547 %546 3 4 2 
                                                      OpStore %470 %548 
                                       f32_3 %549 = OpLoad %470 
                                       f32_2 %550 = OpVectorShuffle %549 %549 0 1 
                                Uniform f32* %551 = OpAccessChain %34 %36 
                                         f32 %552 = OpLoad %551 
                                       f32_2 %553 = OpCompositeConstruct %552 %552 
                                       f32_2 %554 = OpFMul %550 %553 
                                       f32_3 %555 = OpLoad %470 
                                       f32_3 %556 = OpVectorShuffle %555 %554 3 4 2 
                                                      OpStore %470 %556 
                         read_only Texture2D %557 = OpLoad %129 
                                     sampler %558 = OpLoad %131 
                  read_only Texture2DSampled %559 = OpSampledImage %557 %558 
                                       f32_3 %560 = OpLoad %470 
                                       f32_2 %561 = OpVectorShuffle %560 %560 0 1 
                                       f32_4 %562 = OpImageSampleExplicitLod %559 %561 Lod %27 
                                         f32 %563 = OpCompositeExtract %562 0 
                                                      OpStore %356 %563 
                                         f32 %564 = OpLoad %356 
                                Uniform f32* %565 = OpAccessChain %34 %148 %69 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpFMul %564 %566 
                                                      OpStore %356 %567 
                                Uniform f32* %568 = OpAccessChain %34 %140 %141 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFNegate %569 
                                         f32 %571 = OpLoad %356 
                                         f32 %572 = OpFMul %570 %571 
                                         f32 %573 = OpFAdd %572 %19 
                                Private f32* %574 = OpAccessChain %470 %69 
                                                      OpStore %574 %573 
                                         f32 %575 = OpLoad %139 
                                         f32 %576 = OpLoad %356 
                                         f32 %577 = OpFMul %575 %576 
                                Uniform f32* %578 = OpAccessChain %34 %148 %165 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFAdd %577 %579 
                                                      OpStore %356 %580 
                                Private f32* %581 = OpAccessChain %470 %69 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpLoad %356 
                                         f32 %584 = OpFDiv %582 %583 
                                                      OpStore %356 %584 
                                       f32_2 %586 = OpLoad %367 
                                       f32_4 %587 = OpVectorShuffle %586 %586 0 1 0 0 
                                      bool_4 %588 = OpFOrdLessThan %587 %178 
                                      bool_2 %589 = OpVectorShuffle %588 %588 0 1 
                                                      OpStore %585 %589 
                               Private bool* %591 = OpAccessChain %585 %165 
                                        bool %592 = OpLoad %591 
                                         u32 %593 = OpSelect %592 %165 %69 
                                         u32 %594 = OpIMul %593 %188 
                               Private bool* %595 = OpAccessChain %585 %69 
                                        bool %596 = OpLoad %595 
                                         u32 %597 = OpSelect %596 %165 %69 
                                         u32 %598 = OpIMul %597 %188 
                                         u32 %599 = OpBitwiseOr %594 %598 
                                         i32 %600 = OpBitcast %599 
                                Private i32* %601 = OpAccessChain %590 %69 
                                                      OpStore %601 %600 
                                       f32_2 %604 = OpLoad %367 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 1 0 1 
                                      bool_4 %606 = OpFOrdLessThan %603 %605 
                                      bool_2 %607 = OpVectorShuffle %606 %606 0 1 
                                                      OpStore %602 %607 
                               Private bool* %608 = OpAccessChain %602 %165 
                                        bool %609 = OpLoad %608 
                                         u32 %610 = OpSelect %609 %165 %69 
                                         u32 %611 = OpIMul %610 %188 
                               Private bool* %612 = OpAccessChain %602 %69 
                                        bool %613 = OpLoad %612 
                                         u32 %614 = OpSelect %613 %165 %69 
                                         u32 %615 = OpIMul %614 %188 
                                         u32 %616 = OpBitwiseOr %611 %615 
                                         i32 %617 = OpBitcast %616 
                                Private i32* %618 = OpAccessChain %590 %165 
                                                      OpStore %618 %617 
                                       i32_2 %619 = OpLoad %590 
                                       u32_2 %620 = OpBitcast %619 
                                       u32_2 %621 = OpBitwiseAnd %620 %218 
                                       i32_2 %622 = OpBitcast %621 
                                                      OpStore %590 %622 
                                Private i32* %623 = OpAccessChain %590 %165 
                                         i32 %624 = OpLoad %623 
                                Private i32* %625 = OpAccessChain %590 %69 
                                         i32 %626 = OpLoad %625 
                                         i32 %627 = OpIAdd %624 %626 
                                Private i32* %628 = OpAccessChain %590 %69 
                                                      OpStore %628 %627 
                                Private i32* %629 = OpAccessChain %590 %69 
                                         i32 %630 = OpLoad %629 
                                         f32 %631 = OpConvertSToF %630 
                                Private f32* %632 = OpAccessChain %470 %69 
                                                      OpStore %632 %631 
                                         f32 %633 = OpLoad %356 
                                        bool %634 = OpFOrdGreaterThanEqual %232 %633 
                               Private bool* %635 = OpAccessChain %602 %69 
                                                      OpStore %635 %634 
                               Private bool* %637 = OpAccessChain %602 %69 
                                        bool %638 = OpLoad %637 
                                         f32 %639 = OpSelect %638 %19 %18 
                                                      OpStore %636 %639 
                                         f32 %640 = OpLoad %636 
                                Private f32* %641 = OpAccessChain %470 %69 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpFAdd %640 %642 
                                Private f32* %644 = OpAccessChain %470 %69 
                                                      OpStore %644 %643 
                                Private f32* %645 = OpAccessChain %470 %69 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFMul %646 %246 
                                Private f32* %648 = OpAccessChain %470 %69 
                                                      OpStore %648 %647 
                                         f32 %649 = OpLoad %356 
                                Uniform f32* %650 = OpAccessChain %34 %117 %251 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %649 %651 
                                Private f32* %653 = OpAccessChain %470 %69 
                                         f32 %654 = OpLoad %653 
                                         f32 %655 = OpFAdd %652 %654 
                                Private f32* %656 = OpAccessChain %396 %251 
                                                      OpStore %656 %655 
                                       f32_2 %657 = OpLoad %367 
                              Uniform f32_4* %658 = OpAccessChain %34 %106 %117 
                                       f32_4 %659 = OpLoad %658 
                                       f32_2 %660 = OpVectorShuffle %659 %659 0 1 
                                       f32_2 %661 = OpFNegate %660 
                                       f32_2 %662 = OpFAdd %657 %661 
                                                      OpStore %367 %662 
                                       f32_2 %663 = OpLoad %367 
                                       f32_2 %664 = OpFAdd %663 %262 
                                                      OpStore %367 %664 
                                       f32_2 %665 = OpLoad %367 
                                       f32_2 %666 = OpLoad %275 
                                       f32_2 %667 = OpFDiv %665 %666 
                                                      OpStore %367 %667 
                                Private f32* %668 = OpAccessChain %396 %251 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFNegate %669 
                                         f32 %671 = OpFAdd %670 %19 
                                                      OpStore %356 %671 
                                Uniform f32* %672 = OpAccessChain %34 %140 %141 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpLoad %356 
                                         f32 %675 = OpFMul %673 %674 
                                Private f32* %676 = OpAccessChain %396 %251 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFAdd %675 %677 
                                                      OpStore %356 %678 
                                         f32 %679 = OpLoad %356 
                                       f32_2 %680 = OpCompositeConstruct %679 %679 
                                       f32_2 %681 = OpLoad %367 
                                       f32_2 %682 = OpFMul %680 %681 
                                       f32_3 %683 = OpLoad %396 
                                       f32_3 %684 = OpVectorShuffle %683 %682 3 4 2 
                                                      OpStore %396 %684 
                                       f32_3 %685 = OpLoad %97 
                                       f32_3 %686 = OpFNegate %685 
                                       f32_3 %687 = OpLoad %396 
                                       f32_3 %688 = OpFAdd %686 %687 
                                                      OpStore %470 %688 
                                       f32_3 %689 = OpLoad %470 
                                       f32_4 %690 = OpLoad %45 
                                       f32_3 %691 = OpVectorShuffle %690 %690 0 1 2 
                                         f32 %692 = OpDot %689 %691 
                                                      OpStore %356 %692 
                                Private f32* %693 = OpAccessChain %97 %251 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpFNegate %694 
                                         f32 %697 = OpFMul %695 %696 
                                         f32 %698 = OpLoad %356 
                                         f32 %699 = OpFAdd %697 %698 
                                                      OpStore %356 %699 
                                         f32 %700 = OpLoad %356 
                                         f32 %701 = OpExtInst %1 40 %700 %18 
                                                      OpStore %356 %701 
                                       f32_3 %702 = OpLoad %470 
                                       f32_3 %703 = OpLoad %470 
                                         f32 %704 = OpDot %702 %703 
                                Private f32* %705 = OpAccessChain %367 %69 
                                                      OpStore %705 %704 
                                Private f32* %706 = OpAccessChain %367 %69 
                                         f32 %707 = OpLoad %706 
                                         f32 %709 = OpFAdd %707 %708 
                                Private f32* %710 = OpAccessChain %367 %69 
                                                      OpStore %710 %709 
                                         f32 %711 = OpLoad %356 
                                Private f32* %712 = OpAccessChain %367 %69 
                                         f32 %713 = OpLoad %712 
                                         f32 %714 = OpFDiv %711 %713 
                                                      OpStore %356 %714 
                                         f32 %715 = OpLoad %236 
                                         f32 %716 = OpLoad %356 
                                         f32 %717 = OpFAdd %715 %716 
                                                      OpStore %236 %717 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                         i32 %718 = OpLoad %347 
                                         i32 %719 = OpIAdd %718 %100 
                                                      OpStore %347 %719 
                                                      OpBranch %348 
                                             %350 = OpLabel 
                                         f32 %720 = OpLoad %236 
                                Uniform f32* %721 = OpAccessChain %34 %307 %165 
                                         f32 %722 = OpLoad %721 
                                         f32 %723 = OpFMul %720 %722 
                                Private f32* %724 = OpAccessChain %9 %69 
                                                      OpStore %724 %723 
                                Private f32* %725 = OpAccessChain %9 %69 
                                         f32 %726 = OpLoad %725 
                                Uniform f32* %727 = OpAccessChain %34 %307 %69 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                Private f32* %730 = OpAccessChain %9 %69 
                                                      OpStore %730 %729 
                                Private f32* %731 = OpAccessChain %9 %69 
                                         f32 %732 = OpLoad %731 
                                Uniform f32* %733 = OpAccessChain %34 %307 %141 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpFDiv %732 %734 
                                Private f32* %736 = OpAccessChain %9 %69 
                                                      OpStore %736 %735 
                                Private f32* %737 = OpAccessChain %9 %69 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpExtInst %1 4 %738 
                                         f32 %741 = OpExtInst %1 40 %739 %740 
                                Private f32* %742 = OpAccessChain %9 %69 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %9 %69 
                                         f32 %744 = OpLoad %743 
                                         f32 %745 = OpExtInst %1 30 %744 
                                Private f32* %746 = OpAccessChain %9 %69 
                                                      OpStore %746 %745 
                                Private f32* %747 = OpAccessChain %9 %69 
                                         f32 %748 = OpLoad %747 
                                         f32 %750 = OpFMul %748 %749 
                                Private f32* %751 = OpAccessChain %9 %69 
                                                      OpStore %751 %750 
                                Private f32* %754 = OpAccessChain %9 %69 
                                         f32 %755 = OpLoad %754 
                                         f32 %756 = OpExtInst %1 29 %755 
                                 Output f32* %758 = OpAccessChain %753 %69 
                                                      OpStore %758 %756 
                                       f32_4 %759 = OpLoad %45 
                                       f32_3 %760 = OpVectorShuffle %759 %759 0 1 2 
                                       f32_3 %762 = OpFMul %760 %761 
                                       f32_3 %763 = OpFAdd %762 %761 
                                       f32_4 %764 = OpLoad %753 
                                       f32_4 %765 = OpVectorShuffle %764 %763 0 4 5 6 
                                                      OpStore %753 %765 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec2 u_xlat7;
float u_xlat8;
vec3 u_xlat12;
ivec2 u_xlati12;
bvec2 u_xlatb12;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
vec2 u_xlat19;
float u_xlat20;
bvec2 u_xlatb20;
float u_xlat24;
bool u_xlatb24;
int u_xlati25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb16.x = u_xlat16.x!=0.0;
    u_xlat16.x = (u_xlatb16.x) ? -1.0 : -0.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat8 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat16.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat8 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat16.x / u_xlat0.x;
    u_xlatb16.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati16.x = int((uint(u_xlatb16.y) * 0xffffffffu) | (uint(u_xlatb16.x) * 0xffffffffu));
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati16.y = int((uint(u_xlatb2.y) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu));
    u_xlati16.xy = ivec2(uvec2(u_xlati16.xy) & uvec2(1u, 1u));
    u_xlati16.x = u_xlati16.y + u_xlati16.x;
    u_xlat16.x = float(u_xlati16.x);
    u_xlatb24 = 9.99999975e-06>=u_xlat0.x;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat24 + u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 100000000.0;
    u_xlat2.z = u_xlat0.x * _ProjectionParams.z + u_xlat16.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat3.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat3.xy;
    u_xlat24 = (-u_xlat2.z) + 1.0;
    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat16.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat16.xy = u_xlat16.xy * _ScreenParams.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat16.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat16.xy);
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 52.9829178;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat4.x = 12.9898005;
    u_xlat24 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat26 = float(u_xlati_loop_1);
        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
        u_xlat19.x = u_xlat4.y * 78.2330017;
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = u_xlat19.x * 6.28318548;
        u_xlat6 = sin(u_xlat19.x);
        u_xlat7.x = cos(u_xlat19.x);
        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
        u_xlat19.x = sqrt(u_xlat19.x);
        u_xlat7.y = u_xlat6;
        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
        u_xlat26 = u_xlat26 + 1.0;
        u_xlat26 = u_xlat26 / _AOParams.w;
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = u_xlat26 * _AOParams.y;
        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
        u_xlatb26 = u_xlat26>=0.0;
        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
        u_xlat19.xy = u_xlat12.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
        u_xlat26 = (-u_xlat12.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
        u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
        u_xlat12.xy = u_xlat12.xy * vec2(_RenderViewportScaleFactor);
        u_xlat5 = textureLod(_CameraDepthTexture, u_xlat12.xy, 0.0);
        u_xlat26 = u_xlat5.x * _ZBufferParams.x;
        u_xlat12.x = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
        u_xlat26 = u_xlat8 * u_xlat26 + _ZBufferParams.y;
        u_xlat26 = u_xlat12.x / u_xlat26;
        u_xlatb12.xy = lessThan(u_xlat19.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
        u_xlatb20.xy = lessThan(vec4(2.0, 2.0, 2.0, 2.0), u_xlat19.xyxy).xy;
        u_xlati12.y = int((uint(u_xlatb20.y) * 0xffffffffu) | (uint(u_xlatb20.x) * 0xffffffffu));
        u_xlati12.xy = ivec2(uvec2(u_xlati12.xy) & uvec2(1u, 1u));
        u_xlati12.x = u_xlati12.y + u_xlati12.x;
        u_xlat12.x = float(u_xlati12.x);
        u_xlatb20.x = 9.99999975e-06>=u_xlat26;
        u_xlat20 = u_xlatb20.x ? 1.0 : float(0.0);
        u_xlat12.x = u_xlat20 + u_xlat12.x;
        u_xlat12.x = u_xlat12.x * 100000000.0;
        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
        u_xlat19.xy = u_xlat19.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
        u_xlat26 = (-u_xlat5.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
        u_xlat26 = u_xlat26 / u_xlat19.x;
        u_xlat24 = u_xlat24 + u_xlat26;
    }
    u_xlat0.x = u_xlat24 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    SV_Target0.x = exp2(u_xlat0.x);
    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 768
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %753 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %48 DescriptorSet 48 
                                                      OpDecorate %48 Binding 48 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %129 DescriptorSet 129 
                                                      OpDecorate %129 Binding 129 
                                                      OpDecorate %131 DescriptorSet 131 
                                                      OpDecorate %131 Binding 131 
                                                      OpDecorate %753 Location 753 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeArray %27 %29 
                                              %32 = OpTypeStruct %30 %31 %27 %27 %27 %27 %6 %27 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 6 
                                              %37 = OpTypePointer Uniform %6 
                                              %44 = OpTypePointer Private %27 
                               Private f32_4* %45 = OpVariable Private 
                                              %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %47 = OpTypePointer UniformConstant %46 
         UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                              %50 = OpTypeSampler 
                                              %51 = OpTypePointer UniformConstant %50 
                     UniformConstant sampler* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampledImage %46 
                                              %62 = OpTypePointer Private %10 
                               Private f32_2* %63 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Private %6 
                                              %72 = OpTypeBool 
                                              %73 = OpTypeVector %72 2 
                                              %74 = OpTypePointer Private %73 
                              Private bool_2* %75 = OpVariable Private 
                                              %79 = OpTypePointer Private %72 
                                          f32 %83 = OpConstant 3.674022E-40 
                                          f32 %84 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                        f32_3 %90 = OpConstantComposite %89 %89 %89 
                               Private f32_3* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 1 
                                             %101 = OpTypePointer Uniform %27 
                                         i32 %106 = OpConstant 0 
                                         i32 %117 = OpConstant 2 
        UniformConstant read_only Texture2D* %129 = OpVariable UniformConstant 
                    UniformConstant sampler* %131 = OpVariable UniformConstant 
                                Private f32* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 3 
                                         u32 %141 = OpConstant 3 
                                         i32 %148 = OpConstant 4 
                                         u32 %165 = OpConstant 1 
                                       f32_4 %178 = OpConstantComposite %18 %18 %18 %18 
                                             %179 = OpTypeVector %72 4 
                                             %182 = OpTypeVector %35 2 
                                             %183 = OpTypePointer Private %182 
                              Private i32_2* %184 = OpVariable Private 
                                         u32 %188 = OpConstant 4294967295 
                                             %196 = OpTypePointer Private %35 
                             Private bool_2* %198 = OpVariable Private 
                                       f32_4 %199 = OpConstantComposite %19 %19 %18 %18 
                                             %216 = OpTypeVector %28 2 
                                       u32_2 %218 = OpConstantComposite %165 %165 
                               Private bool* %231 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                Private f32* %236 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                         u32 %251 = OpConstant 2 
                                       f32_2 %260 = OpConstantComposite %89 %89 
                                       f32_2 %262 = OpConstantComposite %83 %83 
                              Private f32_2* %275 = OpVariable Private 
                                Private i32* %306 = OpVariable Private 
                                         i32 %307 = OpConstant 7 
                                         i32 %317 = OpConstant 5 
                                         f32 %324 = OpConstant 3.674022E-40 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_2 %326 = OpConstantComposite %324 %325 
                                         f32 %336 = OpConstant 3.674022E-40 
                              Private f32_2* %343 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                             %346 = OpTypePointer Function %35 
                                Private f32* %356 = OpVariable Private 
                                             %359 = OpTypePointer Input %6 
                                         f32 %362 = OpConstant 3.674022E-40 
                              Private f32_2* %367 = OpVariable Private 
                                         f32 %370 = OpConstant 3.674022E-40 
                                         f32 %379 = OpConstant 3.674022E-40 
                              Private f32_3* %396 = OpVariable Private 
                                       f32_2 %403 = OpConstantComposite %19 %370 
                                         f32 %426 = OpConstant 3.674022E-40 
                                Private f32* %429 = OpVariable Private 
                              Private f32_2* %433 = OpVariable Private 
                              Private f32_3* %470 = OpVariable Private 
                               Private bool* %480 = OpVariable Private 
                                             %484 = OpTypePointer Function %7 
                                       f32_2 %534 = OpConstantComposite %19 %19 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_2 %538 = OpConstantComposite %537 %537 
                             Private bool_2* %585 = OpVariable Private 
                              Private i32_2* %590 = OpVariable Private 
                             Private bool_2* %602 = OpVariable Private 
                                       f32_4 %603 = OpConstantComposite %89 %89 %89 %89 
                                Private f32* %636 = OpVariable Private 
                                         f32 %696 = OpConstant 3.674022E-40 
                                         f32 %708 = OpConstant 3.674022E-40 
                                         f32 %740 = OpConstant 3.674022E-40 
                                         f32 %749 = OpConstant 3.674022E-40 
                                             %752 = OpTypePointer Output %27 
                               Output f32_4* %753 = OpVariable Output 
                                             %757 = OpTypePointer Output %6 
                                       f32_3 %761 = OpConstantComposite %537 %537 %537 
                                Private i32* %767 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %347 = OpVariable Function 
                             Function f32_3* %485 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %38 = OpAccessChain %34 %36 
                                          f32 %39 = OpLoad %38 
                                        f32_2 %40 = OpCompositeConstruct %39 %39 
                                        f32_2 %41 = OpFMul %26 %40 
                                        f32_3 %42 = OpLoad %9 
                                        f32_3 %43 = OpVectorShuffle %42 %41 3 4 2 
                                                      OpStore %9 %43 
                          read_only Texture2D %49 = OpLoad %48 
                                      sampler %53 = OpLoad %52 
                   read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                        f32_3 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_4 %60 = OpLoad %45 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %45 %61 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_4 %66 = OpLoad %45 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                          f32 %68 = OpDot %65 %67 
                                 Private f32* %71 = OpAccessChain %63 %69 
                                                      OpStore %71 %68 
                                 Private f32* %76 = OpAccessChain %63 %69 
                                          f32 %77 = OpLoad %76 
                                         bool %78 = OpFOrdNotEqual %77 %18 
                                Private bool* %80 = OpAccessChain %75 %69 
                                                      OpStore %80 %78 
                                Private bool* %81 = OpAccessChain %75 %69 
                                         bool %82 = OpLoad %81 
                                          f32 %85 = OpSelect %82 %83 %84 
                                 Private f32* %86 = OpAccessChain %63 %69 
                                                      OpStore %86 %85 
                                        f32_4 %87 = OpLoad %45 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_2 %92 = OpLoad %63 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFAdd %91 %93 
                                        f32_4 %95 = OpLoad %45 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %45 %96 
                                        f32_4 %98 = OpLoad %45 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                              Uniform f32_4* %102 = OpAccessChain %34 %100 %100 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFMul %99 %104 
                                                      OpStore %97 %105 
                              Uniform f32_4* %107 = OpAccessChain %34 %100 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_4 %110 = OpLoad %45 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_3 %113 = OpLoad %97 
                                       f32_3 %114 = OpFAdd %112 %113 
                                       f32_4 %115 = OpLoad %45 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 6 
                                                      OpStore %45 %116 
                              Uniform f32_4* %118 = OpAccessChain %34 %100 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_4 %121 = OpLoad %45 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %45 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 3 
                                       f32_3 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %45 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %45 %128 
                         read_only Texture2D %130 = OpLoad %129 
                                     sampler %132 = OpLoad %131 
                  read_only Texture2DSampled %133 = OpSampledImage %130 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_4 %136 = OpImageSampleExplicitLod %133 %135 Lod %27 
                                         f32 %137 = OpCompositeExtract %136 0 
                                Private f32* %138 = OpAccessChain %9 %69 
                                                      OpStore %138 %137 
                                Uniform f32* %142 = OpAccessChain %34 %140 %141 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFNegate %143 
                                         f32 %145 = OpFAdd %144 %19 
                                                      OpStore %139 %145 
                                Private f32* %146 = OpAccessChain %9 %69 
                                         f32 %147 = OpLoad %146 
                                Uniform f32* %149 = OpAccessChain %34 %148 %69 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %147 %150 
                                Private f32* %152 = OpAccessChain %9 %69 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %34 %140 %141 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                Private f32* %156 = OpAccessChain %9 %69 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                         f32 %159 = OpFAdd %158 %19 
                                Private f32* %160 = OpAccessChain %63 %69 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %139 
                                Private f32* %162 = OpAccessChain %9 %69 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Uniform f32* %166 = OpAccessChain %34 %148 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %164 %167 
                                Private f32* %169 = OpAccessChain %9 %69 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %63 %69 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %9 %69 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFDiv %171 %173 
                                Private f32* %175 = OpAccessChain %9 %69 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad vs_TEXCOORD0 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 1 0 1 
                                      bool_4 %180 = OpFOrdLessThan %177 %178 
                                      bool_2 %181 = OpVectorShuffle %180 %180 0 1 
                                                      OpStore %75 %181 
                               Private bool* %185 = OpAccessChain %75 %165 
                                        bool %186 = OpLoad %185 
                                         u32 %187 = OpSelect %186 %165 %69 
                                         u32 %189 = OpIMul %187 %188 
                               Private bool* %190 = OpAccessChain %75 %69 
                                        bool %191 = OpLoad %190 
                                         u32 %192 = OpSelect %191 %165 %69 
                                         u32 %193 = OpIMul %192 %188 
                                         u32 %194 = OpBitwiseOr %189 %193 
                                         i32 %195 = OpBitcast %194 
                                Private i32* %197 = OpAccessChain %184 %69 
                                                      OpStore %197 %195 
                                       f32_2 %200 = OpLoad vs_TEXCOORD0 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 1 0 0 
                                      bool_4 %202 = OpFOrdLessThan %199 %201 
                                      bool_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore %198 %203 
                               Private bool* %204 = OpAccessChain %198 %165 
                                        bool %205 = OpLoad %204 
                                         u32 %206 = OpSelect %205 %165 %69 
                                         u32 %207 = OpIMul %206 %188 
                               Private bool* %208 = OpAccessChain %198 %69 
                                        bool %209 = OpLoad %208 
                                         u32 %210 = OpSelect %209 %165 %69 
                                         u32 %211 = OpIMul %210 %188 
                                         u32 %212 = OpBitwiseOr %207 %211 
                                         i32 %213 = OpBitcast %212 
                                Private i32* %214 = OpAccessChain %184 %165 
                                                      OpStore %214 %213 
                                       i32_2 %215 = OpLoad %184 
                                       u32_2 %217 = OpBitcast %215 
                                       u32_2 %219 = OpBitwiseAnd %217 %218 
                                       i32_2 %220 = OpBitcast %219 
                                                      OpStore %184 %220 
                                Private i32* %221 = OpAccessChain %184 %165 
                                         i32 %222 = OpLoad %221 
                                Private i32* %223 = OpAccessChain %184 %69 
                                         i32 %224 = OpLoad %223 
                                         i32 %225 = OpIAdd %222 %224 
                                Private i32* %226 = OpAccessChain %184 %69 
                                                      OpStore %226 %225 
                                Private i32* %227 = OpAccessChain %184 %69 
                                         i32 %228 = OpLoad %227 
                                         f32 %229 = OpConvertSToF %228 
                                Private f32* %230 = OpAccessChain %63 %69 
                                                      OpStore %230 %229 
                                Private f32* %233 = OpAccessChain %9 %69 
                                         f32 %234 = OpLoad %233 
                                        bool %235 = OpFOrdGreaterThanEqual %232 %234 
                                                      OpStore %231 %235 
                                        bool %237 = OpLoad %231 
                                         f32 %238 = OpSelect %237 %19 %18 
                                                      OpStore %236 %238 
                                         f32 %239 = OpLoad %236 
                                Private f32* %240 = OpAccessChain %63 %69 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %63 %69 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %63 %69 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpFMul %245 %246 
                                Private f32* %248 = OpAccessChain %63 %69 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %9 %69 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %252 = OpAccessChain %34 %117 %251 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %250 %253 
                                Private f32* %255 = OpAccessChain %63 %69 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                Private f32* %258 = OpAccessChain %97 %251 
                                                      OpStore %258 %257 
                                       f32_2 %259 = OpLoad vs_TEXCOORD0 
                                       f32_2 %261 = OpFMul %259 %260 
                                       f32_2 %263 = OpFAdd %261 %262 
                                       f32_3 %264 = OpLoad %9 
                                       f32_3 %265 = OpVectorShuffle %264 %263 3 1 4 
                                                      OpStore %9 %265 
                                       f32_3 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 2 
                              Uniform f32_4* %268 = OpAccessChain %34 %106 %117 
                                       f32_4 %269 = OpLoad %268 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_2 %271 = OpFNegate %270 
                                       f32_2 %272 = OpFAdd %267 %271 
                                       f32_3 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %272 3 1 4 
                                                      OpStore %9 %274 
                                Uniform f32* %276 = OpAccessChain %34 %106 %106 %69 
                                         f32 %277 = OpLoad %276 
                                Private f32* %278 = OpAccessChain %275 %69 
                                                      OpStore %278 %277 
                                Uniform f32* %279 = OpAccessChain %34 %106 %100 %165 
                                         f32 %280 = OpLoad %279 
                                Private f32* %281 = OpAccessChain %275 %165 
                                                      OpStore %281 %280 
                                       f32_3 %282 = OpLoad %9 
                                       f32_2 %283 = OpVectorShuffle %282 %282 0 2 
                                       f32_2 %284 = OpLoad %275 
                                       f32_2 %285 = OpFDiv %283 %284 
                                       f32_3 %286 = OpLoad %9 
                                       f32_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %9 %287 
                                Private f32* %288 = OpAccessChain %97 %251 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %19 
                                                      OpStore %236 %291 
                                Uniform f32* %292 = OpAccessChain %34 %140 %141 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpLoad %236 
                                         f32 %295 = OpFMul %293 %294 
                                Private f32* %296 = OpAccessChain %97 %251 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFAdd %295 %297 
                                                      OpStore %236 %298 
                                         f32 %299 = OpLoad %236 
                                       f32_2 %300 = OpCompositeConstruct %299 %299 
                                       f32_3 %301 = OpLoad %9 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %97 
                                       f32_3 %305 = OpVectorShuffle %304 %303 3 4 2 
                                                      OpStore %97 %305 
                                Uniform f32* %308 = OpAccessChain %34 %307 %141 
                                         f32 %309 = OpLoad %308 
                                         i32 %310 = OpConvertFToS %309 
                                                      OpStore %306 %310 
                                       f32_2 %311 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %312 = OpAccessChain %34 %307 
                                       f32_4 %313 = OpLoad %312 
                                       f32_2 %314 = OpVectorShuffle %313 %313 2 2 
                                       f32_2 %315 = OpFMul %311 %314 
                                                      OpStore %63 %315 
                                       f32_2 %316 = OpLoad %63 
                              Uniform f32_4* %318 = OpAccessChain %34 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_2 %320 = OpVectorShuffle %319 %319 0 1 
                                       f32_2 %321 = OpFMul %316 %320 
                                                      OpStore %63 %321 
                                       f32_2 %322 = OpLoad %63 
                                       f32_2 %323 = OpExtInst %1 8 %322 
                                                      OpStore %63 %323 
                                       f32_2 %327 = OpLoad %63 
                                         f32 %328 = OpDot %326 %327 
                                Private f32* %329 = OpAccessChain %63 %69 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %63 %69 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpExtInst %1 10 %331 
                                Private f32* %333 = OpAccessChain %63 %69 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %63 %69 
                                         f32 %335 = OpLoad %334 
                                         f32 %337 = OpFMul %335 %336 
                                Private f32* %338 = OpAccessChain %63 %69 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %63 %69 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpExtInst %1 10 %340 
                                Private f32* %342 = OpAccessChain %63 %69 
                                                      OpStore %342 %341 
                                Private f32* %345 = OpAccessChain %343 %69 
                                                      OpStore %345 %344 
                                                      OpStore %236 %18 
                                                      OpStore %347 %106 
                                                      OpBranch %348 
                                             %348 = OpLabel 
                                                      OpLoopMerge %350 %351 None 
                                                      OpBranch %352 
                                             %352 = OpLabel 
                                         i32 %353 = OpLoad %347 
                                         i32 %354 = OpLoad %306 
                                        bool %355 = OpSLessThan %353 %354 
                                                      OpBranchConditional %355 %349 %350 
                                             %349 = OpLabel 
                                         i32 %357 = OpLoad %347 
                                         f32 %358 = OpConvertSToF %357 
                                                      OpStore %356 %358 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD0 %69 
                                         f32 %361 = OpLoad %360 
                                         f32 %363 = OpFMul %361 %362 
                                         f32 %364 = OpLoad %356 
                                         f32 %365 = OpFAdd %363 %364 
                                Private f32* %366 = OpAccessChain %343 %165 
                                                      OpStore %366 %365 
                                Private f32* %368 = OpAccessChain %343 %165 
                                         f32 %369 = OpLoad %368 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %367 %69 
                                                      OpStore %372 %371 
                                Private f32* %373 = OpAccessChain %367 %69 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpExtInst %1 13 %374 
                                Private f32* %376 = OpAccessChain %367 %69 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %367 %69 
                                         f32 %378 = OpLoad %377 
                                         f32 %380 = OpFMul %378 %379 
                                Private f32* %381 = OpAccessChain %367 %69 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %367 %69 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 10 %383 
                                Private f32* %385 = OpAccessChain %367 %69 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %63 %69 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %367 %69 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %387 %389 
                                Private f32* %391 = OpAccessChain %367 %69 
                                                      OpStore %391 %390 
                                Private f32* %392 = OpAccessChain %367 %69 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpExtInst %1 10 %393 
                                Private f32* %395 = OpAccessChain %367 %69 
                                                      OpStore %395 %394 
                                Private f32* %397 = OpAccessChain %367 %69 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %398 %89 
                                         f32 %400 = OpFAdd %399 %83 
                                Private f32* %401 = OpAccessChain %396 %251 
                                                      OpStore %401 %400 
                                       f32_2 %402 = OpLoad %343 
                                         f32 %404 = OpDot %402 %403 
                                Private f32* %405 = OpAccessChain %367 %69 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %367 %69 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpExtInst %1 13 %407 
                                Private f32* %409 = OpAccessChain %367 %69 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %367 %69 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFMul %411 %379 
                                Private f32* %413 = OpAccessChain %367 %69 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %367 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpExtInst %1 10 %415 
                                Private f32* %417 = OpAccessChain %367 %69 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %63 %69 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %367 %69 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFAdd %419 %421 
                                Private f32* %423 = OpAccessChain %367 %69 
                                                      OpStore %423 %422 
                                Private f32* %424 = OpAccessChain %367 %69 
                                         f32 %425 = OpLoad %424 
                                         f32 %427 = OpFMul %425 %426 
                                Private f32* %428 = OpAccessChain %367 %69 
                                                      OpStore %428 %427 
                                Private f32* %430 = OpAccessChain %367 %69 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpExtInst %1 13 %431 
                                                      OpStore %429 %432 
                                Private f32* %434 = OpAccessChain %367 %69 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 14 %435 
                                Private f32* %437 = OpAccessChain %433 %69 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %396 %251 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFNegate %439 
                                Private f32* %441 = OpAccessChain %396 %251 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFMul %440 %442 
                                         f32 %444 = OpFAdd %443 %19 
                                Private f32* %445 = OpAccessChain %367 %69 
                                                      OpStore %445 %444 
                                Private f32* %446 = OpAccessChain %367 %69 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpExtInst %1 31 %447 
                                Private f32* %449 = OpAccessChain %367 %69 
                                                      OpStore %449 %448 
                                         f32 %450 = OpLoad %429 
                                Private f32* %451 = OpAccessChain %433 %165 
                                                      OpStore %451 %450 
                                       f32_2 %452 = OpLoad %367 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpLoad %433 
                                       f32_2 %455 = OpFMul %453 %454 
                                       f32_3 %456 = OpLoad %396 
                                       f32_3 %457 = OpVectorShuffle %456 %455 3 4 2 
                                                      OpStore %396 %457 
                                         f32 %458 = OpLoad %356 
                                         f32 %459 = OpFAdd %458 %19 
                                                      OpStore %356 %459 
                                         f32 %460 = OpLoad %356 
                                Uniform f32* %461 = OpAccessChain %34 %307 %141 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFDiv %460 %462 
                                                      OpStore %356 %463 
                                         f32 %464 = OpLoad %356 
                                         f32 %465 = OpExtInst %1 31 %464 
                                                      OpStore %356 %465 
                                         f32 %466 = OpLoad %356 
                                Uniform f32* %467 = OpAccessChain %34 %307 %165 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFMul %466 %468 
                                                      OpStore %356 %469 
                                         f32 %471 = OpLoad %356 
                                       f32_3 %472 = OpCompositeConstruct %471 %471 %471 
                                       f32_3 %473 = OpLoad %396 
                                       f32_3 %474 = OpFMul %472 %473 
                                                      OpStore %470 %474 
                                       f32_4 %475 = OpLoad %45 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpFNegate %476 
                                       f32_3 %478 = OpLoad %470 
                                         f32 %479 = OpDot %477 %478 
                                                      OpStore %356 %479 
                                         f32 %481 = OpLoad %356 
                                        bool %482 = OpFOrdGreaterThanEqual %481 %18 
                                                      OpStore %480 %482 
                                        bool %483 = OpLoad %480 
                                                      OpSelectionMerge %487 None 
                                                      OpBranchConditional %483 %486 %490 
                                             %486 = OpLabel 
                                       f32_3 %488 = OpLoad %470 
                                       f32_3 %489 = OpFNegate %488 
                                                      OpStore %485 %489 
                                                      OpBranch %487 
                                             %490 = OpLabel 
                                       f32_3 %491 = OpLoad %470 
                                                      OpStore %485 %491 
                                                      OpBranch %487 
                                             %487 = OpLabel 
                                       f32_3 %492 = OpLoad %485 
                                                      OpStore %470 %492 
                                       f32_3 %493 = OpLoad %97 
                                       f32_3 %494 = OpLoad %470 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %470 %495 
                                       f32_3 %496 = OpLoad %470 
                                       f32_2 %497 = OpVectorShuffle %496 %496 1 1 
                              Uniform f32_4* %498 = OpAccessChain %34 %106 %100 
                                       f32_4 %499 = OpLoad %498 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                                       f32_2 %501 = OpFMul %497 %500 
                                                      OpStore %367 %501 
                              Uniform f32_4* %502 = OpAccessChain %34 %106 %106 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_3 %505 = OpLoad %470 
                                       f32_2 %506 = OpVectorShuffle %505 %505 0 0 
                                       f32_2 %507 = OpFMul %504 %506 
                                       f32_2 %508 = OpLoad %367 
                                       f32_2 %509 = OpFAdd %507 %508 
                                                      OpStore %367 %509 
                              Uniform f32_4* %510 = OpAccessChain %34 %106 %117 
                                       f32_4 %511 = OpLoad %510 
                                       f32_2 %512 = OpVectorShuffle %511 %511 0 1 
                                       f32_3 %513 = OpLoad %470 
                                       f32_2 %514 = OpVectorShuffle %513 %513 2 2 
                                       f32_2 %515 = OpFMul %512 %514 
                                       f32_2 %516 = OpLoad %367 
                                       f32_2 %517 = OpFAdd %515 %516 
                                                      OpStore %367 %517 
                                Private f32* %518 = OpAccessChain %470 %251 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFNegate %519 
                                         f32 %521 = OpFAdd %520 %19 
                                                      OpStore %356 %521 
                                Uniform f32* %522 = OpAccessChain %34 %140 %141 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpLoad %356 
                                         f32 %525 = OpFMul %523 %524 
                                Private f32* %526 = OpAccessChain %470 %251 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpFAdd %525 %527 
                                                      OpStore %356 %528 
                                       f32_2 %529 = OpLoad %367 
                                         f32 %530 = OpLoad %356 
                                       f32_2 %531 = OpCompositeConstruct %530 %530 
                                       f32_2 %532 = OpFDiv %529 %531 
                                                      OpStore %367 %532 
                                       f32_2 %533 = OpLoad %367 
                                       f32_2 %535 = OpFAdd %533 %534 
                                                      OpStore %367 %535 
                                       f32_2 %536 = OpLoad %367 
                                       f32_2 %539 = OpFMul %536 %538 
                                       f32_3 %540 = OpLoad %470 
                                       f32_3 %541 = OpVectorShuffle %540 %539 3 4 2 
                                                      OpStore %470 %541 
                                       f32_3 %542 = OpLoad %470 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                                       f32_2 %544 = OpCompositeConstruct %18 %18 
                                       f32_2 %545 = OpCompositeConstruct %19 %19 
                                       f32_2 %546 = OpExtInst %1 43 %543 %544 %545 
                                       f32_3 %547 = OpLoad %470 
                                       f32_3 %548 = OpVectorShuffle %547 %546 3 4 2 
                                                      OpStore %470 %548 
                                       f32_3 %549 = OpLoad %470 
                                       f32_2 %550 = OpVectorShuffle %549 %549 0 1 
                                Uniform f32* %551 = OpAccessChain %34 %36 
                                         f32 %552 = OpLoad %551 
                                       f32_2 %553 = OpCompositeConstruct %552 %552 
                                       f32_2 %554 = OpFMul %550 %553 
                                       f32_3 %555 = OpLoad %470 
                                       f32_3 %556 = OpVectorShuffle %555 %554 3 4 2 
                                                      OpStore %470 %556 
                         read_only Texture2D %557 = OpLoad %129 
                                     sampler %558 = OpLoad %131 
                  read_only Texture2DSampled %559 = OpSampledImage %557 %558 
                                       f32_3 %560 = OpLoad %470 
                                       f32_2 %561 = OpVectorShuffle %560 %560 0 1 
                                       f32_4 %562 = OpImageSampleExplicitLod %559 %561 Lod %27 
                                         f32 %563 = OpCompositeExtract %562 0 
                                                      OpStore %356 %563 
                                         f32 %564 = OpLoad %356 
                                Uniform f32* %565 = OpAccessChain %34 %148 %69 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpFMul %564 %566 
                                                      OpStore %356 %567 
                                Uniform f32* %568 = OpAccessChain %34 %140 %141 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFNegate %569 
                                         f32 %571 = OpLoad %356 
                                         f32 %572 = OpFMul %570 %571 
                                         f32 %573 = OpFAdd %572 %19 
                                Private f32* %574 = OpAccessChain %470 %69 
                                                      OpStore %574 %573 
                                         f32 %575 = OpLoad %139 
                                         f32 %576 = OpLoad %356 
                                         f32 %577 = OpFMul %575 %576 
                                Uniform f32* %578 = OpAccessChain %34 %148 %165 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFAdd %577 %579 
                                                      OpStore %356 %580 
                                Private f32* %581 = OpAccessChain %470 %69 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpLoad %356 
                                         f32 %584 = OpFDiv %582 %583 
                                                      OpStore %356 %584 
                                       f32_2 %586 = OpLoad %367 
                                       f32_4 %587 = OpVectorShuffle %586 %586 0 1 0 0 
                                      bool_4 %588 = OpFOrdLessThan %587 %178 
                                      bool_2 %589 = OpVectorShuffle %588 %588 0 1 
                                                      OpStore %585 %589 
                               Private bool* %591 = OpAccessChain %585 %165 
                                        bool %592 = OpLoad %591 
                                         u32 %593 = OpSelect %592 %165 %69 
                                         u32 %594 = OpIMul %593 %188 
                               Private bool* %595 = OpAccessChain %585 %69 
                                        bool %596 = OpLoad %595 
                                         u32 %597 = OpSelect %596 %165 %69 
                                         u32 %598 = OpIMul %597 %188 
                                         u32 %599 = OpBitwiseOr %594 %598 
                                         i32 %600 = OpBitcast %599 
                                Private i32* %601 = OpAccessChain %590 %69 
                                                      OpStore %601 %600 
                                       f32_2 %604 = OpLoad %367 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 1 0 1 
                                      bool_4 %606 = OpFOrdLessThan %603 %605 
                                      bool_2 %607 = OpVectorShuffle %606 %606 0 1 
                                                      OpStore %602 %607 
                               Private bool* %608 = OpAccessChain %602 %165 
                                        bool %609 = OpLoad %608 
                                         u32 %610 = OpSelect %609 %165 %69 
                                         u32 %611 = OpIMul %610 %188 
                               Private bool* %612 = OpAccessChain %602 %69 
                                        bool %613 = OpLoad %612 
                                         u32 %614 = OpSelect %613 %165 %69 
                                         u32 %615 = OpIMul %614 %188 
                                         u32 %616 = OpBitwiseOr %611 %615 
                                         i32 %617 = OpBitcast %616 
                                Private i32* %618 = OpAccessChain %590 %165 
                                                      OpStore %618 %617 
                                       i32_2 %619 = OpLoad %590 
                                       u32_2 %620 = OpBitcast %619 
                                       u32_2 %621 = OpBitwiseAnd %620 %218 
                                       i32_2 %622 = OpBitcast %621 
                                                      OpStore %590 %622 
                                Private i32* %623 = OpAccessChain %590 %165 
                                         i32 %624 = OpLoad %623 
                                Private i32* %625 = OpAccessChain %590 %69 
                                         i32 %626 = OpLoad %625 
                                         i32 %627 = OpIAdd %624 %626 
                                Private i32* %628 = OpAccessChain %590 %69 
                                                      OpStore %628 %627 
                                Private i32* %629 = OpAccessChain %590 %69 
                                         i32 %630 = OpLoad %629 
                                         f32 %631 = OpConvertSToF %630 
                                Private f32* %632 = OpAccessChain %470 %69 
                                                      OpStore %632 %631 
                                         f32 %633 = OpLoad %356 
                                        bool %634 = OpFOrdGreaterThanEqual %232 %633 
                               Private bool* %635 = OpAccessChain %602 %69 
                                                      OpStore %635 %634 
                               Private bool* %637 = OpAccessChain %602 %69 
                                        bool %638 = OpLoad %637 
                                         f32 %639 = OpSelect %638 %19 %18 
                                                      OpStore %636 %639 
                                         f32 %640 = OpLoad %636 
                                Private f32* %641 = OpAccessChain %470 %69 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpFAdd %640 %642 
                                Private f32* %644 = OpAccessChain %470 %69 
                                                      OpStore %644 %643 
                                Private f32* %645 = OpAccessChain %470 %69 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFMul %646 %246 
                                Private f32* %648 = OpAccessChain %470 %69 
                                                      OpStore %648 %647 
                                         f32 %649 = OpLoad %356 
                                Uniform f32* %650 = OpAccessChain %34 %117 %251 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %649 %651 
                                Private f32* %653 = OpAccessChain %470 %69 
                                         f32 %654 = OpLoad %653 
                                         f32 %655 = OpFAdd %652 %654 
                                Private f32* %656 = OpAccessChain %396 %251 
                                                      OpStore %656 %655 
                                       f32_2 %657 = OpLoad %367 
                              Uniform f32_4* %658 = OpAccessChain %34 %106 %117 
                                       f32_4 %659 = OpLoad %658 
                                       f32_2 %660 = OpVectorShuffle %659 %659 0 1 
                                       f32_2 %661 = OpFNegate %660 
                                       f32_2 %662 = OpFAdd %657 %661 
                                                      OpStore %367 %662 
                                       f32_2 %663 = OpLoad %367 
                                       f32_2 %664 = OpFAdd %663 %262 
                                                      OpStore %367 %664 
                                       f32_2 %665 = OpLoad %367 
                                       f32_2 %666 = OpLoad %275 
                                       f32_2 %667 = OpFDiv %665 %666 
                                                      OpStore %367 %667 
                                Private f32* %668 = OpAccessChain %396 %251 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFNegate %669 
                                         f32 %671 = OpFAdd %670 %19 
                                                      OpStore %356 %671 
                                Uniform f32* %672 = OpAccessChain %34 %140 %141 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpLoad %356 
                                         f32 %675 = OpFMul %673 %674 
                                Private f32* %676 = OpAccessChain %396 %251 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFAdd %675 %677 
                                                      OpStore %356 %678 
                                         f32 %679 = OpLoad %356 
                                       f32_2 %680 = OpCompositeConstruct %679 %679 
                                       f32_2 %681 = OpLoad %367 
                                       f32_2 %682 = OpFMul %680 %681 
                                       f32_3 %683 = OpLoad %396 
                                       f32_3 %684 = OpVectorShuffle %683 %682 3 4 2 
                                                      OpStore %396 %684 
                                       f32_3 %685 = OpLoad %97 
                                       f32_3 %686 = OpFNegate %685 
                                       f32_3 %687 = OpLoad %396 
                                       f32_3 %688 = OpFAdd %686 %687 
                                                      OpStore %470 %688 
                                       f32_3 %689 = OpLoad %470 
                                       f32_4 %690 = OpLoad %45 
                                       f32_3 %691 = OpVectorShuffle %690 %690 0 1 2 
                                         f32 %692 = OpDot %689 %691 
                                                      OpStore %356 %692 
                                Private f32* %693 = OpAccessChain %97 %251 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpFNegate %694 
                                         f32 %697 = OpFMul %695 %696 
                                         f32 %698 = OpLoad %356 
                                         f32 %699 = OpFAdd %697 %698 
                                                      OpStore %356 %699 
                                         f32 %700 = OpLoad %356 
                                         f32 %701 = OpExtInst %1 40 %700 %18 
                                                      OpStore %356 %701 
                                       f32_3 %702 = OpLoad %470 
                                       f32_3 %703 = OpLoad %470 
                                         f32 %704 = OpDot %702 %703 
                                Private f32* %705 = OpAccessChain %367 %69 
                                                      OpStore %705 %704 
                                Private f32* %706 = OpAccessChain %367 %69 
                                         f32 %707 = OpLoad %706 
                                         f32 %709 = OpFAdd %707 %708 
                                Private f32* %710 = OpAccessChain %367 %69 
                                                      OpStore %710 %709 
                                         f32 %711 = OpLoad %356 
                                Private f32* %712 = OpAccessChain %367 %69 
                                         f32 %713 = OpLoad %712 
                                         f32 %714 = OpFDiv %711 %713 
                                                      OpStore %356 %714 
                                         f32 %715 = OpLoad %236 
                                         f32 %716 = OpLoad %356 
                                         f32 %717 = OpFAdd %715 %716 
                                                      OpStore %236 %717 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                         i32 %718 = OpLoad %347 
                                         i32 %719 = OpIAdd %718 %100 
                                                      OpStore %347 %719 
                                                      OpBranch %348 
                                             %350 = OpLabel 
                                         f32 %720 = OpLoad %236 
                                Uniform f32* %721 = OpAccessChain %34 %307 %165 
                                         f32 %722 = OpLoad %721 
                                         f32 %723 = OpFMul %720 %722 
                                Private f32* %724 = OpAccessChain %9 %69 
                                                      OpStore %724 %723 
                                Private f32* %725 = OpAccessChain %9 %69 
                                         f32 %726 = OpLoad %725 
                                Uniform f32* %727 = OpAccessChain %34 %307 %69 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                Private f32* %730 = OpAccessChain %9 %69 
                                                      OpStore %730 %729 
                                Private f32* %731 = OpAccessChain %9 %69 
                                         f32 %732 = OpLoad %731 
                                Uniform f32* %733 = OpAccessChain %34 %307 %141 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpFDiv %732 %734 
                                Private f32* %736 = OpAccessChain %9 %69 
                                                      OpStore %736 %735 
                                Private f32* %737 = OpAccessChain %9 %69 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpExtInst %1 4 %738 
                                         f32 %741 = OpExtInst %1 40 %739 %740 
                                Private f32* %742 = OpAccessChain %9 %69 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %9 %69 
                                         f32 %744 = OpLoad %743 
                                         f32 %745 = OpExtInst %1 30 %744 
                                Private f32* %746 = OpAccessChain %9 %69 
                                                      OpStore %746 %745 
                                Private f32* %747 = OpAccessChain %9 %69 
                                         f32 %748 = OpLoad %747 
                                         f32 %750 = OpFMul %748 %749 
                                Private f32* %751 = OpAccessChain %9 %69 
                                                      OpStore %751 %750 
                                Private f32* %754 = OpAccessChain %9 %69 
                                         f32 %755 = OpLoad %754 
                                         f32 %756 = OpExtInst %1 29 %755 
                                 Output f32* %758 = OpAccessChain %753 %69 
                                                      OpStore %758 %756 
                                       f32_4 %759 = OpLoad %45 
                                       f32_3 %760 = OpVectorShuffle %759 %759 0 1 2 
                                       f32_3 %762 = OpFMul %760 %761 
                                       f32_3 %763 = OpFAdd %762 %761 
                                       f32_4 %764 = OpLoad %753 
                                       f32_4 %765 = OpVectorShuffle %764 %763 0 4 5 6 
                                                      OpStore %753 %765 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec3 _FogParams;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec2 u_xlat7;
float u_xlat8;
vec3 u_xlat12;
ivec2 u_xlati12;
bvec2 u_xlatb12;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
vec2 u_xlat19;
float u_xlat20;
bvec2 u_xlatb20;
float u_xlat24;
bool u_xlatb24;
int u_xlati25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb16.x = u_xlat16.x!=0.0;
    u_xlat16.x = (u_xlatb16.x) ? -1.0 : -0.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat8 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat16.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat8 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat16.x / u_xlat0.x;
    u_xlatb16.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati16.x = int((uint(u_xlatb16.y) * 0xffffffffu) | (uint(u_xlatb16.x) * 0xffffffffu));
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati16.y = int((uint(u_xlatb2.y) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu));
    u_xlati16.xy = ivec2(uvec2(u_xlati16.xy) & uvec2(1u, 1u));
    u_xlati16.x = u_xlati16.y + u_xlati16.x;
    u_xlat16.x = float(u_xlati16.x);
    u_xlatb24 = 9.99999975e-06>=u_xlat0.x;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat24 + u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 100000000.0;
    u_xlat2.z = u_xlat0.x * _ProjectionParams.z + u_xlat16.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat3.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat3.xy;
    u_xlat24 = (-u_xlat2.z) + 1.0;
    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat16.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat16.xy = u_xlat16.xy * _ScreenParams.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat16.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat16.xy);
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 52.9829178;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat4.x = 12.9898005;
    u_xlat24 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat26 = float(u_xlati_loop_1);
        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
        u_xlat19.x = u_xlat4.y * 78.2330017;
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = u_xlat19.x * 6.28318548;
        u_xlat6 = sin(u_xlat19.x);
        u_xlat7.x = cos(u_xlat19.x);
        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
        u_xlat19.x = sqrt(u_xlat19.x);
        u_xlat7.y = u_xlat6;
        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
        u_xlat26 = u_xlat26 + 1.0;
        u_xlat26 = u_xlat26 / _AOParams.w;
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = u_xlat26 * _AOParams.y;
        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
        u_xlatb26 = u_xlat26>=0.0;
        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
        u_xlat19.xy = u_xlat12.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
        u_xlat26 = (-u_xlat12.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
        u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
        u_xlat12.xy = u_xlat12.xy * vec2(_RenderViewportScaleFactor);
        u_xlat5 = textureLod(_CameraDepthTexture, u_xlat12.xy, 0.0);
        u_xlat26 = u_xlat5.x * _ZBufferParams.x;
        u_xlat12.x = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
        u_xlat26 = u_xlat8 * u_xlat26 + _ZBufferParams.y;
        u_xlat26 = u_xlat12.x / u_xlat26;
        u_xlatb12.xy = lessThan(u_xlat19.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
        u_xlatb20.xy = lessThan(vec4(2.0, 2.0, 2.0, 2.0), u_xlat19.xyxy).xy;
        u_xlati12.y = int((uint(u_xlatb20.y) * 0xffffffffu) | (uint(u_xlatb20.x) * 0xffffffffu));
        u_xlati12.xy = ivec2(uvec2(u_xlati12.xy) & uvec2(1u, 1u));
        u_xlati12.x = u_xlati12.y + u_xlati12.x;
        u_xlat12.x = float(u_xlati12.x);
        u_xlatb20.x = 9.99999975e-06>=u_xlat26;
        u_xlat20 = u_xlatb20.x ? 1.0 : float(0.0);
        u_xlat12.x = u_xlat20 + u_xlat12.x;
        u_xlat12.x = u_xlat12.x * 100000000.0;
        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
        u_xlat19.xy = u_xlat19.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
        u_xlat26 = (-u_xlat5.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
        u_xlat26 = u_xlat26 / u_xlat19.x;
        u_xlat24 = u_xlat24 + u_xlat26;
    }
    u_xlat0.x = u_xlat24 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat16.x = u_xlat2.x * _ZBufferParams.x;
    u_xlat24 = (-unity_OrthoParams.w) * u_xlat16.x + 1.0;
    u_xlat8 = u_xlat8 * u_xlat16.x + _ZBufferParams.y;
    u_xlat8 = u_xlat24 / u_xlat8;
    u_xlat8 = u_xlat8 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat8 = u_xlat8 * _FogParams.x;
    u_xlat8 = u_xlat8 * (-u_xlat8);
    u_xlat8 = exp2(u_xlat8);
    SV_Target0.x = u_xlat8 * u_xlat0.x;
    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 823
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %759 %807 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpMemberDecorate %32 8 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %48 DescriptorSet 48 
                                                      OpDecorate %48 Binding 48 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %129 DescriptorSet 129 
                                                      OpDecorate %129 Binding 129 
                                                      OpDecorate %131 DescriptorSet 131 
                                                      OpDecorate %131 Binding 131 
                                                      OpDecorate vs_TEXCOORD1 Location 759 
                                                      OpDecorate %807 Location 807 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeArray %27 %29 
                                              %32 = OpTypeStruct %30 %31 %27 %27 %27 %27 %6 %7 %27 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_3; f32_4;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 6 
                                              %37 = OpTypePointer Uniform %6 
                                              %44 = OpTypePointer Private %27 
                               Private f32_4* %45 = OpVariable Private 
                                              %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %47 = OpTypePointer UniformConstant %46 
         UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                              %50 = OpTypeSampler 
                                              %51 = OpTypePointer UniformConstant %50 
                     UniformConstant sampler* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampledImage %46 
                                              %62 = OpTypePointer Private %10 
                               Private f32_2* %63 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Private %6 
                                              %72 = OpTypeBool 
                                              %73 = OpTypeVector %72 2 
                                              %74 = OpTypePointer Private %73 
                              Private bool_2* %75 = OpVariable Private 
                                              %79 = OpTypePointer Private %72 
                                          f32 %83 = OpConstant 3.674022E-40 
                                          f32 %84 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                        f32_3 %90 = OpConstantComposite %89 %89 %89 
                               Private f32_3* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 1 
                                             %101 = OpTypePointer Uniform %27 
                                         i32 %106 = OpConstant 0 
                                         i32 %117 = OpConstant 2 
        UniformConstant read_only Texture2D* %129 = OpVariable UniformConstant 
                    UniformConstant sampler* %131 = OpVariable UniformConstant 
                                Private f32* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 3 
                                         u32 %141 = OpConstant 3 
                                         i32 %148 = OpConstant 4 
                                         u32 %165 = OpConstant 1 
                                       f32_4 %178 = OpConstantComposite %18 %18 %18 %18 
                                             %179 = OpTypeVector %72 4 
                                             %182 = OpTypeVector %35 2 
                                             %183 = OpTypePointer Private %182 
                              Private i32_2* %184 = OpVariable Private 
                                         u32 %188 = OpConstant 4294967295 
                                             %196 = OpTypePointer Private %35 
                             Private bool_2* %198 = OpVariable Private 
                                       f32_4 %199 = OpConstantComposite %19 %19 %18 %18 
                                             %216 = OpTypeVector %28 2 
                                       u32_2 %218 = OpConstantComposite %165 %165 
                               Private bool* %231 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                Private f32* %236 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                         u32 %251 = OpConstant 2 
                                       f32_2 %260 = OpConstantComposite %89 %89 
                                       f32_2 %262 = OpConstantComposite %83 %83 
                              Private f32_2* %275 = OpVariable Private 
                                Private i32* %306 = OpVariable Private 
                                         i32 %307 = OpConstant 8 
                                         i32 %317 = OpConstant 5 
                                         f32 %324 = OpConstant 3.674022E-40 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_2 %326 = OpConstantComposite %324 %325 
                                         f32 %336 = OpConstant 3.674022E-40 
                              Private f32_2* %343 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                             %346 = OpTypePointer Function %35 
                                Private f32* %356 = OpVariable Private 
                                             %359 = OpTypePointer Input %6 
                                         f32 %362 = OpConstant 3.674022E-40 
                              Private f32_2* %367 = OpVariable Private 
                                         f32 %370 = OpConstant 3.674022E-40 
                                         f32 %379 = OpConstant 3.674022E-40 
                              Private f32_3* %396 = OpVariable Private 
                                       f32_2 %403 = OpConstantComposite %19 %370 
                                         f32 %426 = OpConstant 3.674022E-40 
                                Private f32* %429 = OpVariable Private 
                              Private f32_2* %433 = OpVariable Private 
                              Private f32_3* %470 = OpVariable Private 
                               Private bool* %480 = OpVariable Private 
                                             %484 = OpTypePointer Function %7 
                                       f32_2 %534 = OpConstantComposite %19 %19 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_2 %538 = OpConstantComposite %537 %537 
                             Private bool_2* %585 = OpVariable Private 
                              Private i32_2* %590 = OpVariable Private 
                             Private bool_2* %602 = OpVariable Private 
                                       f32_4 %603 = OpConstantComposite %89 %89 %89 %89 
                                Private f32* %636 = OpVariable Private 
                                         f32 %696 = OpConstant 3.674022E-40 
                                         f32 %708 = OpConstant 3.674022E-40 
                                         f32 %740 = OpConstant 3.674022E-40 
                                         f32 %749 = OpConstant 3.674022E-40 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         i32 %796 = OpConstant 7 
                                             %806 = OpTypePointer Output %27 
                               Output f32_4* %807 = OpVariable Output 
                                             %812 = OpTypePointer Output %6 
                                       f32_3 %816 = OpConstantComposite %537 %537 %537 
                                Private i32* %822 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %347 = OpVariable Function 
                             Function f32_3* %485 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %38 = OpAccessChain %34 %36 
                                          f32 %39 = OpLoad %38 
                                        f32_2 %40 = OpCompositeConstruct %39 %39 
                                        f32_2 %41 = OpFMul %26 %40 
                                        f32_3 %42 = OpLoad %9 
                                        f32_3 %43 = OpVectorShuffle %42 %41 3 4 2 
                                                      OpStore %9 %43 
                          read_only Texture2D %49 = OpLoad %48 
                                      sampler %53 = OpLoad %52 
                   read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                        f32_3 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_4 %60 = OpLoad %45 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %45 %61 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_4 %66 = OpLoad %45 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                          f32 %68 = OpDot %65 %67 
                                 Private f32* %71 = OpAccessChain %63 %69 
                                                      OpStore %71 %68 
                                 Private f32* %76 = OpAccessChain %63 %69 
                                          f32 %77 = OpLoad %76 
                                         bool %78 = OpFOrdNotEqual %77 %18 
                                Private bool* %80 = OpAccessChain %75 %69 
                                                      OpStore %80 %78 
                                Private bool* %81 = OpAccessChain %75 %69 
                                         bool %82 = OpLoad %81 
                                          f32 %85 = OpSelect %82 %83 %84 
                                 Private f32* %86 = OpAccessChain %63 %69 
                                                      OpStore %86 %85 
                                        f32_4 %87 = OpLoad %45 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_2 %92 = OpLoad %63 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFAdd %91 %93 
                                        f32_4 %95 = OpLoad %45 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %45 %96 
                                        f32_4 %98 = OpLoad %45 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                              Uniform f32_4* %102 = OpAccessChain %34 %100 %100 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFMul %99 %104 
                                                      OpStore %97 %105 
                              Uniform f32_4* %107 = OpAccessChain %34 %100 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_4 %110 = OpLoad %45 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_3 %113 = OpLoad %97 
                                       f32_3 %114 = OpFAdd %112 %113 
                                       f32_4 %115 = OpLoad %45 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 6 
                                                      OpStore %45 %116 
                              Uniform f32_4* %118 = OpAccessChain %34 %100 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_4 %121 = OpLoad %45 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %45 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 3 
                                       f32_3 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %45 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %45 %128 
                         read_only Texture2D %130 = OpLoad %129 
                                     sampler %132 = OpLoad %131 
                  read_only Texture2DSampled %133 = OpSampledImage %130 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_4 %136 = OpImageSampleExplicitLod %133 %135 Lod %27 
                                         f32 %137 = OpCompositeExtract %136 0 
                                Private f32* %138 = OpAccessChain %9 %69 
                                                      OpStore %138 %137 
                                Uniform f32* %142 = OpAccessChain %34 %140 %141 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFNegate %143 
                                         f32 %145 = OpFAdd %144 %19 
                                                      OpStore %139 %145 
                                Private f32* %146 = OpAccessChain %9 %69 
                                         f32 %147 = OpLoad %146 
                                Uniform f32* %149 = OpAccessChain %34 %148 %69 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %147 %150 
                                Private f32* %152 = OpAccessChain %9 %69 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %34 %140 %141 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                Private f32* %156 = OpAccessChain %9 %69 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                         f32 %159 = OpFAdd %158 %19 
                                Private f32* %160 = OpAccessChain %63 %69 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %139 
                                Private f32* %162 = OpAccessChain %9 %69 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Uniform f32* %166 = OpAccessChain %34 %148 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %164 %167 
                                Private f32* %169 = OpAccessChain %9 %69 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %63 %69 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %9 %69 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFDiv %171 %173 
                                Private f32* %175 = OpAccessChain %9 %69 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad vs_TEXCOORD0 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 1 0 1 
                                      bool_4 %180 = OpFOrdLessThan %177 %178 
                                      bool_2 %181 = OpVectorShuffle %180 %180 0 1 
                                                      OpStore %75 %181 
                               Private bool* %185 = OpAccessChain %75 %165 
                                        bool %186 = OpLoad %185 
                                         u32 %187 = OpSelect %186 %165 %69 
                                         u32 %189 = OpIMul %187 %188 
                               Private bool* %190 = OpAccessChain %75 %69 
                                        bool %191 = OpLoad %190 
                                         u32 %192 = OpSelect %191 %165 %69 
                                         u32 %193 = OpIMul %192 %188 
                                         u32 %194 = OpBitwiseOr %189 %193 
                                         i32 %195 = OpBitcast %194 
                                Private i32* %197 = OpAccessChain %184 %69 
                                                      OpStore %197 %195 
                                       f32_2 %200 = OpLoad vs_TEXCOORD0 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 1 0 0 
                                      bool_4 %202 = OpFOrdLessThan %199 %201 
                                      bool_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore %198 %203 
                               Private bool* %204 = OpAccessChain %198 %165 
                                        bool %205 = OpLoad %204 
                                         u32 %206 = OpSelect %205 %165 %69 
                                         u32 %207 = OpIMul %206 %188 
                               Private bool* %208 = OpAccessChain %198 %69 
                                        bool %209 = OpLoad %208 
                                         u32 %210 = OpSelect %209 %165 %69 
                                         u32 %211 = OpIMul %210 %188 
                                         u32 %212 = OpBitwiseOr %207 %211 
                                         i32 %213 = OpBitcast %212 
                                Private i32* %214 = OpAccessChain %184 %165 
                                                      OpStore %214 %213 
                                       i32_2 %215 = OpLoad %184 
                                       u32_2 %217 = OpBitcast %215 
                                       u32_2 %219 = OpBitwiseAnd %217 %218 
                                       i32_2 %220 = OpBitcast %219 
                                                      OpStore %184 %220 
                                Private i32* %221 = OpAccessChain %184 %165 
                                         i32 %222 = OpLoad %221 
                                Private i32* %223 = OpAccessChain %184 %69 
                                         i32 %224 = OpLoad %223 
                                         i32 %225 = OpIAdd %222 %224 
                                Private i32* %226 = OpAccessChain %184 %69 
                                                      OpStore %226 %225 
                                Private i32* %227 = OpAccessChain %184 %69 
                                         i32 %228 = OpLoad %227 
                                         f32 %229 = OpConvertSToF %228 
                                Private f32* %230 = OpAccessChain %63 %69 
                                                      OpStore %230 %229 
                                Private f32* %233 = OpAccessChain %9 %69 
                                         f32 %234 = OpLoad %233 
                                        bool %235 = OpFOrdGreaterThanEqual %232 %234 
                                                      OpStore %231 %235 
                                        bool %237 = OpLoad %231 
                                         f32 %238 = OpSelect %237 %19 %18 
                                                      OpStore %236 %238 
                                         f32 %239 = OpLoad %236 
                                Private f32* %240 = OpAccessChain %63 %69 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %63 %69 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %63 %69 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpFMul %245 %246 
                                Private f32* %248 = OpAccessChain %63 %69 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %9 %69 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %252 = OpAccessChain %34 %117 %251 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %250 %253 
                                Private f32* %255 = OpAccessChain %63 %69 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                Private f32* %258 = OpAccessChain %97 %251 
                                                      OpStore %258 %257 
                                       f32_2 %259 = OpLoad vs_TEXCOORD0 
                                       f32_2 %261 = OpFMul %259 %260 
                                       f32_2 %263 = OpFAdd %261 %262 
                                       f32_3 %264 = OpLoad %9 
                                       f32_3 %265 = OpVectorShuffle %264 %263 3 1 4 
                                                      OpStore %9 %265 
                                       f32_3 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 2 
                              Uniform f32_4* %268 = OpAccessChain %34 %106 %117 
                                       f32_4 %269 = OpLoad %268 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_2 %271 = OpFNegate %270 
                                       f32_2 %272 = OpFAdd %267 %271 
                                       f32_3 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %272 3 1 4 
                                                      OpStore %9 %274 
                                Uniform f32* %276 = OpAccessChain %34 %106 %106 %69 
                                         f32 %277 = OpLoad %276 
                                Private f32* %278 = OpAccessChain %275 %69 
                                                      OpStore %278 %277 
                                Uniform f32* %279 = OpAccessChain %34 %106 %100 %165 
                                         f32 %280 = OpLoad %279 
                                Private f32* %281 = OpAccessChain %275 %165 
                                                      OpStore %281 %280 
                                       f32_3 %282 = OpLoad %9 
                                       f32_2 %283 = OpVectorShuffle %282 %282 0 2 
                                       f32_2 %284 = OpLoad %275 
                                       f32_2 %285 = OpFDiv %283 %284 
                                       f32_3 %286 = OpLoad %9 
                                       f32_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %9 %287 
                                Private f32* %288 = OpAccessChain %97 %251 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %19 
                                                      OpStore %236 %291 
                                Uniform f32* %292 = OpAccessChain %34 %140 %141 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpLoad %236 
                                         f32 %295 = OpFMul %293 %294 
                                Private f32* %296 = OpAccessChain %97 %251 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFAdd %295 %297 
                                                      OpStore %236 %298 
                                         f32 %299 = OpLoad %236 
                                       f32_2 %300 = OpCompositeConstruct %299 %299 
                                       f32_3 %301 = OpLoad %9 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %97 
                                       f32_3 %305 = OpVectorShuffle %304 %303 3 4 2 
                                                      OpStore %97 %305 
                                Uniform f32* %308 = OpAccessChain %34 %307 %141 
                                         f32 %309 = OpLoad %308 
                                         i32 %310 = OpConvertFToS %309 
                                                      OpStore %306 %310 
                                       f32_2 %311 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %312 = OpAccessChain %34 %307 
                                       f32_4 %313 = OpLoad %312 
                                       f32_2 %314 = OpVectorShuffle %313 %313 2 2 
                                       f32_2 %315 = OpFMul %311 %314 
                                                      OpStore %63 %315 
                                       f32_2 %316 = OpLoad %63 
                              Uniform f32_4* %318 = OpAccessChain %34 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_2 %320 = OpVectorShuffle %319 %319 0 1 
                                       f32_2 %321 = OpFMul %316 %320 
                                                      OpStore %63 %321 
                                       f32_2 %322 = OpLoad %63 
                                       f32_2 %323 = OpExtInst %1 8 %322 
                                                      OpStore %63 %323 
                                       f32_2 %327 = OpLoad %63 
                                         f32 %328 = OpDot %326 %327 
                                Private f32* %329 = OpAccessChain %63 %69 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %63 %69 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpExtInst %1 10 %331 
                                Private f32* %333 = OpAccessChain %63 %69 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %63 %69 
                                         f32 %335 = OpLoad %334 
                                         f32 %337 = OpFMul %335 %336 
                                Private f32* %338 = OpAccessChain %63 %69 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %63 %69 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpExtInst %1 10 %340 
                                Private f32* %342 = OpAccessChain %63 %69 
                                                      OpStore %342 %341 
                                Private f32* %345 = OpAccessChain %343 %69 
                                                      OpStore %345 %344 
                                                      OpStore %236 %18 
                                                      OpStore %347 %106 
                                                      OpBranch %348 
                                             %348 = OpLabel 
                                                      OpLoopMerge %350 %351 None 
                                                      OpBranch %352 
                                             %352 = OpLabel 
                                         i32 %353 = OpLoad %347 
                                         i32 %354 = OpLoad %306 
                                        bool %355 = OpSLessThan %353 %354 
                                                      OpBranchConditional %355 %349 %350 
                                             %349 = OpLabel 
                                         i32 %357 = OpLoad %347 
                                         f32 %358 = OpConvertSToF %357 
                                                      OpStore %356 %358 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD0 %69 
                                         f32 %361 = OpLoad %360 
                                         f32 %363 = OpFMul %361 %362 
                                         f32 %364 = OpLoad %356 
                                         f32 %365 = OpFAdd %363 %364 
                                Private f32* %366 = OpAccessChain %343 %165 
                                                      OpStore %366 %365 
                                Private f32* %368 = OpAccessChain %343 %165 
                                         f32 %369 = OpLoad %368 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %367 %69 
                                                      OpStore %372 %371 
                                Private f32* %373 = OpAccessChain %367 %69 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpExtInst %1 13 %374 
                                Private f32* %376 = OpAccessChain %367 %69 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %367 %69 
                                         f32 %378 = OpLoad %377 
                                         f32 %380 = OpFMul %378 %379 
                                Private f32* %381 = OpAccessChain %367 %69 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %367 %69 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 10 %383 
                                Private f32* %385 = OpAccessChain %367 %69 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %63 %69 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %367 %69 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %387 %389 
                                Private f32* %391 = OpAccessChain %367 %69 
                                                      OpStore %391 %390 
                                Private f32* %392 = OpAccessChain %367 %69 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpExtInst %1 10 %393 
                                Private f32* %395 = OpAccessChain %367 %69 
                                                      OpStore %395 %394 
                                Private f32* %397 = OpAccessChain %367 %69 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %398 %89 
                                         f32 %400 = OpFAdd %399 %83 
                                Private f32* %401 = OpAccessChain %396 %251 
                                                      OpStore %401 %400 
                                       f32_2 %402 = OpLoad %343 
                                         f32 %404 = OpDot %402 %403 
                                Private f32* %405 = OpAccessChain %367 %69 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %367 %69 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpExtInst %1 13 %407 
                                Private f32* %409 = OpAccessChain %367 %69 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %367 %69 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFMul %411 %379 
                                Private f32* %413 = OpAccessChain %367 %69 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %367 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpExtInst %1 10 %415 
                                Private f32* %417 = OpAccessChain %367 %69 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %63 %69 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %367 %69 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFAdd %419 %421 
                                Private f32* %423 = OpAccessChain %367 %69 
                                                      OpStore %423 %422 
                                Private f32* %424 = OpAccessChain %367 %69 
                                         f32 %425 = OpLoad %424 
                                         f32 %427 = OpFMul %425 %426 
                                Private f32* %428 = OpAccessChain %367 %69 
                                                      OpStore %428 %427 
                                Private f32* %430 = OpAccessChain %367 %69 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpExtInst %1 13 %431 
                                                      OpStore %429 %432 
                                Private f32* %434 = OpAccessChain %367 %69 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 14 %435 
                                Private f32* %437 = OpAccessChain %433 %69 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %396 %251 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFNegate %439 
                                Private f32* %441 = OpAccessChain %396 %251 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFMul %440 %442 
                                         f32 %444 = OpFAdd %443 %19 
                                Private f32* %445 = OpAccessChain %367 %69 
                                                      OpStore %445 %444 
                                Private f32* %446 = OpAccessChain %367 %69 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpExtInst %1 31 %447 
                                Private f32* %449 = OpAccessChain %367 %69 
                                                      OpStore %449 %448 
                                         f32 %450 = OpLoad %429 
                                Private f32* %451 = OpAccessChain %433 %165 
                                                      OpStore %451 %450 
                                       f32_2 %452 = OpLoad %367 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpLoad %433 
                                       f32_2 %455 = OpFMul %453 %454 
                                       f32_3 %456 = OpLoad %396 
                                       f32_3 %457 = OpVectorShuffle %456 %455 3 4 2 
                                                      OpStore %396 %457 
                                         f32 %458 = OpLoad %356 
                                         f32 %459 = OpFAdd %458 %19 
                                                      OpStore %356 %459 
                                         f32 %460 = OpLoad %356 
                                Uniform f32* %461 = OpAccessChain %34 %307 %141 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFDiv %460 %462 
                                                      OpStore %356 %463 
                                         f32 %464 = OpLoad %356 
                                         f32 %465 = OpExtInst %1 31 %464 
                                                      OpStore %356 %465 
                                         f32 %466 = OpLoad %356 
                                Uniform f32* %467 = OpAccessChain %34 %307 %165 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFMul %466 %468 
                                                      OpStore %356 %469 
                                         f32 %471 = OpLoad %356 
                                       f32_3 %472 = OpCompositeConstruct %471 %471 %471 
                                       f32_3 %473 = OpLoad %396 
                                       f32_3 %474 = OpFMul %472 %473 
                                                      OpStore %470 %474 
                                       f32_4 %475 = OpLoad %45 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpFNegate %476 
                                       f32_3 %478 = OpLoad %470 
                                         f32 %479 = OpDot %477 %478 
                                                      OpStore %356 %479 
                                         f32 %481 = OpLoad %356 
                                        bool %482 = OpFOrdGreaterThanEqual %481 %18 
                                                      OpStore %480 %482 
                                        bool %483 = OpLoad %480 
                                                      OpSelectionMerge %487 None 
                                                      OpBranchConditional %483 %486 %490 
                                             %486 = OpLabel 
                                       f32_3 %488 = OpLoad %470 
                                       f32_3 %489 = OpFNegate %488 
                                                      OpStore %485 %489 
                                                      OpBranch %487 
                                             %490 = OpLabel 
                                       f32_3 %491 = OpLoad %470 
                                                      OpStore %485 %491 
                                                      OpBranch %487 
                                             %487 = OpLabel 
                                       f32_3 %492 = OpLoad %485 
                                                      OpStore %470 %492 
                                       f32_3 %493 = OpLoad %97 
                                       f32_3 %494 = OpLoad %470 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %470 %495 
                                       f32_3 %496 = OpLoad %470 
                                       f32_2 %497 = OpVectorShuffle %496 %496 1 1 
                              Uniform f32_4* %498 = OpAccessChain %34 %106 %100 
                                       f32_4 %499 = OpLoad %498 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                                       f32_2 %501 = OpFMul %497 %500 
                                                      OpStore %367 %501 
                              Uniform f32_4* %502 = OpAccessChain %34 %106 %106 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_3 %505 = OpLoad %470 
                                       f32_2 %506 = OpVectorShuffle %505 %505 0 0 
                                       f32_2 %507 = OpFMul %504 %506 
                                       f32_2 %508 = OpLoad %367 
                                       f32_2 %509 = OpFAdd %507 %508 
                                                      OpStore %367 %509 
                              Uniform f32_4* %510 = OpAccessChain %34 %106 %117 
                                       f32_4 %511 = OpLoad %510 
                                       f32_2 %512 = OpVectorShuffle %511 %511 0 1 
                                       f32_3 %513 = OpLoad %470 
                                       f32_2 %514 = OpVectorShuffle %513 %513 2 2 
                                       f32_2 %515 = OpFMul %512 %514 
                                       f32_2 %516 = OpLoad %367 
                                       f32_2 %517 = OpFAdd %515 %516 
                                                      OpStore %367 %517 
                                Private f32* %518 = OpAccessChain %470 %251 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFNegate %519 
                                         f32 %521 = OpFAdd %520 %19 
                                                      OpStore %356 %521 
                                Uniform f32* %522 = OpAccessChain %34 %140 %141 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpLoad %356 
                                         f32 %525 = OpFMul %523 %524 
                                Private f32* %526 = OpAccessChain %470 %251 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpFAdd %525 %527 
                                                      OpStore %356 %528 
                                       f32_2 %529 = OpLoad %367 
                                         f32 %530 = OpLoad %356 
                                       f32_2 %531 = OpCompositeConstruct %530 %530 
                                       f32_2 %532 = OpFDiv %529 %531 
                                                      OpStore %367 %532 
                                       f32_2 %533 = OpLoad %367 
                                       f32_2 %535 = OpFAdd %533 %534 
                                                      OpStore %367 %535 
                                       f32_2 %536 = OpLoad %367 
                                       f32_2 %539 = OpFMul %536 %538 
                                       f32_3 %540 = OpLoad %470 
                                       f32_3 %541 = OpVectorShuffle %540 %539 3 4 2 
                                                      OpStore %470 %541 
                                       f32_3 %542 = OpLoad %470 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                                       f32_2 %544 = OpCompositeConstruct %18 %18 
                                       f32_2 %545 = OpCompositeConstruct %19 %19 
                                       f32_2 %546 = OpExtInst %1 43 %543 %544 %545 
                                       f32_3 %547 = OpLoad %470 
                                       f32_3 %548 = OpVectorShuffle %547 %546 3 4 2 
                                                      OpStore %470 %548 
                                       f32_3 %549 = OpLoad %470 
                                       f32_2 %550 = OpVectorShuffle %549 %549 0 1 
                                Uniform f32* %551 = OpAccessChain %34 %36 
                                         f32 %552 = OpLoad %551 
                                       f32_2 %553 = OpCompositeConstruct %552 %552 
                                       f32_2 %554 = OpFMul %550 %553 
                                       f32_3 %555 = OpLoad %470 
                                       f32_3 %556 = OpVectorShuffle %555 %554 3 4 2 
                                                      OpStore %470 %556 
                         read_only Texture2D %557 = OpLoad %129 
                                     sampler %558 = OpLoad %131 
                  read_only Texture2DSampled %559 = OpSampledImage %557 %558 
                                       f32_3 %560 = OpLoad %470 
                                       f32_2 %561 = OpVectorShuffle %560 %560 0 1 
                                       f32_4 %562 = OpImageSampleExplicitLod %559 %561 Lod %27 
                                         f32 %563 = OpCompositeExtract %562 0 
                                                      OpStore %356 %563 
                                         f32 %564 = OpLoad %356 
                                Uniform f32* %565 = OpAccessChain %34 %148 %69 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpFMul %564 %566 
                                                      OpStore %356 %567 
                                Uniform f32* %568 = OpAccessChain %34 %140 %141 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFNegate %569 
                                         f32 %571 = OpLoad %356 
                                         f32 %572 = OpFMul %570 %571 
                                         f32 %573 = OpFAdd %572 %19 
                                Private f32* %574 = OpAccessChain %470 %69 
                                                      OpStore %574 %573 
                                         f32 %575 = OpLoad %139 
                                         f32 %576 = OpLoad %356 
                                         f32 %577 = OpFMul %575 %576 
                                Uniform f32* %578 = OpAccessChain %34 %148 %165 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFAdd %577 %579 
                                                      OpStore %356 %580 
                                Private f32* %581 = OpAccessChain %470 %69 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpLoad %356 
                                         f32 %584 = OpFDiv %582 %583 
                                                      OpStore %356 %584 
                                       f32_2 %586 = OpLoad %367 
                                       f32_4 %587 = OpVectorShuffle %586 %586 0 1 0 0 
                                      bool_4 %588 = OpFOrdLessThan %587 %178 
                                      bool_2 %589 = OpVectorShuffle %588 %588 0 1 
                                                      OpStore %585 %589 
                               Private bool* %591 = OpAccessChain %585 %165 
                                        bool %592 = OpLoad %591 
                                         u32 %593 = OpSelect %592 %165 %69 
                                         u32 %594 = OpIMul %593 %188 
                               Private bool* %595 = OpAccessChain %585 %69 
                                        bool %596 = OpLoad %595 
                                         u32 %597 = OpSelect %596 %165 %69 
                                         u32 %598 = OpIMul %597 %188 
                                         u32 %599 = OpBitwiseOr %594 %598 
                                         i32 %600 = OpBitcast %599 
                                Private i32* %601 = OpAccessChain %590 %69 
                                                      OpStore %601 %600 
                                       f32_2 %604 = OpLoad %367 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 1 0 1 
                                      bool_4 %606 = OpFOrdLessThan %603 %605 
                                      bool_2 %607 = OpVectorShuffle %606 %606 0 1 
                                                      OpStore %602 %607 
                               Private bool* %608 = OpAccessChain %602 %165 
                                        bool %609 = OpLoad %608 
                                         u32 %610 = OpSelect %609 %165 %69 
                                         u32 %611 = OpIMul %610 %188 
                               Private bool* %612 = OpAccessChain %602 %69 
                                        bool %613 = OpLoad %612 
                                         u32 %614 = OpSelect %613 %165 %69 
                                         u32 %615 = OpIMul %614 %188 
                                         u32 %616 = OpBitwiseOr %611 %615 
                                         i32 %617 = OpBitcast %616 
                                Private i32* %618 = OpAccessChain %590 %165 
                                                      OpStore %618 %617 
                                       i32_2 %619 = OpLoad %590 
                                       u32_2 %620 = OpBitcast %619 
                                       u32_2 %621 = OpBitwiseAnd %620 %218 
                                       i32_2 %622 = OpBitcast %621 
                                                      OpStore %590 %622 
                                Private i32* %623 = OpAccessChain %590 %165 
                                         i32 %624 = OpLoad %623 
                                Private i32* %625 = OpAccessChain %590 %69 
                                         i32 %626 = OpLoad %625 
                                         i32 %627 = OpIAdd %624 %626 
                                Private i32* %628 = OpAccessChain %590 %69 
                                                      OpStore %628 %627 
                                Private i32* %629 = OpAccessChain %590 %69 
                                         i32 %630 = OpLoad %629 
                                         f32 %631 = OpConvertSToF %630 
                                Private f32* %632 = OpAccessChain %470 %69 
                                                      OpStore %632 %631 
                                         f32 %633 = OpLoad %356 
                                        bool %634 = OpFOrdGreaterThanEqual %232 %633 
                               Private bool* %635 = OpAccessChain %602 %69 
                                                      OpStore %635 %634 
                               Private bool* %637 = OpAccessChain %602 %69 
                                        bool %638 = OpLoad %637 
                                         f32 %639 = OpSelect %638 %19 %18 
                                                      OpStore %636 %639 
                                         f32 %640 = OpLoad %636 
                                Private f32* %641 = OpAccessChain %470 %69 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpFAdd %640 %642 
                                Private f32* %644 = OpAccessChain %470 %69 
                                                      OpStore %644 %643 
                                Private f32* %645 = OpAccessChain %470 %69 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFMul %646 %246 
                                Private f32* %648 = OpAccessChain %470 %69 
                                                      OpStore %648 %647 
                                         f32 %649 = OpLoad %356 
                                Uniform f32* %650 = OpAccessChain %34 %117 %251 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %649 %651 
                                Private f32* %653 = OpAccessChain %470 %69 
                                         f32 %654 = OpLoad %653 
                                         f32 %655 = OpFAdd %652 %654 
                                Private f32* %656 = OpAccessChain %396 %251 
                                                      OpStore %656 %655 
                                       f32_2 %657 = OpLoad %367 
                              Uniform f32_4* %658 = OpAccessChain %34 %106 %117 
                                       f32_4 %659 = OpLoad %658 
                                       f32_2 %660 = OpVectorShuffle %659 %659 0 1 
                                       f32_2 %661 = OpFNegate %660 
                                       f32_2 %662 = OpFAdd %657 %661 
                                                      OpStore %367 %662 
                                       f32_2 %663 = OpLoad %367 
                                       f32_2 %664 = OpFAdd %663 %262 
                                                      OpStore %367 %664 
                                       f32_2 %665 = OpLoad %367 
                                       f32_2 %666 = OpLoad %275 
                                       f32_2 %667 = OpFDiv %665 %666 
                                                      OpStore %367 %667 
                                Private f32* %668 = OpAccessChain %396 %251 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFNegate %669 
                                         f32 %671 = OpFAdd %670 %19 
                                                      OpStore %356 %671 
                                Uniform f32* %672 = OpAccessChain %34 %140 %141 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpLoad %356 
                                         f32 %675 = OpFMul %673 %674 
                                Private f32* %676 = OpAccessChain %396 %251 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFAdd %675 %677 
                                                      OpStore %356 %678 
                                         f32 %679 = OpLoad %356 
                                       f32_2 %680 = OpCompositeConstruct %679 %679 
                                       f32_2 %681 = OpLoad %367 
                                       f32_2 %682 = OpFMul %680 %681 
                                       f32_3 %683 = OpLoad %396 
                                       f32_3 %684 = OpVectorShuffle %683 %682 3 4 2 
                                                      OpStore %396 %684 
                                       f32_3 %685 = OpLoad %97 
                                       f32_3 %686 = OpFNegate %685 
                                       f32_3 %687 = OpLoad %396 
                                       f32_3 %688 = OpFAdd %686 %687 
                                                      OpStore %470 %688 
                                       f32_3 %689 = OpLoad %470 
                                       f32_4 %690 = OpLoad %45 
                                       f32_3 %691 = OpVectorShuffle %690 %690 0 1 2 
                                         f32 %692 = OpDot %689 %691 
                                                      OpStore %356 %692 
                                Private f32* %693 = OpAccessChain %97 %251 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpFNegate %694 
                                         f32 %697 = OpFMul %695 %696 
                                         f32 %698 = OpLoad %356 
                                         f32 %699 = OpFAdd %697 %698 
                                                      OpStore %356 %699 
                                         f32 %700 = OpLoad %356 
                                         f32 %701 = OpExtInst %1 40 %700 %18 
                                                      OpStore %356 %701 
                                       f32_3 %702 = OpLoad %470 
                                       f32_3 %703 = OpLoad %470 
                                         f32 %704 = OpDot %702 %703 
                                Private f32* %705 = OpAccessChain %367 %69 
                                                      OpStore %705 %704 
                                Private f32* %706 = OpAccessChain %367 %69 
                                         f32 %707 = OpLoad %706 
                                         f32 %709 = OpFAdd %707 %708 
                                Private f32* %710 = OpAccessChain %367 %69 
                                                      OpStore %710 %709 
                                         f32 %711 = OpLoad %356 
                                Private f32* %712 = OpAccessChain %367 %69 
                                         f32 %713 = OpLoad %712 
                                         f32 %714 = OpFDiv %711 %713 
                                                      OpStore %356 %714 
                                         f32 %715 = OpLoad %236 
                                         f32 %716 = OpLoad %356 
                                         f32 %717 = OpFAdd %715 %716 
                                                      OpStore %236 %717 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                         i32 %718 = OpLoad %347 
                                         i32 %719 = OpIAdd %718 %100 
                                                      OpStore %347 %719 
                                                      OpBranch %348 
                                             %350 = OpLabel 
                                         f32 %720 = OpLoad %236 
                                Uniform f32* %721 = OpAccessChain %34 %307 %165 
                                         f32 %722 = OpLoad %721 
                                         f32 %723 = OpFMul %720 %722 
                                Private f32* %724 = OpAccessChain %9 %69 
                                                      OpStore %724 %723 
                                Private f32* %725 = OpAccessChain %9 %69 
                                         f32 %726 = OpLoad %725 
                                Uniform f32* %727 = OpAccessChain %34 %307 %69 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                Private f32* %730 = OpAccessChain %9 %69 
                                                      OpStore %730 %729 
                                Private f32* %731 = OpAccessChain %9 %69 
                                         f32 %732 = OpLoad %731 
                                Uniform f32* %733 = OpAccessChain %34 %307 %141 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpFDiv %732 %734 
                                Private f32* %736 = OpAccessChain %9 %69 
                                                      OpStore %736 %735 
                                Private f32* %737 = OpAccessChain %9 %69 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpExtInst %1 4 %738 
                                         f32 %741 = OpExtInst %1 40 %739 %740 
                                Private f32* %742 = OpAccessChain %9 %69 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %9 %69 
                                         f32 %744 = OpLoad %743 
                                         f32 %745 = OpExtInst %1 30 %744 
                                Private f32* %746 = OpAccessChain %9 %69 
                                                      OpStore %746 %745 
                                Private f32* %747 = OpAccessChain %9 %69 
                                         f32 %748 = OpLoad %747 
                                         f32 %750 = OpFMul %748 %749 
                                Private f32* %751 = OpAccessChain %9 %69 
                                                      OpStore %751 %750 
                                Private f32* %752 = OpAccessChain %9 %69 
                                         f32 %753 = OpLoad %752 
                                         f32 %754 = OpExtInst %1 29 %753 
                                Private f32* %755 = OpAccessChain %9 %69 
                                                      OpStore %755 %754 
                         read_only Texture2D %756 = OpLoad %129 
                                     sampler %757 = OpLoad %131 
                  read_only Texture2DSampled %758 = OpSampledImage %756 %757 
                                       f32_2 %760 = OpLoad vs_TEXCOORD1 
                                       f32_4 %761 = OpImageSampleImplicitLod %758 %760 
                                         f32 %762 = OpCompositeExtract %761 0 
                                Private f32* %763 = OpAccessChain %63 %69 
                                                      OpStore %763 %762 
                                Private f32* %764 = OpAccessChain %63 %69 
                                         f32 %765 = OpLoad %764 
                                Uniform f32* %766 = OpAccessChain %34 %148 %69 
                                         f32 %767 = OpLoad %766 
                                         f32 %768 = OpFMul %765 %767 
                                Private f32* %769 = OpAccessChain %63 %69 
                                                      OpStore %769 %768 
                                Uniform f32* %770 = OpAccessChain %34 %140 %141 
                                         f32 %771 = OpLoad %770 
                                         f32 %772 = OpFNegate %771 
                                Private f32* %773 = OpAccessChain %63 %69 
                                         f32 %774 = OpLoad %773 
                                         f32 %775 = OpFMul %772 %774 
                                         f32 %776 = OpFAdd %775 %19 
                                                      OpStore %236 %776 
                                         f32 %777 = OpLoad %139 
                                Private f32* %778 = OpAccessChain %63 %69 
                                         f32 %779 = OpLoad %778 
                                         f32 %780 = OpFMul %777 %779 
                                Uniform f32* %781 = OpAccessChain %34 %148 %165 
                                         f32 %782 = OpLoad %781 
                                         f32 %783 = OpFAdd %780 %782 
                                                      OpStore %139 %783 
                                         f32 %784 = OpLoad %236 
                                         f32 %785 = OpLoad %139 
                                         f32 %786 = OpFDiv %784 %785 
                                                      OpStore %139 %786 
                                         f32 %787 = OpLoad %139 
                                Uniform f32* %788 = OpAccessChain %34 %117 %251 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpFMul %787 %789 
                                Uniform f32* %791 = OpAccessChain %34 %117 %165 
                                         f32 %792 = OpLoad %791 
                                         f32 %793 = OpFNegate %792 
                                         f32 %794 = OpFAdd %790 %793 
                                                      OpStore %139 %794 
                                         f32 %795 = OpLoad %139 
                                Uniform f32* %797 = OpAccessChain %34 %796 %69 
                                         f32 %798 = OpLoad %797 
                                         f32 %799 = OpFMul %795 %798 
                                                      OpStore %139 %799 
                                         f32 %800 = OpLoad %139 
                                         f32 %801 = OpLoad %139 
                                         f32 %802 = OpFNegate %801 
                                         f32 %803 = OpFMul %800 %802 
                                                      OpStore %139 %803 
                                         f32 %804 = OpLoad %139 
                                         f32 %805 = OpExtInst %1 29 %804 
                                                      OpStore %139 %805 
                                         f32 %808 = OpLoad %139 
                                Private f32* %809 = OpAccessChain %9 %69 
                                         f32 %810 = OpLoad %809 
                                         f32 %811 = OpFMul %808 %810 
                                 Output f32* %813 = OpAccessChain %807 %69 
                                                      OpStore %813 %811 
                                       f32_4 %814 = OpLoad %45 
                                       f32_3 %815 = OpVectorShuffle %814 %814 0 1 2 
                                       f32_3 %817 = OpFMul %815 %816 
                                       f32_3 %818 = OpFAdd %817 %816 
                                       f32_4 %819 = OpLoad %807 
                                       f32_4 %820 = OpVectorShuffle %819 %818 0 4 5 6 
                                                      OpStore %807 %820 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec3 _FogParams;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
vec2 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
vec2 u_xlat7;
float u_xlat8;
vec3 u_xlat12;
ivec2 u_xlati12;
bvec2 u_xlatb12;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
vec2 u_xlat19;
float u_xlat20;
bvec2 u_xlatb20;
float u_xlat24;
bool u_xlatb24;
int u_xlati25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb16.x = u_xlat16.x!=0.0;
    u_xlat16.x = (u_xlatb16.x) ? -1.0 : -0.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16.xxx;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0 = textureLod(_CameraDepthTexture, u_xlat0.xy, 0.0);
    u_xlat8 = (-unity_OrthoParams.w) + 1.0;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat16.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat8 * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = u_xlat16.x / u_xlat0.x;
    u_xlatb16.xy = lessThan(vs_TEXCOORD0.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlati16.x = int((uint(u_xlatb16.y) * 0xffffffffu) | (uint(u_xlatb16.x) * 0xffffffffu));
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), vs_TEXCOORD0.xyxx).xy;
    u_xlati16.y = int((uint(u_xlatb2.y) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu));
    u_xlati16.xy = ivec2(uvec2(u_xlati16.xy) & uvec2(1u, 1u));
    u_xlati16.x = u_xlati16.y + u_xlati16.x;
    u_xlat16.x = float(u_xlati16.x);
    u_xlatb24 = 9.99999975e-06>=u_xlat0.x;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat24 + u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 100000000.0;
    u_xlat2.z = u_xlat0.x * _ProjectionParams.z + u_xlat16.x;
    u_xlat0.xz = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xz = u_xlat0.xz + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
    u_xlat3.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
    u_xlat0.xz = u_xlat0.xz / u_xlat3.xy;
    u_xlat24 = (-u_xlat2.z) + 1.0;
    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xz;
    u_xlati0 = int(_AOParams.w);
    u_xlat16.xy = vs_TEXCOORD0.xy * _AOParams.zz;
    u_xlat16.xy = u_xlat16.xy * _ScreenParams.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat16.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat16.xy);
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 52.9829178;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat4.x = 12.9898005;
    u_xlat24 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati0 ; u_xlati_loop_1++)
    {
        u_xlat26 = float(u_xlati_loop_1);
        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
        u_xlat19.x = u_xlat4.y * 78.2330017;
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
        u_xlat19.x = sin(u_xlat19.x);
        u_xlat19.x = u_xlat19.x * 43758.5469;
        u_xlat19.x = fract(u_xlat19.x);
        u_xlat19.x = u_xlat16.x + u_xlat19.x;
        u_xlat19.x = u_xlat19.x * 6.28318548;
        u_xlat6 = sin(u_xlat19.x);
        u_xlat7.x = cos(u_xlat19.x);
        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
        u_xlat19.x = sqrt(u_xlat19.x);
        u_xlat7.y = u_xlat6;
        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
        u_xlat26 = u_xlat26 + 1.0;
        u_xlat26 = u_xlat26 / _AOParams.w;
        u_xlat26 = sqrt(u_xlat26);
        u_xlat26 = u_xlat26 * _AOParams.y;
        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
        u_xlatb26 = u_xlat26>=0.0;
        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
        u_xlat19.xy = u_xlat12.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
        u_xlat26 = (-u_xlat12.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
        u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
        u_xlat12.xy = u_xlat12.xy * vec2(_RenderViewportScaleFactor);
        u_xlat5 = textureLod(_CameraDepthTexture, u_xlat12.xy, 0.0);
        u_xlat26 = u_xlat5.x * _ZBufferParams.x;
        u_xlat12.x = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
        u_xlat26 = u_xlat8 * u_xlat26 + _ZBufferParams.y;
        u_xlat26 = u_xlat12.x / u_xlat26;
        u_xlatb12.xy = lessThan(u_xlat19.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
        u_xlatb20.xy = lessThan(vec4(2.0, 2.0, 2.0, 2.0), u_xlat19.xyxy).xy;
        u_xlati12.y = int((uint(u_xlatb20.y) * 0xffffffffu) | (uint(u_xlatb20.x) * 0xffffffffu));
        u_xlati12.xy = ivec2(uvec2(u_xlati12.xy) & uvec2(1u, 1u));
        u_xlati12.x = u_xlati12.y + u_xlati12.x;
        u_xlat12.x = float(u_xlati12.x);
        u_xlatb20.x = 9.99999975e-06>=u_xlat26;
        u_xlat20 = u_xlatb20.x ? 1.0 : float(0.0);
        u_xlat12.x = u_xlat20 + u_xlat12.x;
        u_xlat12.x = u_xlat12.x * 100000000.0;
        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
        u_xlat19.xy = u_xlat19.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
        u_xlat26 = (-u_xlat5.z) + 1.0;
        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
        u_xlat26 = max(u_xlat26, 0.0);
        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
        u_xlat26 = u_xlat26 / u_xlat19.x;
        u_xlat24 = u_xlat24 + u_xlat26;
    }
    u_xlat0.x = u_xlat24 * _AOParams.y;
    u_xlat0.x = u_xlat0.x * _AOParams.x;
    u_xlat0.x = u_xlat0.x / _AOParams.w;
    u_xlat0.x = max(abs(u_xlat0.x), 1.1920929e-07);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.600000024;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat16.x = u_xlat2.x * _ZBufferParams.x;
    u_xlat24 = (-unity_OrthoParams.w) * u_xlat16.x + 1.0;
    u_xlat8 = u_xlat8 * u_xlat16.x + _ZBufferParams.y;
    u_xlat8 = u_xlat24 / u_xlat8;
    u_xlat8 = u_xlat8 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat8 = (-u_xlat8) + _FogParams.z;
    u_xlat16.x = (-_FogParams.y) + _FogParams.z;
    u_xlat8 = u_xlat8 / u_xlat16.x;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    SV_Target0.x = u_xlat8 * u_xlat0.x;
    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 831
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %759 %815 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 12 
                                                      OpDecorate %30 ArrayStride 30 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpMemberDecorate %32 0 Offset 32 
                                                      OpMemberDecorate %32 1 Offset 32 
                                                      OpMemberDecorate %32 2 Offset 32 
                                                      OpMemberDecorate %32 3 Offset 32 
                                                      OpMemberDecorate %32 4 Offset 32 
                                                      OpMemberDecorate %32 5 Offset 32 
                                                      OpMemberDecorate %32 6 Offset 32 
                                                      OpMemberDecorate %32 7 Offset 32 
                                                      OpMemberDecorate %32 8 Offset 32 
                                                      OpDecorate %32 Block 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %48 DescriptorSet 48 
                                                      OpDecorate %48 Binding 48 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %129 DescriptorSet 129 
                                                      OpDecorate %129 Binding 129 
                                                      OpDecorate %131 DescriptorSet 131 
                                                      OpDecorate %131 Binding 131 
                                                      OpDecorate vs_TEXCOORD1 Location 759 
                                                      OpDecorate %815 Location 815 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                          f32 %18 = OpConstant 3.674022E-40 
                                          f32 %19 = OpConstant 3.674022E-40 
                                              %27 = OpTypeVector %6 4 
                                              %28 = OpTypeInt 32 0 
                                          u32 %29 = OpConstant 4 
                                              %30 = OpTypeArray %27 %29 
                                              %31 = OpTypeArray %27 %29 
                                              %32 = OpTypeStruct %30 %31 %27 %27 %27 %27 %6 %7 %27 
                                              %33 = OpTypePointer Uniform %32 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32; f32_3; f32_4;}* %34 = OpVariable Uniform 
                                              %35 = OpTypeInt 32 1 
                                          i32 %36 = OpConstant 6 
                                              %37 = OpTypePointer Uniform %6 
                                              %44 = OpTypePointer Private %27 
                               Private f32_4* %45 = OpVariable Private 
                                              %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %47 = OpTypePointer UniformConstant %46 
         UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
                                              %50 = OpTypeSampler 
                                              %51 = OpTypePointer UniformConstant %50 
                     UniformConstant sampler* %52 = OpVariable UniformConstant 
                                              %54 = OpTypeSampledImage %46 
                                              %62 = OpTypePointer Private %10 
                               Private f32_2* %63 = OpVariable Private 
                                          u32 %69 = OpConstant 0 
                                              %70 = OpTypePointer Private %6 
                                              %72 = OpTypeBool 
                                              %73 = OpTypeVector %72 2 
                                              %74 = OpTypePointer Private %73 
                              Private bool_2* %75 = OpVariable Private 
                                              %79 = OpTypePointer Private %72 
                                          f32 %83 = OpConstant 3.674022E-40 
                                          f32 %84 = OpConstant 3.674022E-40 
                                          f32 %89 = OpConstant 3.674022E-40 
                                        f32_3 %90 = OpConstantComposite %89 %89 %89 
                               Private f32_3* %97 = OpVariable Private 
                                         i32 %100 = OpConstant 1 
                                             %101 = OpTypePointer Uniform %27 
                                         i32 %106 = OpConstant 0 
                                         i32 %117 = OpConstant 2 
        UniformConstant read_only Texture2D* %129 = OpVariable UniformConstant 
                    UniformConstant sampler* %131 = OpVariable UniformConstant 
                                Private f32* %139 = OpVariable Private 
                                         i32 %140 = OpConstant 3 
                                         u32 %141 = OpConstant 3 
                                         i32 %148 = OpConstant 4 
                                         u32 %165 = OpConstant 1 
                                       f32_4 %178 = OpConstantComposite %18 %18 %18 %18 
                                             %179 = OpTypeVector %72 4 
                                             %182 = OpTypeVector %35 2 
                                             %183 = OpTypePointer Private %182 
                              Private i32_2* %184 = OpVariable Private 
                                         u32 %188 = OpConstant 4294967295 
                                             %196 = OpTypePointer Private %35 
                             Private bool_2* %198 = OpVariable Private 
                                       f32_4 %199 = OpConstantComposite %19 %19 %18 %18 
                                             %216 = OpTypeVector %28 2 
                                       u32_2 %218 = OpConstantComposite %165 %165 
                               Private bool* %231 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                Private f32* %236 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                         u32 %251 = OpConstant 2 
                                       f32_2 %260 = OpConstantComposite %89 %89 
                                       f32_2 %262 = OpConstantComposite %83 %83 
                              Private f32_2* %275 = OpVariable Private 
                                Private i32* %306 = OpVariable Private 
                                         i32 %307 = OpConstant 8 
                                         i32 %317 = OpConstant 5 
                                         f32 %324 = OpConstant 3.674022E-40 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_2 %326 = OpConstantComposite %324 %325 
                                         f32 %336 = OpConstant 3.674022E-40 
                              Private f32_2* %343 = OpVariable Private 
                                         f32 %344 = OpConstant 3.674022E-40 
                                             %346 = OpTypePointer Function %35 
                                Private f32* %356 = OpVariable Private 
                                             %359 = OpTypePointer Input %6 
                                         f32 %362 = OpConstant 3.674022E-40 
                              Private f32_2* %367 = OpVariable Private 
                                         f32 %370 = OpConstant 3.674022E-40 
                                         f32 %379 = OpConstant 3.674022E-40 
                              Private f32_3* %396 = OpVariable Private 
                                       f32_2 %403 = OpConstantComposite %19 %370 
                                         f32 %426 = OpConstant 3.674022E-40 
                                Private f32* %429 = OpVariable Private 
                              Private f32_2* %433 = OpVariable Private 
                              Private f32_3* %470 = OpVariable Private 
                               Private bool* %480 = OpVariable Private 
                                             %484 = OpTypePointer Function %7 
                                       f32_2 %534 = OpConstantComposite %19 %19 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_2 %538 = OpConstantComposite %537 %537 
                             Private bool_2* %585 = OpVariable Private 
                              Private i32_2* %590 = OpVariable Private 
                             Private bool_2* %602 = OpVariable Private 
                                       f32_4 %603 = OpConstantComposite %89 %89 %89 %89 
                                Private f32* %636 = OpVariable Private 
                                         f32 %696 = OpConstant 3.674022E-40 
                                         f32 %708 = OpConstant 3.674022E-40 
                                         f32 %740 = OpConstant 3.674022E-40 
                                         f32 %749 = OpConstant 3.674022E-40 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         i32 %797 = OpConstant 7 
                                             %814 = OpTypePointer Output %27 
                               Output f32_4* %815 = OpVariable Output 
                                             %820 = OpTypePointer Output %6 
                                       f32_3 %824 = OpConstantComposite %537 %537 %537 
                                Private i32* %830 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %347 = OpVariable Function 
                             Function f32_3* %485 = OpVariable Function 
                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
                                        f32_3 %14 = OpLoad %9 
                                        f32_3 %15 = OpVectorShuffle %14 %13 3 4 2 
                                                      OpStore %9 %15 
                                        f32_3 %16 = OpLoad %9 
                                        f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                        f32_2 %20 = OpCompositeConstruct %18 %18 
                                        f32_2 %21 = OpCompositeConstruct %19 %19 
                                        f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %22 3 4 2 
                                                      OpStore %9 %24 
                                        f32_3 %25 = OpLoad %9 
                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                 Uniform f32* %38 = OpAccessChain %34 %36 
                                          f32 %39 = OpLoad %38 
                                        f32_2 %40 = OpCompositeConstruct %39 %39 
                                        f32_2 %41 = OpFMul %26 %40 
                                        f32_3 %42 = OpLoad %9 
                                        f32_3 %43 = OpVectorShuffle %42 %41 3 4 2 
                                                      OpStore %9 %43 
                          read_only Texture2D %49 = OpLoad %48 
                                      sampler %53 = OpLoad %52 
                   read_only Texture2DSampled %55 = OpSampledImage %49 %53 
                                        f32_3 %56 = OpLoad %9 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_4 %60 = OpLoad %45 
                                        f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                                      OpStore %45 %61 
                                        f32_4 %64 = OpLoad %45 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                        f32_4 %66 = OpLoad %45 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                          f32 %68 = OpDot %65 %67 
                                 Private f32* %71 = OpAccessChain %63 %69 
                                                      OpStore %71 %68 
                                 Private f32* %76 = OpAccessChain %63 %69 
                                          f32 %77 = OpLoad %76 
                                         bool %78 = OpFOrdNotEqual %77 %18 
                                Private bool* %80 = OpAccessChain %75 %69 
                                                      OpStore %80 %78 
                                Private bool* %81 = OpAccessChain %75 %69 
                                         bool %82 = OpLoad %81 
                                          f32 %85 = OpSelect %82 %83 %84 
                                 Private f32* %86 = OpAccessChain %63 %69 
                                                      OpStore %86 %85 
                                        f32_4 %87 = OpLoad %45 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %91 = OpFMul %88 %90 
                                        f32_2 %92 = OpLoad %63 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFAdd %91 %93 
                                        f32_4 %95 = OpLoad %45 
                                        f32_4 %96 = OpVectorShuffle %95 %94 4 5 6 3 
                                                      OpStore %45 %96 
                                        f32_4 %98 = OpLoad %45 
                                        f32_3 %99 = OpVectorShuffle %98 %98 1 1 1 
                              Uniform f32_4* %102 = OpAccessChain %34 %100 %100 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_3 %105 = OpFMul %99 %104 
                                                      OpStore %97 %105 
                              Uniform f32_4* %107 = OpAccessChain %34 %100 %106 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_4 %110 = OpLoad %45 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 0 0 
                                       f32_3 %112 = OpFMul %109 %111 
                                       f32_3 %113 = OpLoad %97 
                                       f32_3 %114 = OpFAdd %112 %113 
                                       f32_4 %115 = OpLoad %45 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 6 
                                                      OpStore %45 %116 
                              Uniform f32_4* %118 = OpAccessChain %34 %100 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_4 %121 = OpLoad %45 
                                       f32_3 %122 = OpVectorShuffle %121 %121 2 2 2 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %45 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 3 
                                       f32_3 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %45 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %45 %128 
                         read_only Texture2D %130 = OpLoad %129 
                                     sampler %132 = OpLoad %131 
                  read_only Texture2DSampled %133 = OpSampledImage %130 %132 
                                       f32_3 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_4 %136 = OpImageSampleExplicitLod %133 %135 Lod %27 
                                         f32 %137 = OpCompositeExtract %136 0 
                                Private f32* %138 = OpAccessChain %9 %69 
                                                      OpStore %138 %137 
                                Uniform f32* %142 = OpAccessChain %34 %140 %141 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFNegate %143 
                                         f32 %145 = OpFAdd %144 %19 
                                                      OpStore %139 %145 
                                Private f32* %146 = OpAccessChain %9 %69 
                                         f32 %147 = OpLoad %146 
                                Uniform f32* %149 = OpAccessChain %34 %148 %69 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpFMul %147 %150 
                                Private f32* %152 = OpAccessChain %9 %69 
                                                      OpStore %152 %151 
                                Uniform f32* %153 = OpAccessChain %34 %140 %141 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                Private f32* %156 = OpAccessChain %9 %69 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                         f32 %159 = OpFAdd %158 %19 
                                Private f32* %160 = OpAccessChain %63 %69 
                                                      OpStore %160 %159 
                                         f32 %161 = OpLoad %139 
                                Private f32* %162 = OpAccessChain %9 %69 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Uniform f32* %166 = OpAccessChain %34 %148 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %164 %167 
                                Private f32* %169 = OpAccessChain %9 %69 
                                                      OpStore %169 %168 
                                Private f32* %170 = OpAccessChain %63 %69 
                                         f32 %171 = OpLoad %170 
                                Private f32* %172 = OpAccessChain %9 %69 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFDiv %171 %173 
                                Private f32* %175 = OpAccessChain %9 %69 
                                                      OpStore %175 %174 
                                       f32_2 %176 = OpLoad vs_TEXCOORD0 
                                       f32_4 %177 = OpVectorShuffle %176 %176 0 1 0 1 
                                      bool_4 %180 = OpFOrdLessThan %177 %178 
                                      bool_2 %181 = OpVectorShuffle %180 %180 0 1 
                                                      OpStore %75 %181 
                               Private bool* %185 = OpAccessChain %75 %165 
                                        bool %186 = OpLoad %185 
                                         u32 %187 = OpSelect %186 %165 %69 
                                         u32 %189 = OpIMul %187 %188 
                               Private bool* %190 = OpAccessChain %75 %69 
                                        bool %191 = OpLoad %190 
                                         u32 %192 = OpSelect %191 %165 %69 
                                         u32 %193 = OpIMul %192 %188 
                                         u32 %194 = OpBitwiseOr %189 %193 
                                         i32 %195 = OpBitcast %194 
                                Private i32* %197 = OpAccessChain %184 %69 
                                                      OpStore %197 %195 
                                       f32_2 %200 = OpLoad vs_TEXCOORD0 
                                       f32_4 %201 = OpVectorShuffle %200 %200 0 1 0 0 
                                      bool_4 %202 = OpFOrdLessThan %199 %201 
                                      bool_2 %203 = OpVectorShuffle %202 %202 0 1 
                                                      OpStore %198 %203 
                               Private bool* %204 = OpAccessChain %198 %165 
                                        bool %205 = OpLoad %204 
                                         u32 %206 = OpSelect %205 %165 %69 
                                         u32 %207 = OpIMul %206 %188 
                               Private bool* %208 = OpAccessChain %198 %69 
                                        bool %209 = OpLoad %208 
                                         u32 %210 = OpSelect %209 %165 %69 
                                         u32 %211 = OpIMul %210 %188 
                                         u32 %212 = OpBitwiseOr %207 %211 
                                         i32 %213 = OpBitcast %212 
                                Private i32* %214 = OpAccessChain %184 %165 
                                                      OpStore %214 %213 
                                       i32_2 %215 = OpLoad %184 
                                       u32_2 %217 = OpBitcast %215 
                                       u32_2 %219 = OpBitwiseAnd %217 %218 
                                       i32_2 %220 = OpBitcast %219 
                                                      OpStore %184 %220 
                                Private i32* %221 = OpAccessChain %184 %165 
                                         i32 %222 = OpLoad %221 
                                Private i32* %223 = OpAccessChain %184 %69 
                                         i32 %224 = OpLoad %223 
                                         i32 %225 = OpIAdd %222 %224 
                                Private i32* %226 = OpAccessChain %184 %69 
                                                      OpStore %226 %225 
                                Private i32* %227 = OpAccessChain %184 %69 
                                         i32 %228 = OpLoad %227 
                                         f32 %229 = OpConvertSToF %228 
                                Private f32* %230 = OpAccessChain %63 %69 
                                                      OpStore %230 %229 
                                Private f32* %233 = OpAccessChain %9 %69 
                                         f32 %234 = OpLoad %233 
                                        bool %235 = OpFOrdGreaterThanEqual %232 %234 
                                                      OpStore %231 %235 
                                        bool %237 = OpLoad %231 
                                         f32 %238 = OpSelect %237 %19 %18 
                                                      OpStore %236 %238 
                                         f32 %239 = OpLoad %236 
                                Private f32* %240 = OpAccessChain %63 %69 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFAdd %239 %241 
                                Private f32* %243 = OpAccessChain %63 %69 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %63 %69 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpFMul %245 %246 
                                Private f32* %248 = OpAccessChain %63 %69 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %9 %69 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %252 = OpAccessChain %34 %117 %251 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpFMul %250 %253 
                                Private f32* %255 = OpAccessChain %63 %69 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %254 %256 
                                Private f32* %258 = OpAccessChain %97 %251 
                                                      OpStore %258 %257 
                                       f32_2 %259 = OpLoad vs_TEXCOORD0 
                                       f32_2 %261 = OpFMul %259 %260 
                                       f32_2 %263 = OpFAdd %261 %262 
                                       f32_3 %264 = OpLoad %9 
                                       f32_3 %265 = OpVectorShuffle %264 %263 3 1 4 
                                                      OpStore %9 %265 
                                       f32_3 %266 = OpLoad %9 
                                       f32_2 %267 = OpVectorShuffle %266 %266 0 2 
                              Uniform f32_4* %268 = OpAccessChain %34 %106 %117 
                                       f32_4 %269 = OpLoad %268 
                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
                                       f32_2 %271 = OpFNegate %270 
                                       f32_2 %272 = OpFAdd %267 %271 
                                       f32_3 %273 = OpLoad %9 
                                       f32_3 %274 = OpVectorShuffle %273 %272 3 1 4 
                                                      OpStore %9 %274 
                                Uniform f32* %276 = OpAccessChain %34 %106 %106 %69 
                                         f32 %277 = OpLoad %276 
                                Private f32* %278 = OpAccessChain %275 %69 
                                                      OpStore %278 %277 
                                Uniform f32* %279 = OpAccessChain %34 %106 %100 %165 
                                         f32 %280 = OpLoad %279 
                                Private f32* %281 = OpAccessChain %275 %165 
                                                      OpStore %281 %280 
                                       f32_3 %282 = OpLoad %9 
                                       f32_2 %283 = OpVectorShuffle %282 %282 0 2 
                                       f32_2 %284 = OpLoad %275 
                                       f32_2 %285 = OpFDiv %283 %284 
                                       f32_3 %286 = OpLoad %9 
                                       f32_3 %287 = OpVectorShuffle %286 %285 3 1 4 
                                                      OpStore %9 %287 
                                Private f32* %288 = OpAccessChain %97 %251 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFNegate %289 
                                         f32 %291 = OpFAdd %290 %19 
                                                      OpStore %236 %291 
                                Uniform f32* %292 = OpAccessChain %34 %140 %141 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpLoad %236 
                                         f32 %295 = OpFMul %293 %294 
                                Private f32* %296 = OpAccessChain %97 %251 
                                         f32 %297 = OpLoad %296 
                                         f32 %298 = OpFAdd %295 %297 
                                                      OpStore %236 %298 
                                         f32 %299 = OpLoad %236 
                                       f32_2 %300 = OpCompositeConstruct %299 %299 
                                       f32_3 %301 = OpLoad %9 
                                       f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                       f32_2 %303 = OpFMul %300 %302 
                                       f32_3 %304 = OpLoad %97 
                                       f32_3 %305 = OpVectorShuffle %304 %303 3 4 2 
                                                      OpStore %97 %305 
                                Uniform f32* %308 = OpAccessChain %34 %307 %141 
                                         f32 %309 = OpLoad %308 
                                         i32 %310 = OpConvertFToS %309 
                                                      OpStore %306 %310 
                                       f32_2 %311 = OpLoad vs_TEXCOORD0 
                              Uniform f32_4* %312 = OpAccessChain %34 %307 
                                       f32_4 %313 = OpLoad %312 
                                       f32_2 %314 = OpVectorShuffle %313 %313 2 2 
                                       f32_2 %315 = OpFMul %311 %314 
                                                      OpStore %63 %315 
                                       f32_2 %316 = OpLoad %63 
                              Uniform f32_4* %318 = OpAccessChain %34 %317 
                                       f32_4 %319 = OpLoad %318 
                                       f32_2 %320 = OpVectorShuffle %319 %319 0 1 
                                       f32_2 %321 = OpFMul %316 %320 
                                                      OpStore %63 %321 
                                       f32_2 %322 = OpLoad %63 
                                       f32_2 %323 = OpExtInst %1 8 %322 
                                                      OpStore %63 %323 
                                       f32_2 %327 = OpLoad %63 
                                         f32 %328 = OpDot %326 %327 
                                Private f32* %329 = OpAccessChain %63 %69 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %63 %69 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpExtInst %1 10 %331 
                                Private f32* %333 = OpAccessChain %63 %69 
                                                      OpStore %333 %332 
                                Private f32* %334 = OpAccessChain %63 %69 
                                         f32 %335 = OpLoad %334 
                                         f32 %337 = OpFMul %335 %336 
                                Private f32* %338 = OpAccessChain %63 %69 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %63 %69 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpExtInst %1 10 %340 
                                Private f32* %342 = OpAccessChain %63 %69 
                                                      OpStore %342 %341 
                                Private f32* %345 = OpAccessChain %343 %69 
                                                      OpStore %345 %344 
                                                      OpStore %236 %18 
                                                      OpStore %347 %106 
                                                      OpBranch %348 
                                             %348 = OpLabel 
                                                      OpLoopMerge %350 %351 None 
                                                      OpBranch %352 
                                             %352 = OpLabel 
                                         i32 %353 = OpLoad %347 
                                         i32 %354 = OpLoad %306 
                                        bool %355 = OpSLessThan %353 %354 
                                                      OpBranchConditional %355 %349 %350 
                                             %349 = OpLabel 
                                         i32 %357 = OpLoad %347 
                                         f32 %358 = OpConvertSToF %357 
                                                      OpStore %356 %358 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD0 %69 
                                         f32 %361 = OpLoad %360 
                                         f32 %363 = OpFMul %361 %362 
                                         f32 %364 = OpLoad %356 
                                         f32 %365 = OpFAdd %363 %364 
                                Private f32* %366 = OpAccessChain %343 %165 
                                                      OpStore %366 %365 
                                Private f32* %368 = OpAccessChain %343 %165 
                                         f32 %369 = OpLoad %368 
                                         f32 %371 = OpFMul %369 %370 
                                Private f32* %372 = OpAccessChain %367 %69 
                                                      OpStore %372 %371 
                                Private f32* %373 = OpAccessChain %367 %69 
                                         f32 %374 = OpLoad %373 
                                         f32 %375 = OpExtInst %1 13 %374 
                                Private f32* %376 = OpAccessChain %367 %69 
                                                      OpStore %376 %375 
                                Private f32* %377 = OpAccessChain %367 %69 
                                         f32 %378 = OpLoad %377 
                                         f32 %380 = OpFMul %378 %379 
                                Private f32* %381 = OpAccessChain %367 %69 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %367 %69 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 10 %383 
                                Private f32* %385 = OpAccessChain %367 %69 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %63 %69 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %367 %69 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %387 %389 
                                Private f32* %391 = OpAccessChain %367 %69 
                                                      OpStore %391 %390 
                                Private f32* %392 = OpAccessChain %367 %69 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpExtInst %1 10 %393 
                                Private f32* %395 = OpAccessChain %367 %69 
                                                      OpStore %395 %394 
                                Private f32* %397 = OpAccessChain %367 %69 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFMul %398 %89 
                                         f32 %400 = OpFAdd %399 %83 
                                Private f32* %401 = OpAccessChain %396 %251 
                                                      OpStore %401 %400 
                                       f32_2 %402 = OpLoad %343 
                                         f32 %404 = OpDot %402 %403 
                                Private f32* %405 = OpAccessChain %367 %69 
                                                      OpStore %405 %404 
                                Private f32* %406 = OpAccessChain %367 %69 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpExtInst %1 13 %407 
                                Private f32* %409 = OpAccessChain %367 %69 
                                                      OpStore %409 %408 
                                Private f32* %410 = OpAccessChain %367 %69 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFMul %411 %379 
                                Private f32* %413 = OpAccessChain %367 %69 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %367 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpExtInst %1 10 %415 
                                Private f32* %417 = OpAccessChain %367 %69 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %63 %69 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %367 %69 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFAdd %419 %421 
                                Private f32* %423 = OpAccessChain %367 %69 
                                                      OpStore %423 %422 
                                Private f32* %424 = OpAccessChain %367 %69 
                                         f32 %425 = OpLoad %424 
                                         f32 %427 = OpFMul %425 %426 
                                Private f32* %428 = OpAccessChain %367 %69 
                                                      OpStore %428 %427 
                                Private f32* %430 = OpAccessChain %367 %69 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpExtInst %1 13 %431 
                                                      OpStore %429 %432 
                                Private f32* %434 = OpAccessChain %367 %69 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 14 %435 
                                Private f32* %437 = OpAccessChain %433 %69 
                                                      OpStore %437 %436 
                                Private f32* %438 = OpAccessChain %396 %251 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFNegate %439 
                                Private f32* %441 = OpAccessChain %396 %251 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpFMul %440 %442 
                                         f32 %444 = OpFAdd %443 %19 
                                Private f32* %445 = OpAccessChain %367 %69 
                                                      OpStore %445 %444 
                                Private f32* %446 = OpAccessChain %367 %69 
                                         f32 %447 = OpLoad %446 
                                         f32 %448 = OpExtInst %1 31 %447 
                                Private f32* %449 = OpAccessChain %367 %69 
                                                      OpStore %449 %448 
                                         f32 %450 = OpLoad %429 
                                Private f32* %451 = OpAccessChain %433 %165 
                                                      OpStore %451 %450 
                                       f32_2 %452 = OpLoad %367 
                                       f32_2 %453 = OpVectorShuffle %452 %452 0 0 
                                       f32_2 %454 = OpLoad %433 
                                       f32_2 %455 = OpFMul %453 %454 
                                       f32_3 %456 = OpLoad %396 
                                       f32_3 %457 = OpVectorShuffle %456 %455 3 4 2 
                                                      OpStore %396 %457 
                                         f32 %458 = OpLoad %356 
                                         f32 %459 = OpFAdd %458 %19 
                                                      OpStore %356 %459 
                                         f32 %460 = OpLoad %356 
                                Uniform f32* %461 = OpAccessChain %34 %307 %141 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFDiv %460 %462 
                                                      OpStore %356 %463 
                                         f32 %464 = OpLoad %356 
                                         f32 %465 = OpExtInst %1 31 %464 
                                                      OpStore %356 %465 
                                         f32 %466 = OpLoad %356 
                                Uniform f32* %467 = OpAccessChain %34 %307 %165 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFMul %466 %468 
                                                      OpStore %356 %469 
                                         f32 %471 = OpLoad %356 
                                       f32_3 %472 = OpCompositeConstruct %471 %471 %471 
                                       f32_3 %473 = OpLoad %396 
                                       f32_3 %474 = OpFMul %472 %473 
                                                      OpStore %470 %474 
                                       f32_4 %475 = OpLoad %45 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpFNegate %476 
                                       f32_3 %478 = OpLoad %470 
                                         f32 %479 = OpDot %477 %478 
                                                      OpStore %356 %479 
                                         f32 %481 = OpLoad %356 
                                        bool %482 = OpFOrdGreaterThanEqual %481 %18 
                                                      OpStore %480 %482 
                                        bool %483 = OpLoad %480 
                                                      OpSelectionMerge %487 None 
                                                      OpBranchConditional %483 %486 %490 
                                             %486 = OpLabel 
                                       f32_3 %488 = OpLoad %470 
                                       f32_3 %489 = OpFNegate %488 
                                                      OpStore %485 %489 
                                                      OpBranch %487 
                                             %490 = OpLabel 
                                       f32_3 %491 = OpLoad %470 
                                                      OpStore %485 %491 
                                                      OpBranch %487 
                                             %487 = OpLabel 
                                       f32_3 %492 = OpLoad %485 
                                                      OpStore %470 %492 
                                       f32_3 %493 = OpLoad %97 
                                       f32_3 %494 = OpLoad %470 
                                       f32_3 %495 = OpFAdd %493 %494 
                                                      OpStore %470 %495 
                                       f32_3 %496 = OpLoad %470 
                                       f32_2 %497 = OpVectorShuffle %496 %496 1 1 
                              Uniform f32_4* %498 = OpAccessChain %34 %106 %100 
                                       f32_4 %499 = OpLoad %498 
                                       f32_2 %500 = OpVectorShuffle %499 %499 0 1 
                                       f32_2 %501 = OpFMul %497 %500 
                                                      OpStore %367 %501 
                              Uniform f32_4* %502 = OpAccessChain %34 %106 %106 
                                       f32_4 %503 = OpLoad %502 
                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
                                       f32_3 %505 = OpLoad %470 
                                       f32_2 %506 = OpVectorShuffle %505 %505 0 0 
                                       f32_2 %507 = OpFMul %504 %506 
                                       f32_2 %508 = OpLoad %367 
                                       f32_2 %509 = OpFAdd %507 %508 
                                                      OpStore %367 %509 
                              Uniform f32_4* %510 = OpAccessChain %34 %106 %117 
                                       f32_4 %511 = OpLoad %510 
                                       f32_2 %512 = OpVectorShuffle %511 %511 0 1 
                                       f32_3 %513 = OpLoad %470 
                                       f32_2 %514 = OpVectorShuffle %513 %513 2 2 
                                       f32_2 %515 = OpFMul %512 %514 
                                       f32_2 %516 = OpLoad %367 
                                       f32_2 %517 = OpFAdd %515 %516 
                                                      OpStore %367 %517 
                                Private f32* %518 = OpAccessChain %470 %251 
                                         f32 %519 = OpLoad %518 
                                         f32 %520 = OpFNegate %519 
                                         f32 %521 = OpFAdd %520 %19 
                                                      OpStore %356 %521 
                                Uniform f32* %522 = OpAccessChain %34 %140 %141 
                                         f32 %523 = OpLoad %522 
                                         f32 %524 = OpLoad %356 
                                         f32 %525 = OpFMul %523 %524 
                                Private f32* %526 = OpAccessChain %470 %251 
                                         f32 %527 = OpLoad %526 
                                         f32 %528 = OpFAdd %525 %527 
                                                      OpStore %356 %528 
                                       f32_2 %529 = OpLoad %367 
                                         f32 %530 = OpLoad %356 
                                       f32_2 %531 = OpCompositeConstruct %530 %530 
                                       f32_2 %532 = OpFDiv %529 %531 
                                                      OpStore %367 %532 
                                       f32_2 %533 = OpLoad %367 
                                       f32_2 %535 = OpFAdd %533 %534 
                                                      OpStore %367 %535 
                                       f32_2 %536 = OpLoad %367 
                                       f32_2 %539 = OpFMul %536 %538 
                                       f32_3 %540 = OpLoad %470 
                                       f32_3 %541 = OpVectorShuffle %540 %539 3 4 2 
                                                      OpStore %470 %541 
                                       f32_3 %542 = OpLoad %470 
                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
                                       f32_2 %544 = OpCompositeConstruct %18 %18 
                                       f32_2 %545 = OpCompositeConstruct %19 %19 
                                       f32_2 %546 = OpExtInst %1 43 %543 %544 %545 
                                       f32_3 %547 = OpLoad %470 
                                       f32_3 %548 = OpVectorShuffle %547 %546 3 4 2 
                                                      OpStore %470 %548 
                                       f32_3 %549 = OpLoad %470 
                                       f32_2 %550 = OpVectorShuffle %549 %549 0 1 
                                Uniform f32* %551 = OpAccessChain %34 %36 
                                         f32 %552 = OpLoad %551 
                                       f32_2 %553 = OpCompositeConstruct %552 %552 
                                       f32_2 %554 = OpFMul %550 %553 
                                       f32_3 %555 = OpLoad %470 
                                       f32_3 %556 = OpVectorShuffle %555 %554 3 4 2 
                                                      OpStore %470 %556 
                         read_only Texture2D %557 = OpLoad %129 
                                     sampler %558 = OpLoad %131 
                  read_only Texture2DSampled %559 = OpSampledImage %557 %558 
                                       f32_3 %560 = OpLoad %470 
                                       f32_2 %561 = OpVectorShuffle %560 %560 0 1 
                                       f32_4 %562 = OpImageSampleExplicitLod %559 %561 Lod %27 
                                         f32 %563 = OpCompositeExtract %562 0 
                                                      OpStore %356 %563 
                                         f32 %564 = OpLoad %356 
                                Uniform f32* %565 = OpAccessChain %34 %148 %69 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpFMul %564 %566 
                                                      OpStore %356 %567 
                                Uniform f32* %568 = OpAccessChain %34 %140 %141 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFNegate %569 
                                         f32 %571 = OpLoad %356 
                                         f32 %572 = OpFMul %570 %571 
                                         f32 %573 = OpFAdd %572 %19 
                                Private f32* %574 = OpAccessChain %470 %69 
                                                      OpStore %574 %573 
                                         f32 %575 = OpLoad %139 
                                         f32 %576 = OpLoad %356 
                                         f32 %577 = OpFMul %575 %576 
                                Uniform f32* %578 = OpAccessChain %34 %148 %165 
                                         f32 %579 = OpLoad %578 
                                         f32 %580 = OpFAdd %577 %579 
                                                      OpStore %356 %580 
                                Private f32* %581 = OpAccessChain %470 %69 
                                         f32 %582 = OpLoad %581 
                                         f32 %583 = OpLoad %356 
                                         f32 %584 = OpFDiv %582 %583 
                                                      OpStore %356 %584 
                                       f32_2 %586 = OpLoad %367 
                                       f32_4 %587 = OpVectorShuffle %586 %586 0 1 0 0 
                                      bool_4 %588 = OpFOrdLessThan %587 %178 
                                      bool_2 %589 = OpVectorShuffle %588 %588 0 1 
                                                      OpStore %585 %589 
                               Private bool* %591 = OpAccessChain %585 %165 
                                        bool %592 = OpLoad %591 
                                         u32 %593 = OpSelect %592 %165 %69 
                                         u32 %594 = OpIMul %593 %188 
                               Private bool* %595 = OpAccessChain %585 %69 
                                        bool %596 = OpLoad %595 
                                         u32 %597 = OpSelect %596 %165 %69 
                                         u32 %598 = OpIMul %597 %188 
                                         u32 %599 = OpBitwiseOr %594 %598 
                                         i32 %600 = OpBitcast %599 
                                Private i32* %601 = OpAccessChain %590 %69 
                                                      OpStore %601 %600 
                                       f32_2 %604 = OpLoad %367 
                                       f32_4 %605 = OpVectorShuffle %604 %604 0 1 0 1 
                                      bool_4 %606 = OpFOrdLessThan %603 %605 
                                      bool_2 %607 = OpVectorShuffle %606 %606 0 1 
                                                      OpStore %602 %607 
                               Private bool* %608 = OpAccessChain %602 %165 
                                        bool %609 = OpLoad %608 
                                         u32 %610 = OpSelect %609 %165 %69 
                                         u32 %611 = OpIMul %610 %188 
                               Private bool* %612 = OpAccessChain %602 %69 
                                        bool %613 = OpLoad %612 
                                         u32 %614 = OpSelect %613 %165 %69 
                                         u32 %615 = OpIMul %614 %188 
                                         u32 %616 = OpBitwiseOr %611 %615 
                                         i32 %617 = OpBitcast %616 
                                Private i32* %618 = OpAccessChain %590 %165 
                                                      OpStore %618 %617 
                                       i32_2 %619 = OpLoad %590 
                                       u32_2 %620 = OpBitcast %619 
                                       u32_2 %621 = OpBitwiseAnd %620 %218 
                                       i32_2 %622 = OpBitcast %621 
                                                      OpStore %590 %622 
                                Private i32* %623 = OpAccessChain %590 %165 
                                         i32 %624 = OpLoad %623 
                                Private i32* %625 = OpAccessChain %590 %69 
                                         i32 %626 = OpLoad %625 
                                         i32 %627 = OpIAdd %624 %626 
                                Private i32* %628 = OpAccessChain %590 %69 
                                                      OpStore %628 %627 
                                Private i32* %629 = OpAccessChain %590 %69 
                                         i32 %630 = OpLoad %629 
                                         f32 %631 = OpConvertSToF %630 
                                Private f32* %632 = OpAccessChain %470 %69 
                                                      OpStore %632 %631 
                                         f32 %633 = OpLoad %356 
                                        bool %634 = OpFOrdGreaterThanEqual %232 %633 
                               Private bool* %635 = OpAccessChain %602 %69 
                                                      OpStore %635 %634 
                               Private bool* %637 = OpAccessChain %602 %69 
                                        bool %638 = OpLoad %637 
                                         f32 %639 = OpSelect %638 %19 %18 
                                                      OpStore %636 %639 
                                         f32 %640 = OpLoad %636 
                                Private f32* %641 = OpAccessChain %470 %69 
                                         f32 %642 = OpLoad %641 
                                         f32 %643 = OpFAdd %640 %642 
                                Private f32* %644 = OpAccessChain %470 %69 
                                                      OpStore %644 %643 
                                Private f32* %645 = OpAccessChain %470 %69 
                                         f32 %646 = OpLoad %645 
                                         f32 %647 = OpFMul %646 %246 
                                Private f32* %648 = OpAccessChain %470 %69 
                                                      OpStore %648 %647 
                                         f32 %649 = OpLoad %356 
                                Uniform f32* %650 = OpAccessChain %34 %117 %251 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %649 %651 
                                Private f32* %653 = OpAccessChain %470 %69 
                                         f32 %654 = OpLoad %653 
                                         f32 %655 = OpFAdd %652 %654 
                                Private f32* %656 = OpAccessChain %396 %251 
                                                      OpStore %656 %655 
                                       f32_2 %657 = OpLoad %367 
                              Uniform f32_4* %658 = OpAccessChain %34 %106 %117 
                                       f32_4 %659 = OpLoad %658 
                                       f32_2 %660 = OpVectorShuffle %659 %659 0 1 
                                       f32_2 %661 = OpFNegate %660 
                                       f32_2 %662 = OpFAdd %657 %661 
                                                      OpStore %367 %662 
                                       f32_2 %663 = OpLoad %367 
                                       f32_2 %664 = OpFAdd %663 %262 
                                                      OpStore %367 %664 
                                       f32_2 %665 = OpLoad %367 
                                       f32_2 %666 = OpLoad %275 
                                       f32_2 %667 = OpFDiv %665 %666 
                                                      OpStore %367 %667 
                                Private f32* %668 = OpAccessChain %396 %251 
                                         f32 %669 = OpLoad %668 
                                         f32 %670 = OpFNegate %669 
                                         f32 %671 = OpFAdd %670 %19 
                                                      OpStore %356 %671 
                                Uniform f32* %672 = OpAccessChain %34 %140 %141 
                                         f32 %673 = OpLoad %672 
                                         f32 %674 = OpLoad %356 
                                         f32 %675 = OpFMul %673 %674 
                                Private f32* %676 = OpAccessChain %396 %251 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFAdd %675 %677 
                                                      OpStore %356 %678 
                                         f32 %679 = OpLoad %356 
                                       f32_2 %680 = OpCompositeConstruct %679 %679 
                                       f32_2 %681 = OpLoad %367 
                                       f32_2 %682 = OpFMul %680 %681 
                                       f32_3 %683 = OpLoad %396 
                                       f32_3 %684 = OpVectorShuffle %683 %682 3 4 2 
                                                      OpStore %396 %684 
                                       f32_3 %685 = OpLoad %97 
                                       f32_3 %686 = OpFNegate %685 
                                       f32_3 %687 = OpLoad %396 
                                       f32_3 %688 = OpFAdd %686 %687 
                                                      OpStore %470 %688 
                                       f32_3 %689 = OpLoad %470 
                                       f32_4 %690 = OpLoad %45 
                                       f32_3 %691 = OpVectorShuffle %690 %690 0 1 2 
                                         f32 %692 = OpDot %689 %691 
                                                      OpStore %356 %692 
                                Private f32* %693 = OpAccessChain %97 %251 
                                         f32 %694 = OpLoad %693 
                                         f32 %695 = OpFNegate %694 
                                         f32 %697 = OpFMul %695 %696 
                                         f32 %698 = OpLoad %356 
                                         f32 %699 = OpFAdd %697 %698 
                                                      OpStore %356 %699 
                                         f32 %700 = OpLoad %356 
                                         f32 %701 = OpExtInst %1 40 %700 %18 
                                                      OpStore %356 %701 
                                       f32_3 %702 = OpLoad %470 
                                       f32_3 %703 = OpLoad %470 
                                         f32 %704 = OpDot %702 %703 
                                Private f32* %705 = OpAccessChain %367 %69 
                                                      OpStore %705 %704 
                                Private f32* %706 = OpAccessChain %367 %69 
                                         f32 %707 = OpLoad %706 
                                         f32 %709 = OpFAdd %707 %708 
                                Private f32* %710 = OpAccessChain %367 %69 
                                                      OpStore %710 %709 
                                         f32 %711 = OpLoad %356 
                                Private f32* %712 = OpAccessChain %367 %69 
                                         f32 %713 = OpLoad %712 
                                         f32 %714 = OpFDiv %711 %713 
                                                      OpStore %356 %714 
                                         f32 %715 = OpLoad %236 
                                         f32 %716 = OpLoad %356 
                                         f32 %717 = OpFAdd %715 %716 
                                                      OpStore %236 %717 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                         i32 %718 = OpLoad %347 
                                         i32 %719 = OpIAdd %718 %100 
                                                      OpStore %347 %719 
                                                      OpBranch %348 
                                             %350 = OpLabel 
                                         f32 %720 = OpLoad %236 
                                Uniform f32* %721 = OpAccessChain %34 %307 %165 
                                         f32 %722 = OpLoad %721 
                                         f32 %723 = OpFMul %720 %722 
                                Private f32* %724 = OpAccessChain %9 %69 
                                                      OpStore %724 %723 
                                Private f32* %725 = OpAccessChain %9 %69 
                                         f32 %726 = OpLoad %725 
                                Uniform f32* %727 = OpAccessChain %34 %307 %69 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                Private f32* %730 = OpAccessChain %9 %69 
                                                      OpStore %730 %729 
                                Private f32* %731 = OpAccessChain %9 %69 
                                         f32 %732 = OpLoad %731 
                                Uniform f32* %733 = OpAccessChain %34 %307 %141 
                                         f32 %734 = OpLoad %733 
                                         f32 %735 = OpFDiv %732 %734 
                                Private f32* %736 = OpAccessChain %9 %69 
                                                      OpStore %736 %735 
                                Private f32* %737 = OpAccessChain %9 %69 
                                         f32 %738 = OpLoad %737 
                                         f32 %739 = OpExtInst %1 4 %738 
                                         f32 %741 = OpExtInst %1 40 %739 %740 
                                Private f32* %742 = OpAccessChain %9 %69 
                                                      OpStore %742 %741 
                                Private f32* %743 = OpAccessChain %9 %69 
                                         f32 %744 = OpLoad %743 
                                         f32 %745 = OpExtInst %1 30 %744 
                                Private f32* %746 = OpAccessChain %9 %69 
                                                      OpStore %746 %745 
                                Private f32* %747 = OpAccessChain %9 %69 
                                         f32 %748 = OpLoad %747 
                                         f32 %750 = OpFMul %748 %749 
                                Private f32* %751 = OpAccessChain %9 %69 
                                                      OpStore %751 %750 
                                Private f32* %752 = OpAccessChain %9 %69 
                                         f32 %753 = OpLoad %752 
                                         f32 %754 = OpExtInst %1 29 %753 
                                Private f32* %755 = OpAccessChain %9 %69 
                                                      OpStore %755 %754 
                         read_only Texture2D %756 = OpLoad %129 
                                     sampler %757 = OpLoad %131 
                  read_only Texture2DSampled %758 = OpSampledImage %756 %757 
                                       f32_2 %760 = OpLoad vs_TEXCOORD1 
                                       f32_4 %761 = OpImageSampleImplicitLod %758 %760 
                                         f32 %762 = OpCompositeExtract %761 0 
                                Private f32* %763 = OpAccessChain %63 %69 
                                                      OpStore %763 %762 
                                Private f32* %764 = OpAccessChain %63 %69 
                                         f32 %765 = OpLoad %764 
                                Uniform f32* %766 = OpAccessChain %34 %148 %69 
                                         f32 %767 = OpLoad %766 
                                         f32 %768 = OpFMul %765 %767 
                                Private f32* %769 = OpAccessChain %63 %69 
                                                      OpStore %769 %768 
                                Uniform f32* %770 = OpAccessChain %34 %140 %141 
                                         f32 %771 = OpLoad %770 
                                         f32 %772 = OpFNegate %771 
                                Private f32* %773 = OpAccessChain %63 %69 
                                         f32 %774 = OpLoad %773 
                                         f32 %775 = OpFMul %772 %774 
                                         f32 %776 = OpFAdd %775 %19 
                                                      OpStore %236 %776 
                                         f32 %777 = OpLoad %139 
                                Private f32* %778 = OpAccessChain %63 %69 
                                         f32 %779 = OpLoad %778 
                                         f32 %780 = OpFMul %777 %779 
                                Uniform f32* %781 = OpAccessChain %34 %148 %165 
                                         f32 %782 = OpLoad %781 
                                         f32 %783 = OpFAdd %780 %782 
                                                      OpStore %139 %783 
                                         f32 %784 = OpLoad %236 
                                         f32 %785 = OpLoad %139 
                                         f32 %786 = OpFDiv %784 %785 
                                                      OpStore %139 %786 
                                         f32 %787 = OpLoad %139 
                                Uniform f32* %788 = OpAccessChain %34 %117 %251 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpFMul %787 %789 
                                Uniform f32* %791 = OpAccessChain %34 %117 %165 
                                         f32 %792 = OpLoad %791 
                                         f32 %793 = OpFNegate %792 
                                         f32 %794 = OpFAdd %790 %793 
                                                      OpStore %139 %794 
                                         f32 %795 = OpLoad %139 
                                         f32 %796 = OpFNegate %795 
                                Uniform f32* %798 = OpAccessChain %34 %797 %251 
                                         f32 %799 = OpLoad %798 
                                         f32 %800 = OpFAdd %796 %799 
                                                      OpStore %139 %800 
                                Uniform f32* %801 = OpAccessChain %34 %797 %165 
                                         f32 %802 = OpLoad %801 
                                         f32 %803 = OpFNegate %802 
                                Uniform f32* %804 = OpAccessChain %34 %797 %251 
                                         f32 %805 = OpLoad %804 
                                         f32 %806 = OpFAdd %803 %805 
                                Private f32* %807 = OpAccessChain %63 %69 
                                                      OpStore %807 %806 
                                         f32 %808 = OpLoad %139 
                                Private f32* %809 = OpAccessChain %63 %69 
                                         f32 %810 = OpLoad %809 
                                         f32 %811 = OpFDiv %808 %810 
                                                      OpStore %139 %811 
                                         f32 %812 = OpLoad %139 
                                         f32 %813 = OpExtInst %1 43 %812 %18 %19 
                                                      OpStore %139 %813 
                                         f32 %816 = OpLoad %139 
                                Private f32* %817 = OpAccessChain %9 %69 
                                         f32 %818 = OpLoad %817 
                                         f32 %819 = OpFMul %816 %818 
                                 Output f32* %821 = OpAccessChain %815 %69 
                                                      OpStore %821 %819 
                                       f32_4 %822 = OpLoad %45 
                                       f32_3 %823 = OpVectorShuffle %822 %822 0 1 2 
                                       f32_3 %825 = OpFMul %823 %824 
                                       f32_3 %826 = OpFAdd %825 %824 
                                       f32_4 %827 = OpLoad %815 
                                       f32_4 %828 = OpVectorShuffle %827 %826 0 4 5 6 
                                                      OpStore %815 %828 
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
SubProgram "d3d11 " {
Keywords { "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" }
""
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" }
""
}
SubProgram "d3d11 " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
""
}
SubProgram "vulkan " {
Keywords { "APPLY_FORWARD_FOG" "FOG_LINEAR" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 149318
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthNormalsTexture;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
float u_xlat12;
float u_xlat13;
float u_xlat17;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.x;
    u_xlat0.y = 0.0;
    u_xlat1 = (-u_xlat0.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0 = u_xlat0.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD0.xyxy;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD1.xy);
    u_xlat3.xyz = u_xlat3.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
    u_xlat13 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat13 = 2.0 / u_xlat13;
    u_xlat9.xy = u_xlat3.xy * vec2(u_xlat13);
    u_xlat9.z = u_xlat13 + -1.0;
    u_xlat3.xyz = u_xlat9.xyz * vec3(1.0, 1.0, -1.0);
    SV_Target0.yzw = u_xlat9.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat7.x = u_xlat7.x * 0.31621623;
    u_xlat2.x = u_xlat7.x * u_xlat2.x;
    u_xlat4 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.x = u_xlat4.x * 0.227027029 + u_xlat2.x;
    u_xlat4 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat9.xyz = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = dot(u_xlat3.xyz, u_xlat9.xyz);
    u_xlat12 = u_xlat12 + -0.800000012;
    u_xlat12 = u_xlat12 * 5.00000048;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat17 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat17;
    u_xlat17 = u_xlat12 * 0.31621623;
    u_xlat7.x = u_xlat12 * 0.31621623 + u_xlat7.x;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x + -0.800000012;
    u_xlat6.x = u_xlat6.x * 5.00000048;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat11 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * 0.0702702701;
    u_xlat6.x = u_xlat6.x * 0.0702702701 + u_xlat7.x;
    u_xlat1.x = u_xlat1.x * u_xlat11 + u_xlat2.x;
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat10 = u_xlat5.x * 0.0702702701;
    u_xlat5.x = u_xlat5.x * 0.0702702701 + u_xlat6.x;
    u_xlat5.x = u_xlat5.x + 0.227027029;
    u_xlat0.x = u_xlat0.x * u_xlat10 + u_xlat1.x;
    SV_Target0.x = u_xlat0.x / u_xlat5.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 382
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %37 %104 %137 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 37 
                                             OpDecorate %70 DescriptorSet 70 
                                             OpDecorate %70 Binding 70 
                                             OpDecorate %74 DescriptorSet 74 
                                             OpDecorate %74 Binding 74 
                                             OpDecorate %99 DescriptorSet 99 
                                             OpDecorate %99 Binding 99 
                                             OpDecorate %101 DescriptorSet 101 
                                             OpDecorate %101 Binding 101 
                                             OpDecorate vs_TEXCOORD1 Location 104 
                                             OpDecorate %137 Location 137 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %6 %7 
                                     %11 = OpTypePointer Uniform %10 
       Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeInt 32 0 
                                 u32 %16 = OpConstant 0 
                                     %17 = OpTypePointer Uniform %6 
                                     %20 = OpTypePointer Private %6 
                                 f32 %22 = OpConstant 3.674022E-40 
                                 u32 %23 = OpConstant 1 
                      Private f32_4* %25 = OpVariable Private 
                                 f32 %29 = OpConstant 3.674022E-40 
                                 f32 %30 = OpConstant 3.674022E-40 
                                 f32 %31 = OpConstant 3.674022E-40 
                                 f32 %32 = OpConstant 3.674022E-40 
                               f32_4 %33 = OpConstantComposite %29 %30 %31 %32 
                                     %35 = OpTypeVector %6 2 
                                     %36 = OpTypePointer Input %35 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %42 = OpConstant 3.674022E-40 
                                 i32 %57 = OpConstant 0 
                      Private f32_4* %67 = OpVariable Private 
                                     %68 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %69 = OpTypePointer UniformConstant %68 
UniformConstant read_only Texture2D* %70 = OpVariable UniformConstant 
                                     %72 = OpTypeSampler 
                                     %73 = OpTypePointer UniformConstant %72 
            UniformConstant sampler* %74 = OpVariable UniformConstant 
                                     %76 = OpTypeSampledImage %68 
                                     %87 = OpTypeVector %6 3 
                                     %88 = OpTypePointer Private %87 
                      Private f32_3* %89 = OpVariable Private 
                                 f32 %92 = OpConstant 3.674022E-40 
                               f32_3 %93 = OpConstantComposite %92 %92 %92 
                                 f32 %95 = OpConstant 3.674022E-40 
                               f32_3 %96 = OpConstantComposite %95 %95 %95 
                      Private f32_3* %98 = OpVariable Private 
UniformConstant read_only Texture2D* %99 = OpVariable UniformConstant 
           UniformConstant sampler* %101 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                f32 %109 = OpConstant 3.674022E-40 
                              f32_3 %110 = OpConstantComposite %109 %109 %22 
                                f32 %112 = OpConstant 3.674022E-40 
                              f32_3 %113 = OpConstantComposite %112 %112 %42 
                       Private f32* %115 = OpVariable Private 
                     Private f32_3* %121 = OpVariable Private 
                                u32 %131 = OpConstant 2 
                              f32_3 %134 = OpConstantComposite %42 %42 %95 
                                    %136 = OpTypePointer Output %7 
                      Output f32_4* %137 = OpVariable Output 
                                f32 %139 = OpConstant 3.674022E-40 
                                f32 %140 = OpConstant 3.674022E-40 
                              f32_3 %141 = OpConstantComposite %139 %139 %140 
                              f32_3 %143 = OpConstantComposite %139 %139 %139 
                                f32 %153 = OpConstant 3.674022E-40 
                                f32 %158 = OpConstant 3.674022E-40 
                       Private f32* %165 = OpVariable Private 
                                f32 %168 = OpConstant 3.674022E-40 
                                f32 %170 = OpConstant 3.674022E-40 
                                f32 %185 = OpConstant 3.674022E-40 
                                f32 %201 = OpConstant 3.674022E-40 
                     Private f32_4* %207 = OpVariable Private 
                       Private f32* %233 = OpVariable Private 
                     Private f32_3* %259 = OpVariable Private 
                       Private f32* %280 = OpVariable Private 
                                f32 %298 = OpConstant 3.674022E-40 
                     Private f32_3* %315 = OpVariable Private 
                       Private f32* %336 = OpVariable Private 
                                    %379 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                 f32 %19 = OpLoad %18 
                        Private f32* %21 = OpAccessChain %9 %16 
                                             OpStore %21 %19 
                        Private f32* %24 = OpAccessChain %9 %23 
                                             OpStore %24 %22 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFNegate %27 
                               f32_4 %34 = OpFMul %28 %33 
                               f32_2 %38 = OpLoad vs_TEXCOORD0 
                               f32_4 %39 = OpVectorShuffle %38 %38 0 1 0 1 
                               f32_4 %40 = OpFAdd %34 %39 
                                             OpStore %25 %40 
                               f32_4 %41 = OpLoad %25 
                               f32_4 %43 = OpCompositeConstruct %22 %22 %22 %22 
                               f32_4 %44 = OpCompositeConstruct %42 %42 %42 %42 
                               f32_4 %45 = OpExtInst %1 43 %41 %43 %44 
                                             OpStore %25 %45 
                               f32_4 %46 = OpLoad %9 
                               f32_4 %47 = OpVectorShuffle %46 %46 0 1 0 1 
                               f32_4 %48 = OpFMul %47 %33 
                               f32_2 %49 = OpLoad vs_TEXCOORD0 
                               f32_4 %50 = OpVectorShuffle %49 %49 0 1 0 1 
                               f32_4 %51 = OpFAdd %48 %50 
                                             OpStore %9 %51 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpCompositeConstruct %22 %22 %22 %22 
                               f32_4 %54 = OpCompositeConstruct %42 %42 %42 %42 
                               f32_4 %55 = OpExtInst %1 43 %52 %53 %54 
                                             OpStore %9 %55 
                               f32_4 %56 = OpLoad %9 
                        Uniform f32* %58 = OpAccessChain %12 %57 
                                 f32 %59 = OpLoad %58 
                               f32_4 %60 = OpCompositeConstruct %59 %59 %59 %59 
                               f32_4 %61 = OpFMul %56 %60 
                                             OpStore %9 %61 
                               f32_4 %62 = OpLoad %25 
                        Uniform f32* %63 = OpAccessChain %12 %57 
                                 f32 %64 = OpLoad %63 
                               f32_4 %65 = OpCompositeConstruct %64 %64 %64 %64 
                               f32_4 %66 = OpFMul %62 %65 
                                             OpStore %25 %66 
                 read_only Texture2D %71 = OpLoad %70 
                             sampler %75 = OpLoad %74 
          read_only Texture2DSampled %77 = OpSampledImage %71 %75 
                               f32_4 %78 = OpLoad %25 
                               f32_2 %79 = OpVectorShuffle %78 %78 0 1 
                               f32_4 %80 = OpImageSampleImplicitLod %77 %79 
                                             OpStore %67 %80 
                 read_only Texture2D %81 = OpLoad %70 
                             sampler %82 = OpLoad %74 
          read_only Texture2DSampled %83 = OpSampledImage %81 %82 
                               f32_4 %84 = OpLoad %25 
                               f32_2 %85 = OpVectorShuffle %84 %84 2 3 
                               f32_4 %86 = OpImageSampleImplicitLod %83 %85 
                                             OpStore %25 %86 
                               f32_4 %90 = OpLoad %67 
                               f32_3 %91 = OpVectorShuffle %90 %90 1 2 3 
                               f32_3 %94 = OpFMul %91 %93 
                               f32_3 %97 = OpFAdd %94 %96 
                                             OpStore %89 %97 
                read_only Texture2D %100 = OpLoad %99 
                            sampler %102 = OpLoad %101 
         read_only Texture2DSampled %103 = OpSampledImage %100 %102 
                              f32_2 %105 = OpLoad vs_TEXCOORD1 
                              f32_4 %106 = OpImageSampleImplicitLod %103 %105 
                              f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                             OpStore %98 %107 
                              f32_3 %108 = OpLoad %98 
                              f32_3 %111 = OpFMul %108 %110 
                              f32_3 %114 = OpFAdd %111 %113 
                                             OpStore %98 %114 
                              f32_3 %116 = OpLoad %98 
                              f32_3 %117 = OpLoad %98 
                                f32 %118 = OpDot %116 %117 
                                             OpStore %115 %118 
                                f32 %119 = OpLoad %115 
                                f32 %120 = OpFDiv %92 %119 
                                             OpStore %115 %120 
                              f32_3 %122 = OpLoad %98 
                              f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                f32 %124 = OpLoad %115 
                              f32_2 %125 = OpCompositeConstruct %124 %124 
                              f32_2 %126 = OpFMul %123 %125 
                              f32_3 %127 = OpLoad %121 
                              f32_3 %128 = OpVectorShuffle %127 %126 3 4 2 
                                             OpStore %121 %128 
                                f32 %129 = OpLoad %115 
                                f32 %130 = OpFAdd %129 %95 
                       Private f32* %132 = OpAccessChain %121 %131 
                                             OpStore %132 %130 
                              f32_3 %133 = OpLoad %121 
                              f32_3 %135 = OpFMul %133 %134 
                                             OpStore %98 %135 
                              f32_3 %138 = OpLoad %121 
                              f32_3 %142 = OpFMul %138 %141 
                              f32_3 %144 = OpFAdd %142 %143 
                              f32_4 %145 = OpLoad %137 
                              f32_4 %146 = OpVectorShuffle %145 %144 0 4 5 6 
                                             OpStore %137 %146 
                              f32_3 %147 = OpLoad %98 
                              f32_3 %148 = OpLoad %89 
                                f32 %149 = OpDot %147 %148 
                       Private f32* %150 = OpAccessChain %89 %16 
                                             OpStore %150 %149 
                       Private f32* %151 = OpAccessChain %89 %16 
                                f32 %152 = OpLoad %151 
                                f32 %154 = OpFAdd %152 %153 
                       Private f32* %155 = OpAccessChain %89 %16 
                                             OpStore %155 %154 
                       Private f32* %156 = OpAccessChain %89 %16 
                                f32 %157 = OpLoad %156 
                                f32 %159 = OpFMul %157 %158 
                       Private f32* %160 = OpAccessChain %89 %16 
                                             OpStore %160 %159 
                       Private f32* %161 = OpAccessChain %89 %16 
                                f32 %162 = OpLoad %161 
                                f32 %163 = OpExtInst %1 43 %162 %22 %42 
                       Private f32* %164 = OpAccessChain %89 %16 
                                             OpStore %164 %163 
                       Private f32* %166 = OpAccessChain %89 %16 
                                f32 %167 = OpLoad %166 
                                f32 %169 = OpFMul %167 %168 
                                f32 %171 = OpFAdd %169 %170 
                                             OpStore %165 %171 
                       Private f32* %172 = OpAccessChain %89 %16 
                                f32 %173 = OpLoad %172 
                       Private f32* %174 = OpAccessChain %89 %16 
                                f32 %175 = OpLoad %174 
                                f32 %176 = OpFMul %173 %175 
                       Private f32* %177 = OpAccessChain %89 %16 
                                             OpStore %177 %176 
                       Private f32* %178 = OpAccessChain %89 %16 
                                f32 %179 = OpLoad %178 
                                f32 %180 = OpLoad %165 
                                f32 %181 = OpFMul %179 %180 
                       Private f32* %182 = OpAccessChain %89 %16 
                                             OpStore %182 %181 
                       Private f32* %183 = OpAccessChain %89 %16 
                                f32 %184 = OpLoad %183 
                                f32 %186 = OpFMul %184 %185 
                       Private f32* %187 = OpAccessChain %89 %16 
                                             OpStore %187 %186 
                       Private f32* %188 = OpAccessChain %89 %16 
                                f32 %189 = OpLoad %188 
                       Private f32* %190 = OpAccessChain %67 %16 
                                f32 %191 = OpLoad %190 
                                f32 %192 = OpFMul %189 %191 
                       Private f32* %193 = OpAccessChain %67 %16 
                                             OpStore %193 %192 
                read_only Texture2D %194 = OpLoad %70 
                            sampler %195 = OpLoad %74 
         read_only Texture2DSampled %196 = OpSampledImage %194 %195 
                              f32_2 %197 = OpLoad vs_TEXCOORD1 
                              f32_4 %198 = OpImageSampleImplicitLod %196 %197 
                                f32 %199 = OpCompositeExtract %198 0 
                                             OpStore %165 %199 
                                f32 %200 = OpLoad %165 
                                f32 %202 = OpFMul %200 %201 
                       Private f32* %203 = OpAccessChain %67 %16 
                                f32 %204 = OpLoad %203 
                                f32 %205 = OpFAdd %202 %204 
                       Private f32* %206 = OpAccessChain %67 %16 
                                             OpStore %206 %205 
                read_only Texture2D %208 = OpLoad %70 
                            sampler %209 = OpLoad %74 
         read_only Texture2DSampled %210 = OpSampledImage %208 %209 
                              f32_4 %211 = OpLoad %9 
                              f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                              f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                             OpStore %207 %213 
                read_only Texture2D %214 = OpLoad %70 
                            sampler %215 = OpLoad %74 
         read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                              f32_4 %217 = OpLoad %9 
                              f32_2 %218 = OpVectorShuffle %217 %217 2 3 
                              f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                                             OpStore %9 %219 
                              f32_4 %220 = OpLoad %207 
                              f32_3 %221 = OpVectorShuffle %220 %220 1 2 3 
                              f32_3 %222 = OpFMul %221 %93 
                              f32_3 %223 = OpFAdd %222 %96 
                                             OpStore %121 %223 
                              f32_3 %224 = OpLoad %98 
                              f32_3 %225 = OpLoad %121 
                                f32 %226 = OpDot %224 %225 
                                             OpStore %165 %226 
                                f32 %227 = OpLoad %165 
                                f32 %228 = OpFAdd %227 %153 
                                             OpStore %165 %228 
                                f32 %229 = OpLoad %165 
                                f32 %230 = OpFMul %229 %158 
                                             OpStore %165 %230 
                                f32 %231 = OpLoad %165 
                                f32 %232 = OpExtInst %1 43 %231 %22 %42 
                                             OpStore %165 %232 
                                f32 %234 = OpLoad %165 
                                f32 %235 = OpFMul %234 %168 
                                f32 %236 = OpFAdd %235 %170 
                                             OpStore %233 %236 
                                f32 %237 = OpLoad %165 
                                f32 %238 = OpLoad %165 
                                f32 %239 = OpFMul %237 %238 
                                             OpStore %165 %239 
                                f32 %240 = OpLoad %165 
                                f32 %241 = OpLoad %233 
                                f32 %242 = OpFMul %240 %241 
                                             OpStore %165 %242 
                                f32 %243 = OpLoad %165 
                                f32 %244 = OpFMul %243 %185 
                                             OpStore %233 %244 
                                f32 %245 = OpLoad %165 
                                f32 %246 = OpFMul %245 %185 
                       Private f32* %247 = OpAccessChain %89 %16 
                                f32 %248 = OpLoad %247 
                                f32 %249 = OpFAdd %246 %248 
                       Private f32* %250 = OpAccessChain %89 %16 
                                             OpStore %250 %249 
                       Private f32* %251 = OpAccessChain %207 %16 
                                f32 %252 = OpLoad %251 
                                f32 %253 = OpLoad %233 
                                f32 %254 = OpFMul %252 %253 
                       Private f32* %255 = OpAccessChain %67 %16 
                                f32 %256 = OpLoad %255 
                                f32 %257 = OpFAdd %254 %256 
                       Private f32* %258 = OpAccessChain %67 %16 
                                             OpStore %258 %257 
                              f32_4 %260 = OpLoad %25 
                              f32_3 %261 = OpVectorShuffle %260 %260 1 2 3 
                              f32_3 %262 = OpFMul %261 %93 
                              f32_3 %263 = OpFAdd %262 %96 
                                             OpStore %259 %263 
                              f32_3 %264 = OpLoad %98 
                              f32_3 %265 = OpLoad %259 
                                f32 %266 = OpDot %264 %265 
                       Private f32* %267 = OpAccessChain %259 %16 
                                             OpStore %267 %266 
                       Private f32* %268 = OpAccessChain %259 %16 
                                f32 %269 = OpLoad %268 
                                f32 %270 = OpFAdd %269 %153 
                       Private f32* %271 = OpAccessChain %259 %16 
                                             OpStore %271 %270 
                       Private f32* %272 = OpAccessChain %259 %16 
                                f32 %273 = OpLoad %272 
                                f32 %274 = OpFMul %273 %158 
                       Private f32* %275 = OpAccessChain %259 %16 
                                             OpStore %275 %274 
                       Private f32* %276 = OpAccessChain %259 %16 
                                f32 %277 = OpLoad %276 
                                f32 %278 = OpExtInst %1 43 %277 %22 %42 
                       Private f32* %279 = OpAccessChain %259 %16 
                                             OpStore %279 %278 
                       Private f32* %281 = OpAccessChain %259 %16 
                                f32 %282 = OpLoad %281 
                                f32 %283 = OpFMul %282 %168 
                                f32 %284 = OpFAdd %283 %170 
                                             OpStore %280 %284 
                       Private f32* %285 = OpAccessChain %259 %16 
                                f32 %286 = OpLoad %285 
                       Private f32* %287 = OpAccessChain %259 %16 
                                f32 %288 = OpLoad %287 
                                f32 %289 = OpFMul %286 %288 
                       Private f32* %290 = OpAccessChain %259 %16 
                                             OpStore %290 %289 
                       Private f32* %291 = OpAccessChain %259 %16 
                                f32 %292 = OpLoad %291 
                                f32 %293 = OpLoad %280 
                                f32 %294 = OpFMul %292 %293 
                       Private f32* %295 = OpAccessChain %259 %16 
                                             OpStore %295 %294 
                       Private f32* %296 = OpAccessChain %259 %16 
                                f32 %297 = OpLoad %296 
                                f32 %299 = OpFMul %297 %298 
                                             OpStore %280 %299 
                       Private f32* %300 = OpAccessChain %259 %16 
                                f32 %301 = OpLoad %300 
                                f32 %302 = OpFMul %301 %298 
                       Private f32* %303 = OpAccessChain %89 %16 
                                f32 %304 = OpLoad %303 
                                f32 %305 = OpFAdd %302 %304 
                       Private f32* %306 = OpAccessChain %259 %16 
                                             OpStore %306 %305 
                       Private f32* %307 = OpAccessChain %25 %16 
                                f32 %308 = OpLoad %307 
                                f32 %309 = OpLoad %280 
                                f32 %310 = OpFMul %308 %309 
                       Private f32* %311 = OpAccessChain %67 %16 
                                f32 %312 = OpLoad %311 
                                f32 %313 = OpFAdd %310 %312 
                       Private f32* %314 = OpAccessChain %25 %16 
                                             OpStore %314 %313 
                              f32_4 %316 = OpLoad %9 
                              f32_3 %317 = OpVectorShuffle %316 %316 1 2 3 
                              f32_3 %318 = OpFMul %317 %93 
                              f32_3 %319 = OpFAdd %318 %96 
                                             OpStore %315 %319 
                              f32_3 %320 = OpLoad %98 
                              f32_3 %321 = OpLoad %315 
                                f32 %322 = OpDot %320 %321 
                       Private f32* %323 = OpAccessChain %315 %16 
                                             OpStore %323 %322 
                       Private f32* %324 = OpAccessChain %315 %16 
                                f32 %325 = OpLoad %324 
                                f32 %326 = OpFAdd %325 %153 
                       Private f32* %327 = OpAccessChain %315 %16 
                                             OpStore %327 %326 
                       Private f32* %328 = OpAccessChain %315 %16 
                                f32 %329 = OpLoad %328 
                                f32 %330 = OpFMul %329 %158 
                       Private f32* %331 = OpAccessChain %315 %16 
                                             OpStore %331 %330 
                       Private f32* %332 = OpAccessChain %315 %16 
                                f32 %333 = OpLoad %332 
                                f32 %334 = OpExtInst %1 43 %333 %22 %42 
                       Private f32* %335 = OpAccessChain %315 %16 
                                             OpStore %335 %334 
                       Private f32* %337 = OpAccessChain %315 %16 
                                f32 %338 = OpLoad %337 
                                f32 %339 = OpFMul %338 %168 
                                f32 %340 = OpFAdd %339 %170 
                                             OpStore %336 %340 
                       Private f32* %341 = OpAccessChain %315 %16 
                                f32 %342 = OpLoad %341 
                       Private f32* %343 = OpAccessChain %315 %16 
                                f32 %344 = OpLoad %343 
                                f32 %345 = OpFMul %342 %344 
                       Private f32* %346 = OpAccessChain %315 %16 
                                             OpStore %346 %345 
                       Private f32* %347 = OpAccessChain %315 %16 
                                f32 %348 = OpLoad %347 
                                f32 %349 = OpLoad %336 
                                f32 %350 = OpFMul %348 %349 
                       Private f32* %351 = OpAccessChain %315 %16 
                                             OpStore %351 %350 
                       Private f32* %352 = OpAccessChain %315 %16 
                                f32 %353 = OpLoad %352 
                                f32 %354 = OpFMul %353 %298 
                                             OpStore %336 %354 
                       Private f32* %355 = OpAccessChain %315 %16 
                                f32 %356 = OpLoad %355 
                                f32 %357 = OpFMul %356 %298 
                       Private f32* %358 = OpAccessChain %259 %16 
                                f32 %359 = OpLoad %358 
                                f32 %360 = OpFAdd %357 %359 
                       Private f32* %361 = OpAccessChain %315 %16 
                                             OpStore %361 %360 
                       Private f32* %362 = OpAccessChain %315 %16 
                                f32 %363 = OpLoad %362 
                                f32 %364 = OpFAdd %363 %201 
                       Private f32* %365 = OpAccessChain %315 %16 
                                             OpStore %365 %364 
                       Private f32* %366 = OpAccessChain %9 %16 
                                f32 %367 = OpLoad %366 
                                f32 %368 = OpLoad %336 
                                f32 %369 = OpFMul %367 %368 
                       Private f32* %370 = OpAccessChain %25 %16 
                                f32 %371 = OpLoad %370 
                                f32 %372 = OpFAdd %369 %371 
                       Private f32* %373 = OpAccessChain %9 %16 
                                             OpStore %373 %372 
                       Private f32* %374 = OpAccessChain %9 %16 
                                f32 %375 = OpLoad %374 
                       Private f32* %376 = OpAccessChain %315 %16 
                                f32 %377 = OpLoad %376 
                                f32 %378 = OpFDiv %375 %377 
                        Output f32* %380 = OpAccessChain %137 %16 
                                             OpStore %380 %378 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 224990
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraGBufferTexture2;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
float u_xlat12;
float u_xlat13;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb15 = u_xlat15!=0.0;
    u_xlat15 = (u_xlatb15) ? -1.0 : -0.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat15);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat1.x = _MainTex_TexelSize.x;
    u_xlat1.y = 0.0;
    u_xlat2 = (-u_xlat1.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat1 = u_xlat1.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat3 = texture(_MainTex, u_xlat2.xy);
    u_xlat2 = texture(_MainTex, u_xlat2.zw);
    u_xlat8.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat15 = u_xlat15 + -0.800000012;
    u_xlat15 = u_xlat15 * 5.00000048;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat8.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat8.x;
    u_xlat15 = u_xlat15 * 0.31621623;
    u_xlat3.x = u_xlat15 * u_xlat3.x;
    u_xlat4 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat3.x = u_xlat4.x * 0.227027029 + u_xlat3.x;
    u_xlat4 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat8.xyz = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat8.xyz);
    u_xlat8.x = u_xlat8.x + -0.800000012;
    u_xlat8.x = u_xlat8.x * 5.00000048;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat13 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat13;
    u_xlat13 = u_xlat8.x * 0.31621623;
    u_xlat15 = u_xlat8.x * 0.31621623 + u_xlat15;
    u_xlat3.x = u_xlat4.x * u_xlat13 + u_xlat3.x;
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat12 = u_xlat7.x * 0.0702702701;
    u_xlat15 = u_xlat7.x * 0.0702702701 + u_xlat15;
    u_xlat2.x = u_xlat2.x * u_xlat12 + u_xlat3.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat6.xyz);
    SV_Target0.yzw = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.x = u_xlat6.x + -0.800000012;
    u_xlat0.x = u_xlat0.x * 5.00000048;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat5;
    u_xlat5 = u_xlat0.x * 0.0702702701;
    u_xlat0.x = u_xlat0.x * 0.0702702701 + u_xlat15;
    u_xlat0.x = u_xlat0.x + 0.227027029;
    u_xlat5 = u_xlat1.x * u_xlat5 + u_xlat2.x;
    SV_Target0.x = u_xlat5 / u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 410
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %22 %115 %346 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate %12 DescriptorSet 12 
                                                OpDecorate %12 Binding 12 
                                                OpDecorate %16 DescriptorSet 16 
                                                OpDecorate %16 Binding 16 
                                                OpDecorate vs_TEXCOORD1 Location 22 
                                                OpDecorate %61 ArrayStride 61 
                                                OpMemberDecorate %62 0 Offset 62 
                                                OpMemberDecorate %62 1 Offset 62 
                                                OpMemberDecorate %62 2 Offset 62 
                                                OpDecorate %62 Block 
                                                OpDecorate %64 DescriptorSet 64 
                                                OpDecorate %64 Binding 64 
                                                OpDecorate vs_TEXCOORD0 Location 115 
                                                OpDecorate %145 DescriptorSet 145 
                                                OpDecorate %145 Binding 145 
                                                OpDecorate %147 DescriptorSet 147 
                                                OpDecorate %147 Binding 147 
                                                OpDecorate %346 Location 346 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeFloat 32 
                                         %7 = OpTypeVector %6 4 
                                         %8 = OpTypePointer Private %7 
                          Private f32_4* %9 = OpVariable Private 
                                        %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                        %11 = OpTypePointer UniformConstant %10 
   UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                        %14 = OpTypeSampler 
                                        %15 = OpTypePointer UniformConstant %14 
               UniformConstant sampler* %16 = OpVariable UniformConstant 
                                        %18 = OpTypeSampledImage %10 
                                        %20 = OpTypeVector %6 2 
                                        %21 = OpTypePointer Input %20 
                  Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                        %25 = OpTypeVector %6 3 
                                        %29 = OpTypePointer Private %6 
                           Private f32* %30 = OpVariable Private 
                                        %36 = OpTypeBool 
                                        %37 = OpTypePointer Private %36 
                          Private bool* %38 = OpVariable Private 
                                    f32 %40 = OpConstant 3.674022E-40 
                                    f32 %43 = OpConstant 3.674022E-40 
                                    f32 %44 = OpConstant 3.674022E-40 
                                    f32 %48 = OpConstant 3.674022E-40 
                                  f32_3 %49 = OpConstantComposite %48 %48 %48 
                         Private f32_4* %56 = OpVariable Private 
                                        %59 = OpTypeInt 32 0 
                                    u32 %60 = OpConstant 4 
                                        %61 = OpTypeArray %7 %60 
                                        %62 = OpTypeStruct %61 %6 %7 
                                        %63 = OpTypePointer Uniform %62 
Uniform struct {f32_4[4]; f32; f32_4;}* %64 = OpVariable Uniform 
                                        %65 = OpTypeInt 32 1 
                                    i32 %66 = OpConstant 0 
                                    i32 %67 = OpConstant 1 
                                        %68 = OpTypePointer Uniform %7 
                                    i32 %86 = OpConstant 2 
                                    u32 %98 = OpConstant 0 
                                        %99 = OpTypePointer Uniform %6 
                                   u32 %103 = OpConstant 1 
                        Private f32_4* %105 = OpVariable Private 
                                   f32 %109 = OpConstant 3.674022E-40 
                                   f32 %110 = OpConstant 3.674022E-40 
                                   f32 %111 = OpConstant 3.674022E-40 
                                   f32 %112 = OpConstant 3.674022E-40 
                                 f32_4 %113 = OpConstantComposite %109 %110 %111 %112 
                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                   f32 %120 = OpConstant 3.674022E-40 
                        Private f32_4* %144 = OpVariable Private 
  UniformConstant read_only Texture2D* %145 = OpVariable UniformConstant 
              UniformConstant sampler* %147 = OpVariable UniformConstant 
                                       %159 = OpTypePointer Private %25 
                        Private f32_3* %160 = OpVariable Private 
                                 f32_3 %164 = OpConstantComposite %43 %43 %43 
                                   f32 %171 = OpConstant 3.674022E-40 
                                   f32 %174 = OpConstant 3.674022E-40 
                                   f32 %179 = OpConstant 3.674022E-40 
                                   f32 %181 = OpConstant 3.674022E-40 
                                   f32 %192 = OpConstant 3.674022E-40 
                                   f32 %208 = OpConstant 3.674022E-40 
                        Private f32_4* %214 = OpVariable Private 
                          Private f32* %248 = OpVariable Private 
                        Private f32_3* %280 = OpVariable Private 
                          Private f32* %302 = OpVariable Private 
                                   f32 %320 = OpConstant 3.674022E-40 
                        Private f32_3* %335 = OpVariable Private 
                                       %345 = OpTypePointer Output %7 
                         Output f32_4* %346 = OpVariable Output 
                                   f32 %349 = OpConstant 3.674022E-40 
                                 f32_3 %350 = OpConstantComposite %349 %349 %349 
                          Private f32* %367 = OpVariable Private 
                                       %407 = OpTypePointer Output %6 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                    read_only Texture2D %13 = OpLoad %12 
                                sampler %17 = OpLoad %16 
             read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                  f32_2 %23 = OpLoad vs_TEXCOORD1 
                                  f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                  f32_3 %26 = OpVectorShuffle %24 %24 0 1 2 
                                  f32_4 %27 = OpLoad %9 
                                  f32_4 %28 = OpVectorShuffle %27 %26 4 5 6 3 
                                                OpStore %9 %28 
                                  f32_4 %31 = OpLoad %9 
                                  f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                                  f32_4 %33 = OpLoad %9 
                                  f32_3 %34 = OpVectorShuffle %33 %33 0 1 2 
                                    f32 %35 = OpDot %32 %34 
                                                OpStore %30 %35 
                                    f32 %39 = OpLoad %30 
                                   bool %41 = OpFOrdNotEqual %39 %40 
                                                OpStore %38 %41 
                                   bool %42 = OpLoad %38 
                                    f32 %45 = OpSelect %42 %43 %44 
                                                OpStore %30 %45 
                                  f32_4 %46 = OpLoad %9 
                                  f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                  f32_3 %50 = OpFMul %47 %49 
                                    f32 %51 = OpLoad %30 
                                  f32_3 %52 = OpCompositeConstruct %51 %51 %51 
                                  f32_3 %53 = OpFAdd %50 %52 
                                  f32_4 %54 = OpLoad %9 
                                  f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                                OpStore %9 %55 
                                  f32_4 %57 = OpLoad %9 
                                  f32_3 %58 = OpVectorShuffle %57 %57 1 1 1 
                         Uniform f32_4* %69 = OpAccessChain %64 %66 %67 
                                  f32_4 %70 = OpLoad %69 
                                  f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                  f32_3 %72 = OpFMul %58 %71 
                                  f32_4 %73 = OpLoad %56 
                                  f32_4 %74 = OpVectorShuffle %73 %72 4 5 6 3 
                                                OpStore %56 %74 
                         Uniform f32_4* %75 = OpAccessChain %64 %66 %66 
                                  f32_4 %76 = OpLoad %75 
                                  f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                  f32_4 %78 = OpLoad %9 
                                  f32_3 %79 = OpVectorShuffle %78 %78 0 0 0 
                                  f32_3 %80 = OpFMul %77 %79 
                                  f32_4 %81 = OpLoad %56 
                                  f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                  f32_3 %83 = OpFAdd %80 %82 
                                  f32_4 %84 = OpLoad %9 
                                  f32_4 %85 = OpVectorShuffle %84 %83 4 5 2 6 
                                                OpStore %9 %85 
                         Uniform f32_4* %87 = OpAccessChain %64 %66 %86 
                                  f32_4 %88 = OpLoad %87 
                                  f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                  f32_4 %90 = OpLoad %9 
                                  f32_3 %91 = OpVectorShuffle %90 %90 2 2 2 
                                  f32_3 %92 = OpFMul %89 %91 
                                  f32_4 %93 = OpLoad %9 
                                  f32_3 %94 = OpVectorShuffle %93 %93 0 1 3 
                                  f32_3 %95 = OpFAdd %92 %94 
                                  f32_4 %96 = OpLoad %9 
                                  f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                OpStore %9 %97 
                          Uniform f32* %100 = OpAccessChain %64 %86 %98 
                                   f32 %101 = OpLoad %100 
                          Private f32* %102 = OpAccessChain %56 %98 
                                                OpStore %102 %101 
                          Private f32* %104 = OpAccessChain %56 %103 
                                                OpStore %104 %40 
                                 f32_4 %106 = OpLoad %56 
                                 f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                                 f32_4 %108 = OpFNegate %107 
                                 f32_4 %114 = OpFMul %108 %113 
                                 f32_2 %116 = OpLoad vs_TEXCOORD0 
                                 f32_4 %117 = OpVectorShuffle %116 %116 0 1 0 1 
                                 f32_4 %118 = OpFAdd %114 %117 
                                                OpStore %105 %118 
                                 f32_4 %119 = OpLoad %105 
                                 f32_4 %121 = OpCompositeConstruct %40 %40 %40 %40 
                                 f32_4 %122 = OpCompositeConstruct %120 %120 %120 %120 
                                 f32_4 %123 = OpExtInst %1 43 %119 %121 %122 
                                                OpStore %105 %123 
                                 f32_4 %124 = OpLoad %56 
                                 f32_4 %125 = OpVectorShuffle %124 %124 0 1 0 1 
                                 f32_4 %126 = OpFMul %125 %113 
                                 f32_2 %127 = OpLoad vs_TEXCOORD0 
                                 f32_4 %128 = OpVectorShuffle %127 %127 0 1 0 1 
                                 f32_4 %129 = OpFAdd %126 %128 
                                                OpStore %56 %129 
                                 f32_4 %130 = OpLoad %56 
                                 f32_4 %131 = OpCompositeConstruct %40 %40 %40 %40 
                                 f32_4 %132 = OpCompositeConstruct %120 %120 %120 %120 
                                 f32_4 %133 = OpExtInst %1 43 %130 %131 %132 
                                                OpStore %56 %133 
                                 f32_4 %134 = OpLoad %56 
                          Uniform f32* %135 = OpAccessChain %64 %67 
                                   f32 %136 = OpLoad %135 
                                 f32_4 %137 = OpCompositeConstruct %136 %136 %136 %136 
                                 f32_4 %138 = OpFMul %134 %137 
                                                OpStore %56 %138 
                                 f32_4 %139 = OpLoad %105 
                          Uniform f32* %140 = OpAccessChain %64 %67 
                                   f32 %141 = OpLoad %140 
                                 f32_4 %142 = OpCompositeConstruct %141 %141 %141 %141 
                                 f32_4 %143 = OpFMul %139 %142 
                                                OpStore %105 %143 
                   read_only Texture2D %146 = OpLoad %145 
                               sampler %148 = OpLoad %147 
            read_only Texture2DSampled %149 = OpSampledImage %146 %148 
                                 f32_4 %150 = OpLoad %105 
                                 f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                 f32_4 %152 = OpImageSampleImplicitLod %149 %151 
                                                OpStore %144 %152 
                   read_only Texture2D %153 = OpLoad %145 
                               sampler %154 = OpLoad %147 
            read_only Texture2DSampled %155 = OpSampledImage %153 %154 
                                 f32_4 %156 = OpLoad %105 
                                 f32_2 %157 = OpVectorShuffle %156 %156 2 3 
                                 f32_4 %158 = OpImageSampleImplicitLod %155 %157 
                                                OpStore %105 %158 
                                 f32_4 %161 = OpLoad %144 
                                 f32_3 %162 = OpVectorShuffle %161 %161 1 2 3 
                                 f32_3 %163 = OpFMul %162 %49 
                                 f32_3 %165 = OpFAdd %163 %164 
                                                OpStore %160 %165 
                                 f32_4 %166 = OpLoad %9 
                                 f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                 f32_3 %168 = OpLoad %160 
                                   f32 %169 = OpDot %167 %168 
                                                OpStore %30 %169 
                                   f32 %170 = OpLoad %30 
                                   f32 %172 = OpFAdd %170 %171 
                                                OpStore %30 %172 
                                   f32 %173 = OpLoad %30 
                                   f32 %175 = OpFMul %173 %174 
                                                OpStore %30 %175 
                                   f32 %176 = OpLoad %30 
                                   f32 %177 = OpExtInst %1 43 %176 %40 %120 
                                                OpStore %30 %177 
                                   f32 %178 = OpLoad %30 
                                   f32 %180 = OpFMul %178 %179 
                                   f32 %182 = OpFAdd %180 %181 
                          Private f32* %183 = OpAccessChain %160 %98 
                                                OpStore %183 %182 
                                   f32 %184 = OpLoad %30 
                                   f32 %185 = OpLoad %30 
                                   f32 %186 = OpFMul %184 %185 
                                                OpStore %30 %186 
                                   f32 %187 = OpLoad %30 
                          Private f32* %188 = OpAccessChain %160 %98 
                                   f32 %189 = OpLoad %188 
                                   f32 %190 = OpFMul %187 %189 
                                                OpStore %30 %190 
                                   f32 %191 = OpLoad %30 
                                   f32 %193 = OpFMul %191 %192 
                                                OpStore %30 %193 
                                   f32 %194 = OpLoad %30 
                          Private f32* %195 = OpAccessChain %144 %98 
                                   f32 %196 = OpLoad %195 
                                   f32 %197 = OpFMul %194 %196 
                          Private f32* %198 = OpAccessChain %144 %98 
                                                OpStore %198 %197 
                   read_only Texture2D %199 = OpLoad %145 
                               sampler %200 = OpLoad %147 
            read_only Texture2DSampled %201 = OpSampledImage %199 %200 
                                 f32_2 %202 = OpLoad vs_TEXCOORD1 
                                 f32_4 %203 = OpImageSampleImplicitLod %201 %202 
                                   f32 %204 = OpCompositeExtract %203 0 
                          Private f32* %205 = OpAccessChain %160 %98 
                                                OpStore %205 %204 
                          Private f32* %206 = OpAccessChain %160 %98 
                                   f32 %207 = OpLoad %206 
                                   f32 %209 = OpFMul %207 %208 
                          Private f32* %210 = OpAccessChain %144 %98 
                                   f32 %211 = OpLoad %210 
                                   f32 %212 = OpFAdd %209 %211 
                          Private f32* %213 = OpAccessChain %144 %98 
                                                OpStore %213 %212 
                   read_only Texture2D %215 = OpLoad %145 
                               sampler %216 = OpLoad %147 
            read_only Texture2DSampled %217 = OpSampledImage %215 %216 
                                 f32_4 %218 = OpLoad %56 
                                 f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                 f32_4 %220 = OpImageSampleImplicitLod %217 %219 
                                                OpStore %214 %220 
                   read_only Texture2D %221 = OpLoad %145 
                               sampler %222 = OpLoad %147 
            read_only Texture2DSampled %223 = OpSampledImage %221 %222 
                                 f32_4 %224 = OpLoad %56 
                                 f32_2 %225 = OpVectorShuffle %224 %224 2 3 
                                 f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                OpStore %56 %226 
                                 f32_4 %227 = OpLoad %214 
                                 f32_3 %228 = OpVectorShuffle %227 %227 1 2 3 
                                 f32_3 %229 = OpFMul %228 %49 
                                 f32_3 %230 = OpFAdd %229 %164 
                                                OpStore %160 %230 
                                 f32_4 %231 = OpLoad %9 
                                 f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                 f32_3 %233 = OpLoad %160 
                                   f32 %234 = OpDot %232 %233 
                          Private f32* %235 = OpAccessChain %160 %98 
                                                OpStore %235 %234 
                          Private f32* %236 = OpAccessChain %160 %98 
                                   f32 %237 = OpLoad %236 
                                   f32 %238 = OpFAdd %237 %171 
                          Private f32* %239 = OpAccessChain %160 %98 
                                                OpStore %239 %238 
                          Private f32* %240 = OpAccessChain %160 %98 
                                   f32 %241 = OpLoad %240 
                                   f32 %242 = OpFMul %241 %174 
                          Private f32* %243 = OpAccessChain %160 %98 
                                                OpStore %243 %242 
                          Private f32* %244 = OpAccessChain %160 %98 
                                   f32 %245 = OpLoad %244 
                                   f32 %246 = OpExtInst %1 43 %245 %40 %120 
                          Private f32* %247 = OpAccessChain %160 %98 
                                                OpStore %247 %246 
                          Private f32* %249 = OpAccessChain %160 %98 
                                   f32 %250 = OpLoad %249 
                                   f32 %251 = OpFMul %250 %179 
                                   f32 %252 = OpFAdd %251 %181 
                                                OpStore %248 %252 
                          Private f32* %253 = OpAccessChain %160 %98 
                                   f32 %254 = OpLoad %253 
                          Private f32* %255 = OpAccessChain %160 %98 
                                   f32 %256 = OpLoad %255 
                                   f32 %257 = OpFMul %254 %256 
                          Private f32* %258 = OpAccessChain %160 %98 
                                                OpStore %258 %257 
                          Private f32* %259 = OpAccessChain %160 %98 
                                   f32 %260 = OpLoad %259 
                                   f32 %261 = OpLoad %248 
                                   f32 %262 = OpFMul %260 %261 
                          Private f32* %263 = OpAccessChain %160 %98 
                                                OpStore %263 %262 
                          Private f32* %264 = OpAccessChain %160 %98 
                                   f32 %265 = OpLoad %264 
                                   f32 %266 = OpFMul %265 %192 
                                                OpStore %248 %266 
                          Private f32* %267 = OpAccessChain %160 %98 
                                   f32 %268 = OpLoad %267 
                                   f32 %269 = OpFMul %268 %192 
                                   f32 %270 = OpLoad %30 
                                   f32 %271 = OpFAdd %269 %270 
                                                OpStore %30 %271 
                          Private f32* %272 = OpAccessChain %214 %98 
                                   f32 %273 = OpLoad %272 
                                   f32 %274 = OpLoad %248 
                                   f32 %275 = OpFMul %273 %274 
                          Private f32* %276 = OpAccessChain %144 %98 
                                   f32 %277 = OpLoad %276 
                                   f32 %278 = OpFAdd %275 %277 
                          Private f32* %279 = OpAccessChain %144 %98 
                                                OpStore %279 %278 
                                 f32_4 %281 = OpLoad %105 
                                 f32_3 %282 = OpVectorShuffle %281 %281 1 2 3 
                                 f32_3 %283 = OpFMul %282 %49 
                                 f32_3 %284 = OpFAdd %283 %164 
                                                OpStore %280 %284 
                                 f32_4 %285 = OpLoad %9 
                                 f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                 f32_3 %287 = OpLoad %280 
                                   f32 %288 = OpDot %286 %287 
                          Private f32* %289 = OpAccessChain %280 %98 
                                                OpStore %289 %288 
                          Private f32* %290 = OpAccessChain %280 %98 
                                   f32 %291 = OpLoad %290 
                                   f32 %292 = OpFAdd %291 %171 
                          Private f32* %293 = OpAccessChain %280 %98 
                                                OpStore %293 %292 
                          Private f32* %294 = OpAccessChain %280 %98 
                                   f32 %295 = OpLoad %294 
                                   f32 %296 = OpFMul %295 %174 
                          Private f32* %297 = OpAccessChain %280 %98 
                                                OpStore %297 %296 
                          Private f32* %298 = OpAccessChain %280 %98 
                                   f32 %299 = OpLoad %298 
                                   f32 %300 = OpExtInst %1 43 %299 %40 %120 
                          Private f32* %301 = OpAccessChain %280 %98 
                                                OpStore %301 %300 
                          Private f32* %303 = OpAccessChain %280 %98 
                                   f32 %304 = OpLoad %303 
                                   f32 %305 = OpFMul %304 %179 
                                   f32 %306 = OpFAdd %305 %181 
                                                OpStore %302 %306 
                          Private f32* %307 = OpAccessChain %280 %98 
                                   f32 %308 = OpLoad %307 
                          Private f32* %309 = OpAccessChain %280 %98 
                                   f32 %310 = OpLoad %309 
                                   f32 %311 = OpFMul %308 %310 
                          Private f32* %312 = OpAccessChain %280 %98 
                                                OpStore %312 %311 
                          Private f32* %313 = OpAccessChain %280 %98 
                                   f32 %314 = OpLoad %313 
                                   f32 %315 = OpLoad %302 
                                   f32 %316 = OpFMul %314 %315 
                          Private f32* %317 = OpAccessChain %280 %98 
                                                OpStore %317 %316 
                          Private f32* %318 = OpAccessChain %280 %98 
                                   f32 %319 = OpLoad %318 
                                   f32 %321 = OpFMul %319 %320 
                                                OpStore %302 %321 
                          Private f32* %322 = OpAccessChain %280 %98 
                                   f32 %323 = OpLoad %322 
                                   f32 %324 = OpFMul %323 %320 
                                   f32 %325 = OpLoad %30 
                                   f32 %326 = OpFAdd %324 %325 
                                                OpStore %30 %326 
                          Private f32* %327 = OpAccessChain %105 %98 
                                   f32 %328 = OpLoad %327 
                                   f32 %329 = OpLoad %302 
                                   f32 %330 = OpFMul %328 %329 
                          Private f32* %331 = OpAccessChain %144 %98 
                                   f32 %332 = OpLoad %331 
                                   f32 %333 = OpFAdd %330 %332 
                          Private f32* %334 = OpAccessChain %105 %98 
                                                OpStore %334 %333 
                                 f32_4 %336 = OpLoad %56 
                                 f32_3 %337 = OpVectorShuffle %336 %336 1 2 3 
                                 f32_3 %338 = OpFMul %337 %49 
                                 f32_3 %339 = OpFAdd %338 %164 
                                                OpStore %335 %339 
                                 f32_4 %340 = OpLoad %9 
                                 f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
                                 f32_3 %342 = OpLoad %335 
                                   f32 %343 = OpDot %341 %342 
                          Private f32* %344 = OpAccessChain %335 %98 
                                                OpStore %344 %343 
                                 f32_4 %347 = OpLoad %9 
                                 f32_3 %348 = OpVectorShuffle %347 %347 0 1 2 
                                 f32_3 %351 = OpFMul %348 %350 
                                 f32_3 %352 = OpFAdd %351 %350 
                                 f32_4 %353 = OpLoad %346 
                                 f32_4 %354 = OpVectorShuffle %353 %352 0 4 5 6 
                                                OpStore %346 %354 
                          Private f32* %355 = OpAccessChain %335 %98 
                                   f32 %356 = OpLoad %355 
                                   f32 %357 = OpFAdd %356 %171 
                          Private f32* %358 = OpAccessChain %9 %98 
                                                OpStore %358 %357 
                          Private f32* %359 = OpAccessChain %9 %98 
                                   f32 %360 = OpLoad %359 
                                   f32 %361 = OpFMul %360 %174 
                          Private f32* %362 = OpAccessChain %9 %98 
                                                OpStore %362 %361 
                          Private f32* %363 = OpAccessChain %9 %98 
                                   f32 %364 = OpLoad %363 
                                   f32 %365 = OpExtInst %1 43 %364 %40 %120 
                          Private f32* %366 = OpAccessChain %9 %98 
                                                OpStore %366 %365 
                          Private f32* %368 = OpAccessChain %9 %98 
                                   f32 %369 = OpLoad %368 
                                   f32 %370 = OpFMul %369 %179 
                                   f32 %371 = OpFAdd %370 %181 
                                                OpStore %367 %371 
                          Private f32* %372 = OpAccessChain %9 %98 
                                   f32 %373 = OpLoad %372 
                          Private f32* %374 = OpAccessChain %9 %98 
                                   f32 %375 = OpLoad %374 
                                   f32 %376 = OpFMul %373 %375 
                          Private f32* %377 = OpAccessChain %9 %98 
                                                OpStore %377 %376 
                          Private f32* %378 = OpAccessChain %9 %98 
                                   f32 %379 = OpLoad %378 
                                   f32 %380 = OpLoad %367 
                                   f32 %381 = OpFMul %379 %380 
                          Private f32* %382 = OpAccessChain %9 %98 
                                                OpStore %382 %381 
                          Private f32* %383 = OpAccessChain %9 %98 
                                   f32 %384 = OpLoad %383 
                                   f32 %385 = OpFMul %384 %320 
                                                OpStore %367 %385 
                          Private f32* %386 = OpAccessChain %9 %98 
                                   f32 %387 = OpLoad %386 
                                   f32 %388 = OpFMul %387 %320 
                                   f32 %389 = OpLoad %30 
                                   f32 %390 = OpFAdd %388 %389 
                          Private f32* %391 = OpAccessChain %9 %98 
                                                OpStore %391 %390 
                          Private f32* %392 = OpAccessChain %9 %98 
                                   f32 %393 = OpLoad %392 
                                   f32 %394 = OpFAdd %393 %208 
                          Private f32* %395 = OpAccessChain %9 %98 
                                                OpStore %395 %394 
                          Private f32* %396 = OpAccessChain %56 %98 
                                   f32 %397 = OpLoad %396 
                                   f32 %398 = OpLoad %367 
                                   f32 %399 = OpFMul %397 %398 
                          Private f32* %400 = OpAccessChain %105 %98 
                                   f32 %401 = OpLoad %400 
                                   f32 %402 = OpFAdd %399 %401 
                                                OpStore %367 %402 
                                   f32 %403 = OpLoad %367 
                          Private f32* %404 = OpAccessChain %9 %98 
                                   f32 %405 = OpLoad %404 
                                   f32 %406 = OpFDiv %403 %405 
                           Output f32* %408 = OpAccessChain %346 %98 
                                                OpStore %408 %406 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 267693
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _AOParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
float u_xlat10;
float u_xlat11;
float u_xlat12;
float u_xlat17;
void main()
{
    u_xlat0.x = _MainTex_TexelSize.y / _AOParams.z;
    u_xlat0.y = float(1.38461542);
    u_xlat0.z = float(3.23076916);
    u_xlat1 = vec4(-0.0, -2.76923084, -0.0, -6.46153831) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat0 = vec4(0.0, 2.76923084, 0.0, 6.46153831) * u_xlat0.yxzx + vs_TEXCOORD0.xyxy;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat8.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat7.x = u_xlat7.x * 0.31621623;
    u_xlat2.x = u_xlat7.x * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * 0.227027029 + u_xlat2.x;
    u_xlat4 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat9.xyz = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = dot(u_xlat8.xyz, u_xlat9.xyz);
    u_xlat12 = u_xlat12 + -0.800000012;
    u_xlat12 = u_xlat12 * 5.00000048;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat17 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat17;
    u_xlat17 = u_xlat12 * 0.31621623;
    u_xlat7.x = u_xlat12 * 0.31621623 + u_xlat7.x;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat8.xyz, u_xlat6.xyz);
    u_xlat6.x = u_xlat6.x + -0.800000012;
    u_xlat6.x = u_xlat6.x * 5.00000048;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat11 = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat11;
    u_xlat11 = u_xlat6.x * 0.0702702701;
    u_xlat6.x = u_xlat6.x * 0.0702702701 + u_xlat7.x;
    u_xlat1.x = u_xlat1.x * u_xlat11 + u_xlat2.x;
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat5.xyz);
    SV_Target0.yzw = u_xlat8.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat10 = u_xlat5.x * 0.0702702701;
    u_xlat5.x = u_xlat5.x * 0.0702702701 + u_xlat6.x;
    u_xlat5.x = u_xlat5.x + 0.227027029;
    u_xlat0.x = u_xlat0.x * u_xlat10 + u_xlat1.x;
    SV_Target0.x = u_xlat0.x / u_xlat5.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
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
                                             OpEntryPoint Fragment %4 "main" %42 %111 %293 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpMemberDecorate %10 2 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 42 
                                             OpDecorate %79 DescriptorSet 79 
                                             OpDecorate %79 Binding 79 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate vs_TEXCOORD1 Location 111 
                                             OpDecorate %293 Location 293 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %6 %7 %7 
                                     %11 = OpTypePointer Uniform %10 
Uniform struct {f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeInt 32 0 
                                 u32 %16 = OpConstant 1 
                                     %17 = OpTypePointer Uniform %6 
                                 i32 %20 = OpConstant 2 
                                 u32 %21 = OpConstant 2 
                                 u32 %25 = OpConstant 0 
                                     %26 = OpTypePointer Private %6 
                                 f32 %28 = OpConstant 3.674022E-40 
                                 f32 %30 = OpConstant 3.674022E-40 
                      Private f32_4* %32 = OpVariable Private 
                                 f32 %33 = OpConstant 3.674022E-40 
                                 f32 %34 = OpConstant 3.674022E-40 
                                 f32 %35 = OpConstant 3.674022E-40 
                               f32_4 %36 = OpConstantComposite %33 %34 %33 %35 
                                     %40 = OpTypeVector %6 2 
                                     %41 = OpTypePointer Input %40 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 f32 %52 = OpConstant 3.674022E-40 
                                 f32 %53 = OpConstant 3.674022E-40 
                               f32_4 %54 = OpConstantComposite %47 %52 %47 %53 
                                 i32 %66 = OpConstant 0 
                      Private f32_4* %76 = OpVariable Private 
                                     %77 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %78 = OpTypePointer UniformConstant %77 
UniformConstant read_only Texture2D* %79 = OpVariable UniformConstant 
                                     %81 = OpTypeSampler 
                                     %82 = OpTypePointer UniformConstant %81 
            UniformConstant sampler* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampledImage %77 
                                     %96 = OpTypeVector %6 3 
                                     %97 = OpTypePointer Private %96 
                      Private f32_3* %98 = OpVariable Private 
                                f32 %101 = OpConstant 3.674022E-40 
                              f32_3 %102 = OpConstantComposite %101 %101 %101 
                                f32 %104 = OpConstant 3.674022E-40 
                              f32_3 %105 = OpConstantComposite %104 %104 %104 
                     Private f32_4* %107 = OpVariable Private 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                     Private f32_3* %114 = OpVariable Private 
                                f32 %125 = OpConstant 3.674022E-40 
                                f32 %130 = OpConstant 3.674022E-40 
                       Private f32* %137 = OpVariable Private 
                                f32 %140 = OpConstant 3.674022E-40 
                                f32 %142 = OpConstant 3.674022E-40 
                                f32 %157 = OpConstant 3.674022E-40 
                                f32 %168 = OpConstant 3.674022E-40 
                     Private f32_4* %174 = OpVariable Private 
                     Private f32_3* %187 = OpVariable Private 
                       Private f32* %201 = OpVariable Private 
                     Private f32_3* %227 = OpVariable Private 
                       Private f32* %248 = OpVariable Private 
                                f32 %266 = OpConstant 3.674022E-40 
                     Private f32_3* %283 = OpVariable Private 
                                    %292 = OpTypePointer Output %7 
                      Output f32_4* %293 = OpVariable Output 
                                f32 %295 = OpConstant 3.674022E-40 
                              f32_3 %296 = OpConstantComposite %295 %295 %295 
                       Private f32* %313 = OpVariable Private 
                                    %356 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                        Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                 f32 %19 = OpLoad %18 
                        Uniform f32* %22 = OpAccessChain %12 %20 %21 
                                 f32 %23 = OpLoad %22 
                                 f32 %24 = OpFDiv %19 %23 
                        Private f32* %27 = OpAccessChain %9 %25 
                                             OpStore %27 %24 
                        Private f32* %29 = OpAccessChain %9 %16 
                                             OpStore %29 %28 
                        Private f32* %31 = OpAccessChain %9 %21 
                                             OpStore %31 %30 
                               f32_4 %37 = OpLoad %9 
                               f32_4 %38 = OpVectorShuffle %37 %37 1 0 2 0 
                               f32_4 %39 = OpFMul %36 %38 
                               f32_2 %43 = OpLoad vs_TEXCOORD0 
                               f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
                               f32_4 %45 = OpFAdd %39 %44 
                                             OpStore %32 %45 
                               f32_4 %46 = OpLoad %32 
                               f32_4 %49 = OpCompositeConstruct %47 %47 %47 %47 
                               f32_4 %50 = OpCompositeConstruct %48 %48 %48 %48 
                               f32_4 %51 = OpExtInst %1 43 %46 %49 %50 
                                             OpStore %32 %51 
                               f32_4 %55 = OpLoad %9 
                               f32_4 %56 = OpVectorShuffle %55 %55 1 0 2 0 
                               f32_4 %57 = OpFMul %54 %56 
                               f32_2 %58 = OpLoad vs_TEXCOORD0 
                               f32_4 %59 = OpVectorShuffle %58 %58 0 1 0 1 
                               f32_4 %60 = OpFAdd %57 %59 
                                             OpStore %9 %60 
                               f32_4 %61 = OpLoad %9 
                               f32_4 %62 = OpCompositeConstruct %47 %47 %47 %47 
                               f32_4 %63 = OpCompositeConstruct %48 %48 %48 %48 
                               f32_4 %64 = OpExtInst %1 43 %61 %62 %63 
                                             OpStore %9 %64 
                               f32_4 %65 = OpLoad %9 
                        Uniform f32* %67 = OpAccessChain %12 %66 
                                 f32 %68 = OpLoad %67 
                               f32_4 %69 = OpCompositeConstruct %68 %68 %68 %68 
                               f32_4 %70 = OpFMul %65 %69 
                                             OpStore %9 %70 
                               f32_4 %71 = OpLoad %32 
                        Uniform f32* %72 = OpAccessChain %12 %66 
                                 f32 %73 = OpLoad %72 
                               f32_4 %74 = OpCompositeConstruct %73 %73 %73 %73 
                               f32_4 %75 = OpFMul %71 %74 
                                             OpStore %32 %75 
                 read_only Texture2D %80 = OpLoad %79 
                             sampler %84 = OpLoad %83 
          read_only Texture2DSampled %86 = OpSampledImage %80 %84 
                               f32_4 %87 = OpLoad %32 
                               f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                               f32_4 %89 = OpImageSampleImplicitLod %86 %88 
                                             OpStore %76 %89 
                 read_only Texture2D %90 = OpLoad %79 
                             sampler %91 = OpLoad %83 
          read_only Texture2DSampled %92 = OpSampledImage %90 %91 
                               f32_4 %93 = OpLoad %32 
                               f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                               f32_4 %95 = OpImageSampleImplicitLod %92 %94 
                                             OpStore %32 %95 
                               f32_4 %99 = OpLoad %76 
                              f32_3 %100 = OpVectorShuffle %99 %99 1 2 3 
                              f32_3 %103 = OpFMul %100 %102 
                              f32_3 %106 = OpFAdd %103 %105 
                                             OpStore %98 %106 
                read_only Texture2D %108 = OpLoad %79 
                            sampler %109 = OpLoad %83 
         read_only Texture2DSampled %110 = OpSampledImage %108 %109 
                              f32_2 %112 = OpLoad vs_TEXCOORD1 
                              f32_4 %113 = OpImageSampleImplicitLod %110 %112 
                                             OpStore %107 %113 
                              f32_4 %115 = OpLoad %107 
                              f32_3 %116 = OpVectorShuffle %115 %115 1 2 3 
                              f32_3 %117 = OpFMul %116 %102 
                              f32_3 %118 = OpFAdd %117 %105 
                                             OpStore %114 %118 
                              f32_3 %119 = OpLoad %114 
                              f32_3 %120 = OpLoad %98 
                                f32 %121 = OpDot %119 %120 
                       Private f32* %122 = OpAccessChain %98 %25 
                                             OpStore %122 %121 
                       Private f32* %123 = OpAccessChain %98 %25 
                                f32 %124 = OpLoad %123 
                                f32 %126 = OpFAdd %124 %125 
                       Private f32* %127 = OpAccessChain %98 %25 
                                             OpStore %127 %126 
                       Private f32* %128 = OpAccessChain %98 %25 
                                f32 %129 = OpLoad %128 
                                f32 %131 = OpFMul %129 %130 
                       Private f32* %132 = OpAccessChain %98 %25 
                                             OpStore %132 %131 
                       Private f32* %133 = OpAccessChain %98 %25 
                                f32 %134 = OpLoad %133 
                                f32 %135 = OpExtInst %1 43 %134 %47 %48 
                       Private f32* %136 = OpAccessChain %98 %25 
                                             OpStore %136 %135 
                       Private f32* %138 = OpAccessChain %98 %25 
                                f32 %139 = OpLoad %138 
                                f32 %141 = OpFMul %139 %140 
                                f32 %143 = OpFAdd %141 %142 
                                             OpStore %137 %143 
                       Private f32* %144 = OpAccessChain %98 %25 
                                f32 %145 = OpLoad %144 
                       Private f32* %146 = OpAccessChain %98 %25 
                                f32 %147 = OpLoad %146 
                                f32 %148 = OpFMul %145 %147 
                       Private f32* %149 = OpAccessChain %98 %25 
                                             OpStore %149 %148 
                       Private f32* %150 = OpAccessChain %98 %25 
                                f32 %151 = OpLoad %150 
                                f32 %152 = OpLoad %137 
                                f32 %153 = OpFMul %151 %152 
                       Private f32* %154 = OpAccessChain %98 %25 
                                             OpStore %154 %153 
                       Private f32* %155 = OpAccessChain %98 %25 
                                f32 %156 = OpLoad %155 
                                f32 %158 = OpFMul %156 %157 
                       Private f32* %159 = OpAccessChain %98 %25 
                                             OpStore %159 %158 
                       Private f32* %160 = OpAccessChain %98 %25 
                                f32 %161 = OpLoad %160 
                       Private f32* %162 = OpAccessChain %76 %25 
                                f32 %163 = OpLoad %162 
                                f32 %164 = OpFMul %161 %163 
                       Private f32* %165 = OpAccessChain %76 %25 
                                             OpStore %165 %164 
                       Private f32* %166 = OpAccessChain %107 %25 
                                f32 %167 = OpLoad %166 
                                f32 %169 = OpFMul %167 %168 
                       Private f32* %170 = OpAccessChain %76 %25 
                                f32 %171 = OpLoad %170 
                                f32 %172 = OpFAdd %169 %171 
                       Private f32* %173 = OpAccessChain %76 %25 
                                             OpStore %173 %172 
                read_only Texture2D %175 = OpLoad %79 
                            sampler %176 = OpLoad %83 
         read_only Texture2DSampled %177 = OpSampledImage %175 %176 
                              f32_4 %178 = OpLoad %9 
                              f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                              f32_4 %180 = OpImageSampleImplicitLod %177 %179 
                                             OpStore %174 %180 
                read_only Texture2D %181 = OpLoad %79 
                            sampler %182 = OpLoad %83 
         read_only Texture2DSampled %183 = OpSampledImage %181 %182 
                              f32_4 %184 = OpLoad %9 
                              f32_2 %185 = OpVectorShuffle %184 %184 2 3 
                              f32_4 %186 = OpImageSampleImplicitLod %183 %185 
                                             OpStore %9 %186 
                              f32_4 %188 = OpLoad %174 
                              f32_3 %189 = OpVectorShuffle %188 %188 1 2 3 
                              f32_3 %190 = OpFMul %189 %102 
                              f32_3 %191 = OpFAdd %190 %105 
                                             OpStore %187 %191 
                              f32_3 %192 = OpLoad %114 
                              f32_3 %193 = OpLoad %187 
                                f32 %194 = OpDot %192 %193 
                                             OpStore %137 %194 
                                f32 %195 = OpLoad %137 
                                f32 %196 = OpFAdd %195 %125 
                                             OpStore %137 %196 
                                f32 %197 = OpLoad %137 
                                f32 %198 = OpFMul %197 %130 
                                             OpStore %137 %198 
                                f32 %199 = OpLoad %137 
                                f32 %200 = OpExtInst %1 43 %199 %47 %48 
                                             OpStore %137 %200 
                                f32 %202 = OpLoad %137 
                                f32 %203 = OpFMul %202 %140 
                                f32 %204 = OpFAdd %203 %142 
                                             OpStore %201 %204 
                                f32 %205 = OpLoad %137 
                                f32 %206 = OpLoad %137 
                                f32 %207 = OpFMul %205 %206 
                                             OpStore %137 %207 
                                f32 %208 = OpLoad %137 
                                f32 %209 = OpLoad %201 
                                f32 %210 = OpFMul %208 %209 
                                             OpStore %137 %210 
                                f32 %211 = OpLoad %137 
                                f32 %212 = OpFMul %211 %157 
                                             OpStore %201 %212 
                                f32 %213 = OpLoad %137 
                                f32 %214 = OpFMul %213 %157 
                       Private f32* %215 = OpAccessChain %98 %25 
                                f32 %216 = OpLoad %215 
                                f32 %217 = OpFAdd %214 %216 
                       Private f32* %218 = OpAccessChain %98 %25 
                                             OpStore %218 %217 
                       Private f32* %219 = OpAccessChain %174 %25 
                                f32 %220 = OpLoad %219 
                                f32 %221 = OpLoad %201 
                                f32 %222 = OpFMul %220 %221 
                       Private f32* %223 = OpAccessChain %76 %25 
                                f32 %224 = OpLoad %223 
                                f32 %225 = OpFAdd %222 %224 
                       Private f32* %226 = OpAccessChain %76 %25 
                                             OpStore %226 %225 
                              f32_4 %228 = OpLoad %32 
                              f32_3 %229 = OpVectorShuffle %228 %228 1 2 3 
                              f32_3 %230 = OpFMul %229 %102 
                              f32_3 %231 = OpFAdd %230 %105 
                                             OpStore %227 %231 
                              f32_3 %232 = OpLoad %114 
                              f32_3 %233 = OpLoad %227 
                                f32 %234 = OpDot %232 %233 
                       Private f32* %235 = OpAccessChain %227 %25 
                                             OpStore %235 %234 
                       Private f32* %236 = OpAccessChain %227 %25 
                                f32 %237 = OpLoad %236 
                                f32 %238 = OpFAdd %237 %125 
                       Private f32* %239 = OpAccessChain %227 %25 
                                             OpStore %239 %238 
                       Private f32* %240 = OpAccessChain %227 %25 
                                f32 %241 = OpLoad %240 
                                f32 %242 = OpFMul %241 %130 
                       Private f32* %243 = OpAccessChain %227 %25 
                                             OpStore %243 %242 
                       Private f32* %244 = OpAccessChain %227 %25 
                                f32 %245 = OpLoad %244 
                                f32 %246 = OpExtInst %1 43 %245 %47 %48 
                       Private f32* %247 = OpAccessChain %227 %25 
                                             OpStore %247 %246 
                       Private f32* %249 = OpAccessChain %227 %25 
                                f32 %250 = OpLoad %249 
                                f32 %251 = OpFMul %250 %140 
                                f32 %252 = OpFAdd %251 %142 
                                             OpStore %248 %252 
                       Private f32* %253 = OpAccessChain %227 %25 
                                f32 %254 = OpLoad %253 
                       Private f32* %255 = OpAccessChain %227 %25 
                                f32 %256 = OpLoad %255 
                                f32 %257 = OpFMul %254 %256 
                       Private f32* %258 = OpAccessChain %227 %25 
                                             OpStore %258 %257 
                       Private f32* %259 = OpAccessChain %227 %25 
                                f32 %260 = OpLoad %259 
                                f32 %261 = OpLoad %248 
                                f32 %262 = OpFMul %260 %261 
                       Private f32* %263 = OpAccessChain %227 %25 
                                             OpStore %263 %262 
                       Private f32* %264 = OpAccessChain %227 %25 
                                f32 %265 = OpLoad %264 
                                f32 %267 = OpFMul %265 %266 
                                             OpStore %248 %267 
                       Private f32* %268 = OpAccessChain %227 %25 
                                f32 %269 = OpLoad %268 
                                f32 %270 = OpFMul %269 %266 
                       Private f32* %271 = OpAccessChain %98 %25 
                                f32 %272 = OpLoad %271 
                                f32 %273 = OpFAdd %270 %272 
                       Private f32* %274 = OpAccessChain %227 %25 
                                             OpStore %274 %273 
                       Private f32* %275 = OpAccessChain %32 %25 
                                f32 %276 = OpLoad %275 
                                f32 %277 = OpLoad %248 
                                f32 %278 = OpFMul %276 %277 
                       Private f32* %279 = OpAccessChain %76 %25 
                                f32 %280 = OpLoad %279 
                                f32 %281 = OpFAdd %278 %280 
                       Private f32* %282 = OpAccessChain %32 %25 
                                             OpStore %282 %281 
                              f32_4 %284 = OpLoad %9 
                              f32_3 %285 = OpVectorShuffle %284 %284 1 2 3 
                              f32_3 %286 = OpFMul %285 %102 
                              f32_3 %287 = OpFAdd %286 %105 
                                             OpStore %283 %287 
                              f32_3 %288 = OpLoad %114 
                              f32_3 %289 = OpLoad %283 
                                f32 %290 = OpDot %288 %289 
                       Private f32* %291 = OpAccessChain %283 %25 
                                             OpStore %291 %290 
                              f32_3 %294 = OpLoad %114 
                              f32_3 %297 = OpFMul %294 %296 
                              f32_3 %298 = OpFAdd %297 %296 
                              f32_4 %299 = OpLoad %293 
                              f32_4 %300 = OpVectorShuffle %299 %298 0 4 5 6 
                                             OpStore %293 %300 
                       Private f32* %301 = OpAccessChain %283 %25 
                                f32 %302 = OpLoad %301 
                                f32 %303 = OpFAdd %302 %125 
                       Private f32* %304 = OpAccessChain %283 %25 
                                             OpStore %304 %303 
                       Private f32* %305 = OpAccessChain %283 %25 
                                f32 %306 = OpLoad %305 
                                f32 %307 = OpFMul %306 %130 
                       Private f32* %308 = OpAccessChain %283 %25 
                                             OpStore %308 %307 
                       Private f32* %309 = OpAccessChain %283 %25 
                                f32 %310 = OpLoad %309 
                                f32 %311 = OpExtInst %1 43 %310 %47 %48 
                       Private f32* %312 = OpAccessChain %283 %25 
                                             OpStore %312 %311 
                       Private f32* %314 = OpAccessChain %283 %25 
                                f32 %315 = OpLoad %314 
                                f32 %316 = OpFMul %315 %140 
                                f32 %317 = OpFAdd %316 %142 
                                             OpStore %313 %317 
                       Private f32* %318 = OpAccessChain %283 %25 
                                f32 %319 = OpLoad %318 
                       Private f32* %320 = OpAccessChain %283 %25 
                                f32 %321 = OpLoad %320 
                                f32 %322 = OpFMul %319 %321 
                       Private f32* %323 = OpAccessChain %283 %25 
                                             OpStore %323 %322 
                       Private f32* %324 = OpAccessChain %283 %25 
                                f32 %325 = OpLoad %324 
                                f32 %326 = OpLoad %313 
                                f32 %327 = OpFMul %325 %326 
                       Private f32* %328 = OpAccessChain %283 %25 
                                             OpStore %328 %327 
                       Private f32* %329 = OpAccessChain %283 %25 
                                f32 %330 = OpLoad %329 
                                f32 %331 = OpFMul %330 %266 
                                             OpStore %313 %331 
                       Private f32* %332 = OpAccessChain %283 %25 
                                f32 %333 = OpLoad %332 
                                f32 %334 = OpFMul %333 %266 
                       Private f32* %335 = OpAccessChain %227 %25 
                                f32 %336 = OpLoad %335 
                                f32 %337 = OpFAdd %334 %336 
                       Private f32* %338 = OpAccessChain %283 %25 
                                             OpStore %338 %337 
                       Private f32* %339 = OpAccessChain %283 %25 
                                f32 %340 = OpLoad %339 
                                f32 %341 = OpFAdd %340 %168 
                       Private f32* %342 = OpAccessChain %283 %25 
                                             OpStore %342 %341 
                       Private f32* %343 = OpAccessChain %9 %25 
                                f32 %344 = OpLoad %343 
                                f32 %345 = OpLoad %313 
                                f32 %346 = OpFMul %344 %345 
                       Private f32* %347 = OpAccessChain %32 %25 
                                f32 %348 = OpLoad %347 
                                f32 %349 = OpFAdd %346 %348 
                       Private f32* %350 = OpAccessChain %9 %25 
                                             OpStore %350 %349 
                       Private f32* %351 = OpAccessChain %9 %25 
                                f32 %352 = OpLoad %351 
                       Private f32* %353 = OpAccessChain %283 %25 
                                f32 %354 = OpLoad %353 
                                f32 %355 = OpFDiv %352 %354 
                        Output f32* %357 = OpAccessChain %293 %25 
                                             OpStore %357 %355 
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
 Pass {
  Blend Zero OneMinusSrcColor, Zero OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 343061
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
uniform 	vec3 _AOColor;
uniform 	vec4 _SAOcclusionTexture_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _SAOcclusionTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture(_SAOcclusionTexture, u_xlat0.xy);
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = _SAOcclusionTexture_TexelSize.xy / _AOParams.zz;
    u_xlat2.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
    u_xlat2 = texture(_SAOcclusionTexture, u_xlat2.xy);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat0.x = u_xlat2.x * u_xlat7.x + u_xlat0.x;
    u_xlat1.zw = (-u_xlat1.yx);
    u_xlat3 = u_xlat1.xzwy + vs_TEXCOORD0.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_SAOcclusionTexture, u_xlat1.xy);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(_SAOcclusionTexture, u_xlat3.xy);
    u_xlat3 = texture(_SAOcclusionTexture, u_xlat3.zw);
    u_xlat2.xzw = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat2.xzw);
    u_xlat2.x = u_xlat2.x + -0.800000012;
    u_xlat2.x = u_xlat2.x * 5.00000048;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat12 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat17 = u_xlat2.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat2.x + u_xlat7.x;
    u_xlat0.x = u_xlat4.x * u_xlat17 + u_xlat0.x;
    u_xlat7.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat17 = u_xlat7.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat7.x + u_xlat2.x;
    u_xlat0.x = u_xlat3.x * u_xlat17 + u_xlat0.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat15 = u_xlat5.x * u_xlat10;
    u_xlat5.x = u_xlat10 * u_xlat5.x + u_xlat2.x;
    u_xlat5.x = u_xlat5.x + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    SV_Target0.xyz = u_xlat0.xxx * _AOColor.xyz;
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 402
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %386 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpDecorate vs_TEXCOORD0 Location 12 
                                                    OpMemberDecorate %28 0 Offset 28 
                                                    OpMemberDecorate %28 1 Offset 28 
                                                    OpMemberDecorate %28 2 Offset 28 
                                                    OpMemberDecorate %28 3 Offset 28 
                                                    OpDecorate %28 Block 
                                                    OpDecorate %30 DescriptorSet 30 
                                                    OpDecorate %30 Binding 30 
                                                    OpDecorate %42 DescriptorSet 42 
                                                    OpDecorate %42 Binding 42 
                                                    OpDecorate %46 DescriptorSet 46 
                                                    OpDecorate %46 Binding 46 
                                                    OpDecorate %386 Location 386 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                      Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        f32 %18 = OpConstant 3.674022E-40 
                                        f32 %19 = OpConstant 3.674022E-40 
                                            %27 = OpTypeVector %6 3 
                                            %28 = OpTypeStruct %6 %7 %27 %7 
                                            %29 = OpTypePointer Uniform %28 
Uniform struct {f32; f32_4; f32_3; f32_4;}* %30 = OpVariable Uniform 
                                            %31 = OpTypeInt 32 1 
                                        i32 %32 = OpConstant 0 
                                            %33 = OpTypePointer Uniform %6 
                                            %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %41 = OpTypePointer UniformConstant %40 
       UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
                                            %44 = OpTypeSampler 
                                            %45 = OpTypePointer UniformConstant %44 
                   UniformConstant sampler* %46 = OpVariable UniformConstant 
                                            %48 = OpTypeSampledImage %40 
                                            %53 = OpTypePointer Private %27 
                             Private f32_3* %54 = OpVariable Private 
                                        f32 %57 = OpConstant 3.674022E-40 
                                      f32_3 %58 = OpConstantComposite %57 %57 %57 
                                        f32 %60 = OpConstant 3.674022E-40 
                                      f32_3 %61 = OpConstantComposite %60 %60 %60 
                             Private f32_4* %63 = OpVariable Private 
                                        i32 %64 = OpConstant 3 
                                            %65 = OpTypePointer Uniform %7 
                                        i32 %69 = OpConstant 1 
                             Private f32_4* %76 = OpVariable Private 
                            Private f32_3* %105 = OpVariable Private 
                                           %113 = OpTypeInt 32 0 
                                       u32 %114 = OpConstant 0 
                                           %115 = OpTypePointer Private %6 
                                       f32 %119 = OpConstant 3.674022E-40 
                                       f32 %124 = OpConstant 3.674022E-40 
                              Private f32* %131 = OpVariable Private 
                                       f32 %134 = OpConstant 3.674022E-40 
                                       f32 %136 = OpConstant 3.674022E-40 
                            Private f32_4* %163 = OpVariable Private 
                            Private f32_4* %205 = OpVariable Private 
                              Private f32* %251 = OpVariable Private 
                            Private f32_3* %322 = OpVariable Private 
                              Private f32* %343 = OpVariable Private 
                              Private f32* %354 = OpVariable Private 
                                           %385 = OpTypePointer Output %7 
                             Output f32_4* %386 = OpVariable Output 
                                       i32 %389 = OpConstant 2 
                                           %390 = OpTypePointer Uniform %27 
                                       u32 %398 = OpConstant 3 
                                           %399 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad vs_TEXCOORD0 
                                      f32_4 %14 = OpLoad %9 
                                      f32_4 %15 = OpVectorShuffle %14 %13 4 5 2 3 
                                                    OpStore %9 %15 
                                      f32_4 %16 = OpLoad %9 
                                      f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                      f32_2 %20 = OpCompositeConstruct %18 %18 
                                      f32_2 %21 = OpCompositeConstruct %19 %19 
                                      f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                      f32_4 %23 = OpLoad %9 
                                      f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
                                                    OpStore %9 %24 
                                      f32_4 %25 = OpLoad %9 
                                      f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                               Uniform f32* %34 = OpAccessChain %30 %32 
                                        f32 %35 = OpLoad %34 
                                      f32_2 %36 = OpCompositeConstruct %35 %35 
                                      f32_2 %37 = OpFMul %26 %36 
                                      f32_4 %38 = OpLoad %9 
                                      f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                    OpStore %9 %39 
                        read_only Texture2D %43 = OpLoad %42 
                                    sampler %47 = OpLoad %46 
                 read_only Texture2DSampled %49 = OpSampledImage %43 %47 
                                      f32_4 %50 = OpLoad %9 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                                                    OpStore %9 %52 
                                      f32_4 %55 = OpLoad %9 
                                      f32_3 %56 = OpVectorShuffle %55 %55 1 2 3 
                                      f32_3 %59 = OpFMul %56 %58 
                                      f32_3 %62 = OpFAdd %59 %61 
                                                    OpStore %54 %62 
                             Uniform f32_4* %66 = OpAccessChain %30 %64 
                                      f32_4 %67 = OpLoad %66 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                             Uniform f32_4* %70 = OpAccessChain %30 %69 
                                      f32_4 %71 = OpLoad %70 
                                      f32_2 %72 = OpVectorShuffle %71 %71 2 2 
                                      f32_2 %73 = OpFDiv %68 %72 
                                      f32_4 %74 = OpLoad %63 
                                      f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                                    OpStore %63 %75 
                                      f32_4 %77 = OpLoad %63 
                                      f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                      f32_2 %79 = OpFNegate %78 
                                      f32_2 %80 = OpLoad vs_TEXCOORD0 
                                      f32_2 %81 = OpFAdd %79 %80 
                                      f32_4 %82 = OpLoad %76 
                                      f32_4 %83 = OpVectorShuffle %82 %81 4 5 2 3 
                                                    OpStore %76 %83 
                                      f32_4 %84 = OpLoad %76 
                                      f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                      f32_2 %86 = OpCompositeConstruct %18 %18 
                                      f32_2 %87 = OpCompositeConstruct %19 %19 
                                      f32_2 %88 = OpExtInst %1 43 %85 %86 %87 
                                      f32_4 %89 = OpLoad %76 
                                      f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                    OpStore %76 %90 
                                      f32_4 %91 = OpLoad %76 
                                      f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                               Uniform f32* %93 = OpAccessChain %30 %32 
                                        f32 %94 = OpLoad %93 
                                      f32_2 %95 = OpCompositeConstruct %94 %94 
                                      f32_2 %96 = OpFMul %92 %95 
                                      f32_4 %97 = OpLoad %76 
                                      f32_4 %98 = OpVectorShuffle %97 %96 4 5 2 3 
                                                    OpStore %76 %98 
                        read_only Texture2D %99 = OpLoad %42 
                                   sampler %100 = OpLoad %46 
                read_only Texture2DSampled %101 = OpSampledImage %99 %100 
                                     f32_4 %102 = OpLoad %76 
                                     f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                     f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                                    OpStore %76 %104 
                                     f32_4 %106 = OpLoad %76 
                                     f32_3 %107 = OpVectorShuffle %106 %106 1 2 3 
                                     f32_3 %108 = OpFMul %107 %58 
                                     f32_3 %109 = OpFAdd %108 %61 
                                                    OpStore %105 %109 
                                     f32_3 %110 = OpLoad %54 
                                     f32_3 %111 = OpLoad %105 
                                       f32 %112 = OpDot %110 %111 
                              Private f32* %116 = OpAccessChain %105 %114 
                                                    OpStore %116 %112 
                              Private f32* %117 = OpAccessChain %105 %114 
                                       f32 %118 = OpLoad %117 
                                       f32 %120 = OpFAdd %118 %119 
                              Private f32* %121 = OpAccessChain %105 %114 
                                                    OpStore %121 %120 
                              Private f32* %122 = OpAccessChain %105 %114 
                                       f32 %123 = OpLoad %122 
                                       f32 %125 = OpFMul %123 %124 
                              Private f32* %126 = OpAccessChain %105 %114 
                                                    OpStore %126 %125 
                              Private f32* %127 = OpAccessChain %105 %114 
                                       f32 %128 = OpLoad %127 
                                       f32 %129 = OpExtInst %1 43 %128 %18 %19 
                              Private f32* %130 = OpAccessChain %105 %114 
                                                    OpStore %130 %129 
                              Private f32* %132 = OpAccessChain %105 %114 
                                       f32 %133 = OpLoad %132 
                                       f32 %135 = OpFMul %133 %134 
                                       f32 %137 = OpFAdd %135 %136 
                                                    OpStore %131 %137 
                              Private f32* %138 = OpAccessChain %105 %114 
                                       f32 %139 = OpLoad %138 
                              Private f32* %140 = OpAccessChain %105 %114 
                                       f32 %141 = OpLoad %140 
                                       f32 %142 = OpFMul %139 %141 
                              Private f32* %143 = OpAccessChain %105 %114 
                                                    OpStore %143 %142 
                              Private f32* %144 = OpAccessChain %105 %114 
                                       f32 %145 = OpLoad %144 
                                       f32 %146 = OpLoad %131 
                                       f32 %147 = OpFMul %145 %146 
                              Private f32* %148 = OpAccessChain %105 %114 
                                                    OpStore %148 %147 
                              Private f32* %149 = OpAccessChain %76 %114 
                                       f32 %150 = OpLoad %149 
                              Private f32* %151 = OpAccessChain %105 %114 
                                       f32 %152 = OpLoad %151 
                                       f32 %153 = OpFMul %150 %152 
                              Private f32* %154 = OpAccessChain %9 %114 
                                       f32 %155 = OpLoad %154 
                                       f32 %156 = OpFAdd %153 %155 
                              Private f32* %157 = OpAccessChain %9 %114 
                                                    OpStore %157 %156 
                                     f32_4 %158 = OpLoad %63 
                                     f32_2 %159 = OpVectorShuffle %158 %158 1 0 
                                     f32_2 %160 = OpFNegate %159 
                                     f32_4 %161 = OpLoad %63 
                                     f32_4 %162 = OpVectorShuffle %161 %160 0 1 4 5 
                                                    OpStore %63 %162 
                                     f32_4 %164 = OpLoad %63 
                                     f32_4 %165 = OpVectorShuffle %164 %164 0 2 3 1 
                                     f32_2 %166 = OpLoad vs_TEXCOORD0 
                                     f32_4 %167 = OpVectorShuffle %166 %166 0 1 0 1 
                                     f32_4 %168 = OpFAdd %165 %167 
                                                    OpStore %163 %168 
                                     f32_4 %169 = OpLoad %163 
                                     f32_4 %170 = OpCompositeConstruct %18 %18 %18 %18 
                                     f32_4 %171 = OpCompositeConstruct %19 %19 %19 %19 
                                     f32_4 %172 = OpExtInst %1 43 %169 %170 %171 
                                                    OpStore %163 %172 
                                     f32_4 %173 = OpLoad %63 
                                     f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                                     f32_2 %175 = OpLoad vs_TEXCOORD0 
                                     f32_2 %176 = OpFAdd %174 %175 
                                     f32_4 %177 = OpLoad %63 
                                     f32_4 %178 = OpVectorShuffle %177 %176 4 5 2 3 
                                                    OpStore %63 %178 
                                     f32_4 %179 = OpLoad %63 
                                     f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                     f32_2 %181 = OpCompositeConstruct %18 %18 
                                     f32_2 %182 = OpCompositeConstruct %19 %19 
                                     f32_2 %183 = OpExtInst %1 43 %180 %181 %182 
                                     f32_4 %184 = OpLoad %63 
                                     f32_4 %185 = OpVectorShuffle %184 %183 4 5 2 3 
                                                    OpStore %63 %185 
                                     f32_4 %186 = OpLoad %63 
                                     f32_2 %187 = OpVectorShuffle %186 %186 0 1 
                              Uniform f32* %188 = OpAccessChain %30 %32 
                                       f32 %189 = OpLoad %188 
                                     f32_2 %190 = OpCompositeConstruct %189 %189 
                                     f32_2 %191 = OpFMul %187 %190 
                                     f32_4 %192 = OpLoad %63 
                                     f32_4 %193 = OpVectorShuffle %192 %191 4 5 2 3 
                                                    OpStore %63 %193 
                       read_only Texture2D %194 = OpLoad %42 
                                   sampler %195 = OpLoad %46 
                read_only Texture2DSampled %196 = OpSampledImage %194 %195 
                                     f32_4 %197 = OpLoad %63 
                                     f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                     f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                    OpStore %63 %199 
                                     f32_4 %200 = OpLoad %163 
                              Uniform f32* %201 = OpAccessChain %30 %32 
                                       f32 %202 = OpLoad %201 
                                     f32_4 %203 = OpCompositeConstruct %202 %202 %202 %202 
                                     f32_4 %204 = OpFMul %200 %203 
                                                    OpStore %163 %204 
                       read_only Texture2D %206 = OpLoad %42 
                                   sampler %207 = OpLoad %46 
                read_only Texture2DSampled %208 = OpSampledImage %206 %207 
                                     f32_4 %209 = OpLoad %163 
                                     f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                     f32_4 %211 = OpImageSampleImplicitLod %208 %210 
                                                    OpStore %205 %211 
                       read_only Texture2D %212 = OpLoad %42 
                                   sampler %213 = OpLoad %46 
                read_only Texture2DSampled %214 = OpSampledImage %212 %213 
                                     f32_4 %215 = OpLoad %163 
                                     f32_2 %216 = OpVectorShuffle %215 %215 2 3 
                                     f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                    OpStore %163 %217 
                                     f32_4 %218 = OpLoad %205 
                                     f32_3 %219 = OpVectorShuffle %218 %218 1 2 3 
                                     f32_3 %220 = OpFMul %219 %58 
                                     f32_3 %221 = OpFAdd %220 %61 
                                     f32_4 %222 = OpLoad %76 
                                     f32_4 %223 = OpVectorShuffle %222 %221 4 1 5 6 
                                                    OpStore %76 %223 
                                     f32_3 %224 = OpLoad %54 
                                     f32_4 %225 = OpLoad %76 
                                     f32_3 %226 = OpVectorShuffle %225 %225 0 2 3 
                                       f32 %227 = OpDot %224 %226 
                              Private f32* %228 = OpAccessChain %76 %114 
                                                    OpStore %228 %227 
                              Private f32* %229 = OpAccessChain %76 %114 
                                       f32 %230 = OpLoad %229 
                                       f32 %231 = OpFAdd %230 %119 
                              Private f32* %232 = OpAccessChain %76 %114 
                                                    OpStore %232 %231 
                              Private f32* %233 = OpAccessChain %76 %114 
                                       f32 %234 = OpLoad %233 
                                       f32 %235 = OpFMul %234 %124 
                              Private f32* %236 = OpAccessChain %76 %114 
                                                    OpStore %236 %235 
                              Private f32* %237 = OpAccessChain %76 %114 
                                       f32 %238 = OpLoad %237 
                                       f32 %239 = OpExtInst %1 43 %238 %18 %19 
                              Private f32* %240 = OpAccessChain %76 %114 
                                                    OpStore %240 %239 
                              Private f32* %241 = OpAccessChain %76 %114 
                                       f32 %242 = OpLoad %241 
                                       f32 %243 = OpFMul %242 %134 
                                       f32 %244 = OpFAdd %243 %136 
                                                    OpStore %131 %244 
                              Private f32* %245 = OpAccessChain %76 %114 
                                       f32 %246 = OpLoad %245 
                              Private f32* %247 = OpAccessChain %76 %114 
                                       f32 %248 = OpLoad %247 
                                       f32 %249 = OpFMul %246 %248 
                              Private f32* %250 = OpAccessChain %76 %114 
                                                    OpStore %250 %249 
                              Private f32* %252 = OpAccessChain %76 %114 
                                       f32 %253 = OpLoad %252 
                                       f32 %254 = OpLoad %131 
                                       f32 %255 = OpFMul %253 %254 
                                                    OpStore %251 %255 
                                       f32 %256 = OpLoad %131 
                              Private f32* %257 = OpAccessChain %76 %114 
                                       f32 %258 = OpLoad %257 
                                       f32 %259 = OpFMul %256 %258 
                              Private f32* %260 = OpAccessChain %105 %114 
                                       f32 %261 = OpLoad %260 
                                       f32 %262 = OpFAdd %259 %261 
                              Private f32* %263 = OpAccessChain %76 %114 
                                                    OpStore %263 %262 
                              Private f32* %264 = OpAccessChain %205 %114 
                                       f32 %265 = OpLoad %264 
                                       f32 %266 = OpLoad %251 
                                       f32 %267 = OpFMul %265 %266 
                              Private f32* %268 = OpAccessChain %9 %114 
                                       f32 %269 = OpLoad %268 
                                       f32 %270 = OpFAdd %267 %269 
                              Private f32* %271 = OpAccessChain %9 %114 
                                                    OpStore %271 %270 
                                     f32_4 %272 = OpLoad %163 
                                     f32_3 %273 = OpVectorShuffle %272 %272 1 2 3 
                                     f32_3 %274 = OpFMul %273 %58 
                                     f32_3 %275 = OpFAdd %274 %61 
                                                    OpStore %105 %275 
                                     f32_3 %276 = OpLoad %54 
                                     f32_3 %277 = OpLoad %105 
                                       f32 %278 = OpDot %276 %277 
                              Private f32* %279 = OpAccessChain %105 %114 
                                                    OpStore %279 %278 
                              Private f32* %280 = OpAccessChain %105 %114 
                                       f32 %281 = OpLoad %280 
                                       f32 %282 = OpFAdd %281 %119 
                              Private f32* %283 = OpAccessChain %105 %114 
                                                    OpStore %283 %282 
                              Private f32* %284 = OpAccessChain %105 %114 
                                       f32 %285 = OpLoad %284 
                                       f32 %286 = OpFMul %285 %124 
                              Private f32* %287 = OpAccessChain %105 %114 
                                                    OpStore %287 %286 
                              Private f32* %288 = OpAccessChain %105 %114 
                                       f32 %289 = OpLoad %288 
                                       f32 %290 = OpExtInst %1 43 %289 %18 %19 
                              Private f32* %291 = OpAccessChain %105 %114 
                                                    OpStore %291 %290 
                              Private f32* %292 = OpAccessChain %105 %114 
                                       f32 %293 = OpLoad %292 
                                       f32 %294 = OpFMul %293 %134 
                                       f32 %295 = OpFAdd %294 %136 
                                                    OpStore %131 %295 
                              Private f32* %296 = OpAccessChain %105 %114 
                                       f32 %297 = OpLoad %296 
                              Private f32* %298 = OpAccessChain %105 %114 
                                       f32 %299 = OpLoad %298 
                                       f32 %300 = OpFMul %297 %299 
                              Private f32* %301 = OpAccessChain %105 %114 
                                                    OpStore %301 %300 
                              Private f32* %302 = OpAccessChain %105 %114 
                                       f32 %303 = OpLoad %302 
                                       f32 %304 = OpLoad %131 
                                       f32 %305 = OpFMul %303 %304 
                                                    OpStore %251 %305 
                                       f32 %306 = OpLoad %131 
                              Private f32* %307 = OpAccessChain %105 %114 
                                       f32 %308 = OpLoad %307 
                                       f32 %309 = OpFMul %306 %308 
                              Private f32* %310 = OpAccessChain %76 %114 
                                       f32 %311 = OpLoad %310 
                                       f32 %312 = OpFAdd %309 %311 
                              Private f32* %313 = OpAccessChain %76 %114 
                                                    OpStore %313 %312 
                              Private f32* %314 = OpAccessChain %163 %114 
                                       f32 %315 = OpLoad %314 
                                       f32 %316 = OpLoad %251 
                                       f32 %317 = OpFMul %315 %316 
                              Private f32* %318 = OpAccessChain %9 %114 
                                       f32 %319 = OpLoad %318 
                                       f32 %320 = OpFAdd %317 %319 
                              Private f32* %321 = OpAccessChain %9 %114 
                                                    OpStore %321 %320 
                                     f32_4 %323 = OpLoad %63 
                                     f32_3 %324 = OpVectorShuffle %323 %323 1 2 3 
                                     f32_3 %325 = OpFMul %324 %58 
                                     f32_3 %326 = OpFAdd %325 %61 
                                                    OpStore %322 %326 
                                     f32_3 %327 = OpLoad %54 
                                     f32_3 %328 = OpLoad %322 
                                       f32 %329 = OpDot %327 %328 
                              Private f32* %330 = OpAccessChain %54 %114 
                                                    OpStore %330 %329 
                              Private f32* %331 = OpAccessChain %54 %114 
                                       f32 %332 = OpLoad %331 
                                       f32 %333 = OpFAdd %332 %119 
                              Private f32* %334 = OpAccessChain %54 %114 
                                                    OpStore %334 %333 
                              Private f32* %335 = OpAccessChain %54 %114 
                                       f32 %336 = OpLoad %335 
                                       f32 %337 = OpFMul %336 %124 
                              Private f32* %338 = OpAccessChain %54 %114 
                                                    OpStore %338 %337 
                              Private f32* %339 = OpAccessChain %54 %114 
                                       f32 %340 = OpLoad %339 
                                       f32 %341 = OpExtInst %1 43 %340 %18 %19 
                              Private f32* %342 = OpAccessChain %54 %114 
                                                    OpStore %342 %341 
                              Private f32* %344 = OpAccessChain %54 %114 
                                       f32 %345 = OpLoad %344 
                                       f32 %346 = OpFMul %345 %134 
                                       f32 %347 = OpFAdd %346 %136 
                                                    OpStore %343 %347 
                              Private f32* %348 = OpAccessChain %54 %114 
                                       f32 %349 = OpLoad %348 
                              Private f32* %350 = OpAccessChain %54 %114 
                                       f32 %351 = OpLoad %350 
                                       f32 %352 = OpFMul %349 %351 
                              Private f32* %353 = OpAccessChain %54 %114 
                                                    OpStore %353 %352 
                              Private f32* %355 = OpAccessChain %54 %114 
                                       f32 %356 = OpLoad %355 
                                       f32 %357 = OpLoad %343 
                                       f32 %358 = OpFMul %356 %357 
                                                    OpStore %354 %358 
                                       f32 %359 = OpLoad %343 
                              Private f32* %360 = OpAccessChain %54 %114 
                                       f32 %361 = OpLoad %360 
                                       f32 %362 = OpFMul %359 %361 
                              Private f32* %363 = OpAccessChain %76 %114 
                                       f32 %364 = OpLoad %363 
                                       f32 %365 = OpFAdd %362 %364 
                              Private f32* %366 = OpAccessChain %54 %114 
                                                    OpStore %366 %365 
                              Private f32* %367 = OpAccessChain %54 %114 
                                       f32 %368 = OpLoad %367 
                                       f32 %369 = OpFAdd %368 %19 
                              Private f32* %370 = OpAccessChain %54 %114 
                                                    OpStore %370 %369 
                              Private f32* %371 = OpAccessChain %63 %114 
                                       f32 %372 = OpLoad %371 
                                       f32 %373 = OpLoad %354 
                                       f32 %374 = OpFMul %372 %373 
                              Private f32* %375 = OpAccessChain %9 %114 
                                       f32 %376 = OpLoad %375 
                                       f32 %377 = OpFAdd %374 %376 
                              Private f32* %378 = OpAccessChain %9 %114 
                                                    OpStore %378 %377 
                              Private f32* %379 = OpAccessChain %9 %114 
                                       f32 %380 = OpLoad %379 
                              Private f32* %381 = OpAccessChain %54 %114 
                                       f32 %382 = OpLoad %381 
                                       f32 %383 = OpFDiv %380 %382 
                              Private f32* %384 = OpAccessChain %9 %114 
                                                    OpStore %384 %383 
                                     f32_4 %387 = OpLoad %9 
                                     f32_3 %388 = OpVectorShuffle %387 %387 0 0 0 
                            Uniform f32_3* %391 = OpAccessChain %30 %389 
                                     f32_3 %392 = OpLoad %391 
                                     f32_3 %393 = OpFMul %388 %392 
                                     f32_4 %394 = OpLoad %386 
                                     f32_4 %395 = OpVectorShuffle %394 %393 4 5 6 3 
                                                    OpStore %386 %395 
                              Private f32* %396 = OpAccessChain %9 %114 
                                       f32 %397 = OpLoad %396 
                               Output f32* %400 = OpAccessChain %386 %398 
                                                    OpStore %400 %397 
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
 Pass {
  Blend Zero OneMinusSrcColor, Zero OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 409249
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ScreenParams;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
uniform 	vec3 _AOColor;
UNITY_LOCATION(0) uniform  sampler2D _SAOcclusionTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture(_SAOcclusionTexture, u_xlat0.xy);
    u_xlat1.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy / _AOParams.zz;
    u_xlat2.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
    u_xlat2 = texture(_SAOcclusionTexture, u_xlat2.xy);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat12;
    u_xlat0.x = u_xlat2.x * u_xlat7.x + u_xlat0.x;
    u_xlat1.zw = (-u_xlat1.yx);
    u_xlat3 = u_xlat1.xzwy + vs_TEXCOORD0.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_SAOcclusionTexture, u_xlat1.xy);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(_SAOcclusionTexture, u_xlat3.xy);
    u_xlat3 = texture(_SAOcclusionTexture, u_xlat3.zw);
    u_xlat2.xzw = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat2.xzw);
    u_xlat2.x = u_xlat2.x + -0.800000012;
    u_xlat2.x = u_xlat2.x * 5.00000048;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat12 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat17 = u_xlat2.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat2.x + u_xlat7.x;
    u_xlat0.x = u_xlat4.x * u_xlat17 + u_xlat0.x;
    u_xlat7.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat17 = u_xlat7.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat7.x + u_xlat2.x;
    u_xlat0.x = u_xlat3.x * u_xlat17 + u_xlat0.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat15 = u_xlat5.x * u_xlat10;
    u_xlat5.x = u_xlat10 * u_xlat5.x + u_xlat2.x;
    u_xlat5.x = u_xlat5.x + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    SV_Target0.w = u_xlat0.x;
    SV_Target1.xyz = u_xlat0.xxx * _AOColor.xyz;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    SV_Target1.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 413
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %392 %398 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpDecorate vs_TEXCOORD0 Location 12 
                                                    OpMemberDecorate %28 0 Offset 28 
                                                    OpMemberDecorate %28 1 Offset 28 
                                                    OpMemberDecorate %28 2 Offset 28 
                                                    OpMemberDecorate %28 3 Offset 28 
                                                    OpDecorate %28 Block 
                                                    OpDecorate %30 DescriptorSet 30 
                                                    OpDecorate %30 Binding 30 
                                                    OpDecorate %42 DescriptorSet 42 
                                                    OpDecorate %42 Binding 42 
                                                    OpDecorate %46 DescriptorSet 46 
                                                    OpDecorate %46 Binding 46 
                                                    OpDecorate %392 Location 392 
                                                    OpDecorate %398 Location 398 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                      Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                        f32 %18 = OpConstant 3.674022E-40 
                                        f32 %19 = OpConstant 3.674022E-40 
                                            %27 = OpTypeVector %6 3 
                                            %28 = OpTypeStruct %7 %6 %7 %27 
                                            %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32; f32_4; f32_3;}* %30 = OpVariable Uniform 
                                            %31 = OpTypeInt 32 1 
                                        i32 %32 = OpConstant 1 
                                            %33 = OpTypePointer Uniform %6 
                                            %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %41 = OpTypePointer UniformConstant %40 
       UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
                                            %44 = OpTypeSampler 
                                            %45 = OpTypePointer UniformConstant %44 
                   UniformConstant sampler* %46 = OpVariable UniformConstant 
                                            %48 = OpTypeSampledImage %40 
                             Private f32_4* %53 = OpVariable Private 
                                        i32 %54 = OpConstant 0 
                                            %55 = OpTypePointer Uniform %7 
                                        f32 %59 = OpConstant 3.674022E-40 
                                      f32_2 %60 = OpConstantComposite %59 %59 
                                        i32 %66 = OpConstant 2 
                             Private f32_4* %73 = OpVariable Private 
                                           %102 = OpTypePointer Private %27 
                            Private f32_3* %103 = OpVariable Private 
                                       f32 %106 = OpConstant 3.674022E-40 
                                     f32_3 %107 = OpConstantComposite %106 %106 %106 
                                     f32_3 %109 = OpConstantComposite %59 %59 %59 
                            Private f32_3* %111 = OpVariable Private 
                                           %119 = OpTypeInt 32 0 
                                       u32 %120 = OpConstant 0 
                                           %121 = OpTypePointer Private %6 
                                       f32 %125 = OpConstant 3.674022E-40 
                                       f32 %130 = OpConstant 3.674022E-40 
                              Private f32* %137 = OpVariable Private 
                                       f32 %140 = OpConstant 3.674022E-40 
                                       f32 %142 = OpConstant 3.674022E-40 
                            Private f32_4* %169 = OpVariable Private 
                            Private f32_4* %211 = OpVariable Private 
                              Private f32* %257 = OpVariable Private 
                            Private f32_3* %328 = OpVariable Private 
                              Private f32* %349 = OpVariable Private 
                              Private f32* %360 = OpVariable Private 
                                           %391 = OpTypePointer Output %7 
                             Output f32_4* %392 = OpVariable Output 
                                       u32 %395 = OpConstant 3 
                                           %396 = OpTypePointer Output %6 
                             Output f32_4* %398 = OpVariable Output 
                                       i32 %401 = OpConstant 3 
                                           %402 = OpTypePointer Uniform %27 
                                     f32_3 %408 = OpConstantComposite %18 %18 %18 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad vs_TEXCOORD0 
                                      f32_4 %14 = OpLoad %9 
                                      f32_4 %15 = OpVectorShuffle %14 %13 4 5 2 3 
                                                    OpStore %9 %15 
                                      f32_4 %16 = OpLoad %9 
                                      f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                                      f32_2 %20 = OpCompositeConstruct %18 %18 
                                      f32_2 %21 = OpCompositeConstruct %19 %19 
                                      f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                                      f32_4 %23 = OpLoad %9 
                                      f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
                                                    OpStore %9 %24 
                                      f32_4 %25 = OpLoad %9 
                                      f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                               Uniform f32* %34 = OpAccessChain %30 %32 
                                        f32 %35 = OpLoad %34 
                                      f32_2 %36 = OpCompositeConstruct %35 %35 
                                      f32_2 %37 = OpFMul %26 %36 
                                      f32_4 %38 = OpLoad %9 
                                      f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
                                                    OpStore %9 %39 
                        read_only Texture2D %43 = OpLoad %42 
                                    sampler %47 = OpLoad %46 
                 read_only Texture2DSampled %49 = OpSampledImage %43 %47 
                                      f32_4 %50 = OpLoad %9 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_4 %52 = OpImageSampleImplicitLod %49 %51 
                                                    OpStore %9 %52 
                             Uniform f32_4* %56 = OpAccessChain %30 %54 
                                      f32_4 %57 = OpLoad %56 
                                      f32_2 %58 = OpVectorShuffle %57 %57 2 3 
                                      f32_2 %61 = OpFAdd %58 %60 
                                      f32_4 %62 = OpLoad %53 
                                      f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                    OpStore %53 %63 
                                      f32_4 %64 = OpLoad %53 
                                      f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                             Uniform f32_4* %67 = OpAccessChain %30 %66 
                                      f32_4 %68 = OpLoad %67 
                                      f32_2 %69 = OpVectorShuffle %68 %68 2 2 
                                      f32_2 %70 = OpFDiv %65 %69 
                                      f32_4 %71 = OpLoad %53 
                                      f32_4 %72 = OpVectorShuffle %71 %70 4 5 2 3 
                                                    OpStore %53 %72 
                                      f32_4 %74 = OpLoad %53 
                                      f32_2 %75 = OpVectorShuffle %74 %74 0 1 
                                      f32_2 %76 = OpFNegate %75 
                                      f32_2 %77 = OpLoad vs_TEXCOORD0 
                                      f32_2 %78 = OpFAdd %76 %77 
                                      f32_4 %79 = OpLoad %73 
                                      f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
                                                    OpStore %73 %80 
                                      f32_4 %81 = OpLoad %73 
                                      f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                      f32_2 %83 = OpCompositeConstruct %18 %18 
                                      f32_2 %84 = OpCompositeConstruct %19 %19 
                                      f32_2 %85 = OpExtInst %1 43 %82 %83 %84 
                                      f32_4 %86 = OpLoad %73 
                                      f32_4 %87 = OpVectorShuffle %86 %85 4 5 2 3 
                                                    OpStore %73 %87 
                                      f32_4 %88 = OpLoad %73 
                                      f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                               Uniform f32* %90 = OpAccessChain %30 %32 
                                        f32 %91 = OpLoad %90 
                                      f32_2 %92 = OpCompositeConstruct %91 %91 
                                      f32_2 %93 = OpFMul %89 %92 
                                      f32_4 %94 = OpLoad %73 
                                      f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                    OpStore %73 %95 
                        read_only Texture2D %96 = OpLoad %42 
                                    sampler %97 = OpLoad %46 
                 read_only Texture2DSampled %98 = OpSampledImage %96 %97 
                                      f32_4 %99 = OpLoad %73 
                                     f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                                     f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                                                    OpStore %73 %101 
                                     f32_4 %104 = OpLoad %73 
                                     f32_3 %105 = OpVectorShuffle %104 %104 1 2 3 
                                     f32_3 %108 = OpFMul %105 %107 
                                     f32_3 %110 = OpFAdd %108 %109 
                                                    OpStore %103 %110 
                                     f32_4 %112 = OpLoad %9 
                                     f32_3 %113 = OpVectorShuffle %112 %112 1 2 3 
                                     f32_3 %114 = OpFMul %113 %107 
                                     f32_3 %115 = OpFAdd %114 %109 
                                                    OpStore %111 %115 
                                     f32_3 %116 = OpLoad %111 
                                     f32_3 %117 = OpLoad %103 
                                       f32 %118 = OpDot %116 %117 
                              Private f32* %122 = OpAccessChain %103 %120 
                                                    OpStore %122 %118 
                              Private f32* %123 = OpAccessChain %103 %120 
                                       f32 %124 = OpLoad %123 
                                       f32 %126 = OpFAdd %124 %125 
                              Private f32* %127 = OpAccessChain %103 %120 
                                                    OpStore %127 %126 
                              Private f32* %128 = OpAccessChain %103 %120 
                                       f32 %129 = OpLoad %128 
                                       f32 %131 = OpFMul %129 %130 
                              Private f32* %132 = OpAccessChain %103 %120 
                                                    OpStore %132 %131 
                              Private f32* %133 = OpAccessChain %103 %120 
                                       f32 %134 = OpLoad %133 
                                       f32 %135 = OpExtInst %1 43 %134 %18 %19 
                              Private f32* %136 = OpAccessChain %103 %120 
                                                    OpStore %136 %135 
                              Private f32* %138 = OpAccessChain %103 %120 
                                       f32 %139 = OpLoad %138 
                                       f32 %141 = OpFMul %139 %140 
                                       f32 %143 = OpFAdd %141 %142 
                                                    OpStore %137 %143 
                              Private f32* %144 = OpAccessChain %103 %120 
                                       f32 %145 = OpLoad %144 
                              Private f32* %146 = OpAccessChain %103 %120 
                                       f32 %147 = OpLoad %146 
                                       f32 %148 = OpFMul %145 %147 
                              Private f32* %149 = OpAccessChain %103 %120 
                                                    OpStore %149 %148 
                              Private f32* %150 = OpAccessChain %103 %120 
                                       f32 %151 = OpLoad %150 
                                       f32 %152 = OpLoad %137 
                                       f32 %153 = OpFMul %151 %152 
                              Private f32* %154 = OpAccessChain %103 %120 
                                                    OpStore %154 %153 
                              Private f32* %155 = OpAccessChain %73 %120 
                                       f32 %156 = OpLoad %155 
                              Private f32* %157 = OpAccessChain %103 %120 
                                       f32 %158 = OpLoad %157 
                                       f32 %159 = OpFMul %156 %158 
                              Private f32* %160 = OpAccessChain %9 %120 
                                       f32 %161 = OpLoad %160 
                                       f32 %162 = OpFAdd %159 %161 
                              Private f32* %163 = OpAccessChain %9 %120 
                                                    OpStore %163 %162 
                                     f32_4 %164 = OpLoad %53 
                                     f32_2 %165 = OpVectorShuffle %164 %164 1 0 
                                     f32_2 %166 = OpFNegate %165 
                                     f32_4 %167 = OpLoad %53 
                                     f32_4 %168 = OpVectorShuffle %167 %166 0 1 4 5 
                                                    OpStore %53 %168 
                                     f32_4 %170 = OpLoad %53 
                                     f32_4 %171 = OpVectorShuffle %170 %170 0 2 3 1 
                                     f32_2 %172 = OpLoad vs_TEXCOORD0 
                                     f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 1 
                                     f32_4 %174 = OpFAdd %171 %173 
                                                    OpStore %169 %174 
                                     f32_4 %175 = OpLoad %169 
                                     f32_4 %176 = OpCompositeConstruct %18 %18 %18 %18 
                                     f32_4 %177 = OpCompositeConstruct %19 %19 %19 %19 
                                     f32_4 %178 = OpExtInst %1 43 %175 %176 %177 
                                                    OpStore %169 %178 
                                     f32_4 %179 = OpLoad %53 
                                     f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                     f32_2 %181 = OpLoad vs_TEXCOORD0 
                                     f32_2 %182 = OpFAdd %180 %181 
                                     f32_4 %183 = OpLoad %53 
                                     f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
                                                    OpStore %53 %184 
                                     f32_4 %185 = OpLoad %53 
                                     f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                     f32_2 %187 = OpCompositeConstruct %18 %18 
                                     f32_2 %188 = OpCompositeConstruct %19 %19 
                                     f32_2 %189 = OpExtInst %1 43 %186 %187 %188 
                                     f32_4 %190 = OpLoad %53 
                                     f32_4 %191 = OpVectorShuffle %190 %189 4 5 2 3 
                                                    OpStore %53 %191 
                                     f32_4 %192 = OpLoad %53 
                                     f32_2 %193 = OpVectorShuffle %192 %192 0 1 
                              Uniform f32* %194 = OpAccessChain %30 %32 
                                       f32 %195 = OpLoad %194 
                                     f32_2 %196 = OpCompositeConstruct %195 %195 
                                     f32_2 %197 = OpFMul %193 %196 
                                     f32_4 %198 = OpLoad %53 
                                     f32_4 %199 = OpVectorShuffle %198 %197 4 5 2 3 
                                                    OpStore %53 %199 
                       read_only Texture2D %200 = OpLoad %42 
                                   sampler %201 = OpLoad %46 
                read_only Texture2DSampled %202 = OpSampledImage %200 %201 
                                     f32_4 %203 = OpLoad %53 
                                     f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                     f32_4 %205 = OpImageSampleImplicitLod %202 %204 
                                                    OpStore %53 %205 
                                     f32_4 %206 = OpLoad %169 
                              Uniform f32* %207 = OpAccessChain %30 %32 
                                       f32 %208 = OpLoad %207 
                                     f32_4 %209 = OpCompositeConstruct %208 %208 %208 %208 
                                     f32_4 %210 = OpFMul %206 %209 
                                                    OpStore %169 %210 
                       read_only Texture2D %212 = OpLoad %42 
                                   sampler %213 = OpLoad %46 
                read_only Texture2DSampled %214 = OpSampledImage %212 %213 
                                     f32_4 %215 = OpLoad %169 
                                     f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                     f32_4 %217 = OpImageSampleImplicitLod %214 %216 
                                                    OpStore %211 %217 
                       read_only Texture2D %218 = OpLoad %42 
                                   sampler %219 = OpLoad %46 
                read_only Texture2DSampled %220 = OpSampledImage %218 %219 
                                     f32_4 %221 = OpLoad %169 
                                     f32_2 %222 = OpVectorShuffle %221 %221 2 3 
                                     f32_4 %223 = OpImageSampleImplicitLod %220 %222 
                                                    OpStore %169 %223 
                                     f32_4 %224 = OpLoad %211 
                                     f32_3 %225 = OpVectorShuffle %224 %224 1 2 3 
                                     f32_3 %226 = OpFMul %225 %107 
                                     f32_3 %227 = OpFAdd %226 %109 
                                     f32_4 %228 = OpLoad %73 
                                     f32_4 %229 = OpVectorShuffle %228 %227 4 1 5 6 
                                                    OpStore %73 %229 
                                     f32_3 %230 = OpLoad %111 
                                     f32_4 %231 = OpLoad %73 
                                     f32_3 %232 = OpVectorShuffle %231 %231 0 2 3 
                                       f32 %233 = OpDot %230 %232 
                              Private f32* %234 = OpAccessChain %73 %120 
                                                    OpStore %234 %233 
                              Private f32* %235 = OpAccessChain %73 %120 
                                       f32 %236 = OpLoad %235 
                                       f32 %237 = OpFAdd %236 %125 
                              Private f32* %238 = OpAccessChain %73 %120 
                                                    OpStore %238 %237 
                              Private f32* %239 = OpAccessChain %73 %120 
                                       f32 %240 = OpLoad %239 
                                       f32 %241 = OpFMul %240 %130 
                              Private f32* %242 = OpAccessChain %73 %120 
                                                    OpStore %242 %241 
                              Private f32* %243 = OpAccessChain %73 %120 
                                       f32 %244 = OpLoad %243 
                                       f32 %245 = OpExtInst %1 43 %244 %18 %19 
                              Private f32* %246 = OpAccessChain %73 %120 
                                                    OpStore %246 %245 
                              Private f32* %247 = OpAccessChain %73 %120 
                                       f32 %248 = OpLoad %247 
                                       f32 %249 = OpFMul %248 %140 
                                       f32 %250 = OpFAdd %249 %142 
                                                    OpStore %137 %250 
                              Private f32* %251 = OpAccessChain %73 %120 
                                       f32 %252 = OpLoad %251 
                              Private f32* %253 = OpAccessChain %73 %120 
                                       f32 %254 = OpLoad %253 
                                       f32 %255 = OpFMul %252 %254 
                              Private f32* %256 = OpAccessChain %73 %120 
                                                    OpStore %256 %255 
                              Private f32* %258 = OpAccessChain %73 %120 
                                       f32 %259 = OpLoad %258 
                                       f32 %260 = OpLoad %137 
                                       f32 %261 = OpFMul %259 %260 
                                                    OpStore %257 %261 
                                       f32 %262 = OpLoad %137 
                              Private f32* %263 = OpAccessChain %73 %120 
                                       f32 %264 = OpLoad %263 
                                       f32 %265 = OpFMul %262 %264 
                              Private f32* %266 = OpAccessChain %103 %120 
                                       f32 %267 = OpLoad %266 
                                       f32 %268 = OpFAdd %265 %267 
                              Private f32* %269 = OpAccessChain %73 %120 
                                                    OpStore %269 %268 
                              Private f32* %270 = OpAccessChain %211 %120 
                                       f32 %271 = OpLoad %270 
                                       f32 %272 = OpLoad %257 
                                       f32 %273 = OpFMul %271 %272 
                              Private f32* %274 = OpAccessChain %9 %120 
                                       f32 %275 = OpLoad %274 
                                       f32 %276 = OpFAdd %273 %275 
                              Private f32* %277 = OpAccessChain %9 %120 
                                                    OpStore %277 %276 
                                     f32_4 %278 = OpLoad %169 
                                     f32_3 %279 = OpVectorShuffle %278 %278 1 2 3 
                                     f32_3 %280 = OpFMul %279 %107 
                                     f32_3 %281 = OpFAdd %280 %109 
                                                    OpStore %103 %281 
                                     f32_3 %282 = OpLoad %111 
                                     f32_3 %283 = OpLoad %103 
                                       f32 %284 = OpDot %282 %283 
                              Private f32* %285 = OpAccessChain %103 %120 
                                                    OpStore %285 %284 
                              Private f32* %286 = OpAccessChain %103 %120 
                                       f32 %287 = OpLoad %286 
                                       f32 %288 = OpFAdd %287 %125 
                              Private f32* %289 = OpAccessChain %103 %120 
                                                    OpStore %289 %288 
                              Private f32* %290 = OpAccessChain %103 %120 
                                       f32 %291 = OpLoad %290 
                                       f32 %292 = OpFMul %291 %130 
                              Private f32* %293 = OpAccessChain %103 %120 
                                                    OpStore %293 %292 
                              Private f32* %294 = OpAccessChain %103 %120 
                                       f32 %295 = OpLoad %294 
                                       f32 %296 = OpExtInst %1 43 %295 %18 %19 
                              Private f32* %297 = OpAccessChain %103 %120 
                                                    OpStore %297 %296 
                              Private f32* %298 = OpAccessChain %103 %120 
                                       f32 %299 = OpLoad %298 
                                       f32 %300 = OpFMul %299 %140 
                                       f32 %301 = OpFAdd %300 %142 
                                                    OpStore %137 %301 
                              Private f32* %302 = OpAccessChain %103 %120 
                                       f32 %303 = OpLoad %302 
                              Private f32* %304 = OpAccessChain %103 %120 
                                       f32 %305 = OpLoad %304 
                                       f32 %306 = OpFMul %303 %305 
                              Private f32* %307 = OpAccessChain %103 %120 
                                                    OpStore %307 %306 
                              Private f32* %308 = OpAccessChain %103 %120 
                                       f32 %309 = OpLoad %308 
                                       f32 %310 = OpLoad %137 
                                       f32 %311 = OpFMul %309 %310 
                                                    OpStore %257 %311 
                                       f32 %312 = OpLoad %137 
                              Private f32* %313 = OpAccessChain %103 %120 
                                       f32 %314 = OpLoad %313 
                                       f32 %315 = OpFMul %312 %314 
                              Private f32* %316 = OpAccessChain %73 %120 
                                       f32 %317 = OpLoad %316 
                                       f32 %318 = OpFAdd %315 %317 
                              Private f32* %319 = OpAccessChain %73 %120 
                                                    OpStore %319 %318 
                              Private f32* %320 = OpAccessChain %169 %120 
                                       f32 %321 = OpLoad %320 
                                       f32 %322 = OpLoad %257 
                                       f32 %323 = OpFMul %321 %322 
                              Private f32* %324 = OpAccessChain %9 %120 
                                       f32 %325 = OpLoad %324 
                                       f32 %326 = OpFAdd %323 %325 
                              Private f32* %327 = OpAccessChain %9 %120 
                                                    OpStore %327 %326 
                                     f32_4 %329 = OpLoad %53 
                                     f32_3 %330 = OpVectorShuffle %329 %329 1 2 3 
                                     f32_3 %331 = OpFMul %330 %107 
                                     f32_3 %332 = OpFAdd %331 %109 
                                                    OpStore %328 %332 
                                     f32_3 %333 = OpLoad %111 
                                     f32_3 %334 = OpLoad %328 
                                       f32 %335 = OpDot %333 %334 
                              Private f32* %336 = OpAccessChain %111 %120 
                                                    OpStore %336 %335 
                              Private f32* %337 = OpAccessChain %111 %120 
                                       f32 %338 = OpLoad %337 
                                       f32 %339 = OpFAdd %338 %125 
                              Private f32* %340 = OpAccessChain %111 %120 
                                                    OpStore %340 %339 
                              Private f32* %341 = OpAccessChain %111 %120 
                                       f32 %342 = OpLoad %341 
                                       f32 %343 = OpFMul %342 %130 
                              Private f32* %344 = OpAccessChain %111 %120 
                                                    OpStore %344 %343 
                              Private f32* %345 = OpAccessChain %111 %120 
                                       f32 %346 = OpLoad %345 
                                       f32 %347 = OpExtInst %1 43 %346 %18 %19 
                              Private f32* %348 = OpAccessChain %111 %120 
                                                    OpStore %348 %347 
                              Private f32* %350 = OpAccessChain %111 %120 
                                       f32 %351 = OpLoad %350 
                                       f32 %352 = OpFMul %351 %140 
                                       f32 %353 = OpFAdd %352 %142 
                                                    OpStore %349 %353 
                              Private f32* %354 = OpAccessChain %111 %120 
                                       f32 %355 = OpLoad %354 
                              Private f32* %356 = OpAccessChain %111 %120 
                                       f32 %357 = OpLoad %356 
                                       f32 %358 = OpFMul %355 %357 
                              Private f32* %359 = OpAccessChain %111 %120 
                                                    OpStore %359 %358 
                              Private f32* %361 = OpAccessChain %111 %120 
                                       f32 %362 = OpLoad %361 
                                       f32 %363 = OpLoad %349 
                                       f32 %364 = OpFMul %362 %363 
                                                    OpStore %360 %364 
                                       f32 %365 = OpLoad %349 
                              Private f32* %366 = OpAccessChain %111 %120 
                                       f32 %367 = OpLoad %366 
                                       f32 %368 = OpFMul %365 %367 
                              Private f32* %369 = OpAccessChain %73 %120 
                                       f32 %370 = OpLoad %369 
                                       f32 %371 = OpFAdd %368 %370 
                              Private f32* %372 = OpAccessChain %111 %120 
                                                    OpStore %372 %371 
                              Private f32* %373 = OpAccessChain %111 %120 
                                       f32 %374 = OpLoad %373 
                                       f32 %375 = OpFAdd %374 %19 
                              Private f32* %376 = OpAccessChain %111 %120 
                                                    OpStore %376 %375 
                              Private f32* %377 = OpAccessChain %53 %120 
                                       f32 %378 = OpLoad %377 
                                       f32 %379 = OpLoad %360 
                                       f32 %380 = OpFMul %378 %379 
                              Private f32* %381 = OpAccessChain %9 %120 
                                       f32 %382 = OpLoad %381 
                                       f32 %383 = OpFAdd %380 %382 
                              Private f32* %384 = OpAccessChain %9 %120 
                                                    OpStore %384 %383 
                              Private f32* %385 = OpAccessChain %9 %120 
                                       f32 %386 = OpLoad %385 
                              Private f32* %387 = OpAccessChain %111 %120 
                                       f32 %388 = OpLoad %387 
                                       f32 %389 = OpFDiv %386 %388 
                              Private f32* %390 = OpAccessChain %9 %120 
                                                    OpStore %390 %389 
                              Private f32* %393 = OpAccessChain %9 %120 
                                       f32 %394 = OpLoad %393 
                               Output f32* %397 = OpAccessChain %392 %395 
                                                    OpStore %397 %394 
                                     f32_4 %399 = OpLoad %9 
                                     f32_3 %400 = OpVectorShuffle %399 %399 0 0 0 
                            Uniform f32_3* %403 = OpAccessChain %30 %401 
                                     f32_3 %404 = OpLoad %403 
                                     f32_3 %405 = OpFMul %400 %404 
                                     f32_4 %406 = OpLoad %398 
                                     f32_4 %407 = OpVectorShuffle %406 %405 4 5 6 3 
                                                    OpStore %398 %407 
                                     f32_4 %409 = OpLoad %392 
                                     f32_4 %410 = OpVectorShuffle %409 %408 4 5 6 3 
                                                    OpStore %392 %410 
                               Output f32* %411 = OpAccessChain %398 %395 
                                                    OpStore %411 %18 
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 469035
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
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _AOParams;
uniform 	vec4 _SAOcclusionTexture_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _SAOcclusionTexture;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture(_SAOcclusionTexture, u_xlat0.xy);
    u_xlat5.xyz = u_xlat0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = _SAOcclusionTexture_TexelSize.xy / _AOParams.zz;
    u_xlat2.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
    u_xlat2 = texture(_SAOcclusionTexture, u_xlat2.xy);
    u_xlat7.xyz = u_xlat2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat17 = u_xlat7.x * u_xlat12;
    u_xlat7.x = u_xlat12 * u_xlat7.x + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat17 + u_xlat0.x;
    u_xlat1.zw = (-u_xlat1.yx);
    u_xlat3 = u_xlat1.xzwy + vs_TEXCOORD0.xyxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(_RenderViewportScaleFactor);
    u_xlat1 = texture(_SAOcclusionTexture, u_xlat1.xy);
    u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
    u_xlat4 = texture(_SAOcclusionTexture, u_xlat3.xy);
    u_xlat3 = texture(_SAOcclusionTexture, u_xlat3.zw);
    u_xlat2.xzw = u_xlat4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat5.xyz, u_xlat2.xzw);
    u_xlat2.x = u_xlat2.x + -0.800000012;
    u_xlat2.x = u_xlat2.x * 5.00000048;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat12 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat17 = u_xlat2.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat2.x + u_xlat7.x;
    u_xlat0.x = u_xlat4.x * u_xlat17 + u_xlat0.x;
    u_xlat7.xyz = u_xlat3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat7.xyz);
    u_xlat7.x = u_xlat7.x + -0.800000012;
    u_xlat7.x = u_xlat7.x * 5.00000048;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat12 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat17 = u_xlat7.x * u_xlat12;
    u_xlat2.x = u_xlat12 * u_xlat7.x + u_xlat2.x;
    u_xlat0.x = u_xlat3.x * u_xlat17 + u_xlat0.x;
    u_xlat6.xyz = u_xlat1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = u_xlat5.x * 5.00000048;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat15 = u_xlat5.x * u_xlat10;
    u_xlat5.x = u_xlat10 * u_xlat5.x + u_xlat2.x;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    SV_Target0.xyz = (-u_xlat0.xxx) + vec3(1.0, 1.0, 1.0);
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
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
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
                                             OpEntryPoint Fragment %4 "main" %12 %386 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 12 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpMemberDecorate %27 1 Offset 27 
                                             OpMemberDecorate %27 2 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %41 DescriptorSet 41 
                                             OpDecorate %41 Binding 41 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %386 Location 386 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeVector %6 2 
                                     %11 = OpTypePointer Input %10 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 f32 %18 = OpConstant 3.674022E-40 
                                 f32 %19 = OpConstant 3.674022E-40 
                                     %27 = OpTypeStruct %6 %7 %7 
                                     %28 = OpTypePointer Uniform %27 
Uniform struct {f32; f32_4; f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %6 
                                     %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %40 = OpTypePointer UniformConstant %39 
UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
                                     %43 = OpTypeSampler 
                                     %44 = OpTypePointer UniformConstant %43 
            UniformConstant sampler* %45 = OpVariable UniformConstant 
                                     %47 = OpTypeSampledImage %39 
                                     %52 = OpTypeVector %6 3 
                                     %53 = OpTypePointer Private %52 
                      Private f32_3* %54 = OpVariable Private 
                                 f32 %57 = OpConstant 3.674022E-40 
                               f32_3 %58 = OpConstantComposite %57 %57 %57 
                                 f32 %60 = OpConstant 3.674022E-40 
                               f32_3 %61 = OpConstantComposite %60 %60 %60 
                      Private f32_4* %63 = OpVariable Private 
                                 i32 %64 = OpConstant 2 
                                     %65 = OpTypePointer Uniform %7 
                                 i32 %69 = OpConstant 1 
                      Private f32_4* %76 = OpVariable Private 
                     Private f32_3* %105 = OpVariable Private 
                                    %113 = OpTypeInt 32 0 
                                u32 %114 = OpConstant 0 
                                    %115 = OpTypePointer Private %6 
                                f32 %119 = OpConstant 3.674022E-40 
                                f32 %124 = OpConstant 3.674022E-40 
                       Private f32* %131 = OpVariable Private 
                                f32 %134 = OpConstant 3.674022E-40 
                                f32 %136 = OpConstant 3.674022E-40 
                       Private f32* %144 = OpVariable Private 
                     Private f32_4* %168 = OpVariable Private 
                     Private f32_4* %210 = OpVariable Private 
                     Private f32_3* %326 = OpVariable Private 
                       Private f32* %347 = OpVariable Private 
                       Private f32* %358 = OpVariable Private 
                                    %385 = OpTypePointer Output %7 
                      Output f32_4* %386 = OpVariable Output 
                              f32_3 %390 = OpConstantComposite %19 %19 %19 
                                u32 %394 = OpConstant 3 
                                    %395 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_2 %13 = OpLoad vs_TEXCOORD0 
                               f32_4 %14 = OpLoad %9 
                               f32_4 %15 = OpVectorShuffle %14 %13 4 5 2 3 
                                             OpStore %9 %15 
                               f32_4 %16 = OpLoad %9 
                               f32_2 %17 = OpVectorShuffle %16 %16 0 1 
                               f32_2 %20 = OpCompositeConstruct %18 %18 
                               f32_2 %21 = OpCompositeConstruct %19 %19 
                               f32_2 %22 = OpExtInst %1 43 %17 %20 %21 
                               f32_4 %23 = OpLoad %9 
                               f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
                                             OpStore %9 %24 
                               f32_4 %25 = OpLoad %9 
                               f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                        Uniform f32* %33 = OpAccessChain %29 %31 
                                 f32 %34 = OpLoad %33 
                               f32_2 %35 = OpCompositeConstruct %34 %34 
                               f32_2 %36 = OpFMul %26 %35 
                               f32_4 %37 = OpLoad %9 
                               f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                             OpStore %9 %38 
                 read_only Texture2D %42 = OpLoad %41 
                             sampler %46 = OpLoad %45 
          read_only Texture2DSampled %48 = OpSampledImage %42 %46 
                               f32_4 %49 = OpLoad %9 
                               f32_2 %50 = OpVectorShuffle %49 %49 0 1 
                               f32_4 %51 = OpImageSampleImplicitLod %48 %50 
                                             OpStore %9 %51 
                               f32_4 %55 = OpLoad %9 
                               f32_3 %56 = OpVectorShuffle %55 %55 1 2 3 
                               f32_3 %59 = OpFMul %56 %58 
                               f32_3 %62 = OpFAdd %59 %61 
                                             OpStore %54 %62 
                      Uniform f32_4* %66 = OpAccessChain %29 %64 
                               f32_4 %67 = OpLoad %66 
                               f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                      Uniform f32_4* %70 = OpAccessChain %29 %69 
                               f32_4 %71 = OpLoad %70 
                               f32_2 %72 = OpVectorShuffle %71 %71 2 2 
                               f32_2 %73 = OpFDiv %68 %72 
                               f32_4 %74 = OpLoad %63 
                               f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                             OpStore %63 %75 
                               f32_4 %77 = OpLoad %63 
                               f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                               f32_2 %79 = OpFNegate %78 
                               f32_2 %80 = OpLoad vs_TEXCOORD0 
                               f32_2 %81 = OpFAdd %79 %80 
                               f32_4 %82 = OpLoad %76 
                               f32_4 %83 = OpVectorShuffle %82 %81 4 5 2 3 
                                             OpStore %76 %83 
                               f32_4 %84 = OpLoad %76 
                               f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                               f32_2 %86 = OpCompositeConstruct %18 %18 
                               f32_2 %87 = OpCompositeConstruct %19 %19 
                               f32_2 %88 = OpExtInst %1 43 %85 %86 %87 
                               f32_4 %89 = OpLoad %76 
                               f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                             OpStore %76 %90 
                               f32_4 %91 = OpLoad %76 
                               f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                        Uniform f32* %93 = OpAccessChain %29 %31 
                                 f32 %94 = OpLoad %93 
                               f32_2 %95 = OpCompositeConstruct %94 %94 
                               f32_2 %96 = OpFMul %92 %95 
                               f32_4 %97 = OpLoad %76 
                               f32_4 %98 = OpVectorShuffle %97 %96 4 5 2 3 
                                             OpStore %76 %98 
                 read_only Texture2D %99 = OpLoad %41 
                            sampler %100 = OpLoad %45 
         read_only Texture2DSampled %101 = OpSampledImage %99 %100 
                              f32_4 %102 = OpLoad %76 
                              f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                              f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                             OpStore %76 %104 
                              f32_4 %106 = OpLoad %76 
                              f32_3 %107 = OpVectorShuffle %106 %106 1 2 3 
                              f32_3 %108 = OpFMul %107 %58 
                              f32_3 %109 = OpFAdd %108 %61 
                                             OpStore %105 %109 
                              f32_3 %110 = OpLoad %54 
                              f32_3 %111 = OpLoad %105 
                                f32 %112 = OpDot %110 %111 
                       Private f32* %116 = OpAccessChain %105 %114 
                                             OpStore %116 %112 
                       Private f32* %117 = OpAccessChain %105 %114 
                                f32 %118 = OpLoad %117 
                                f32 %120 = OpFAdd %118 %119 
                       Private f32* %121 = OpAccessChain %105 %114 
                                             OpStore %121 %120 
                       Private f32* %122 = OpAccessChain %105 %114 
                                f32 %123 = OpLoad %122 
                                f32 %125 = OpFMul %123 %124 
                       Private f32* %126 = OpAccessChain %105 %114 
                                             OpStore %126 %125 
                       Private f32* %127 = OpAccessChain %105 %114 
                                f32 %128 = OpLoad %127 
                                f32 %129 = OpExtInst %1 43 %128 %18 %19 
                       Private f32* %130 = OpAccessChain %105 %114 
                                             OpStore %130 %129 
                       Private f32* %132 = OpAccessChain %105 %114 
                                f32 %133 = OpLoad %132 
                                f32 %135 = OpFMul %133 %134 
                                f32 %137 = OpFAdd %135 %136 
                                             OpStore %131 %137 
                       Private f32* %138 = OpAccessChain %105 %114 
                                f32 %139 = OpLoad %138 
                       Private f32* %140 = OpAccessChain %105 %114 
                                f32 %141 = OpLoad %140 
                                f32 %142 = OpFMul %139 %141 
                       Private f32* %143 = OpAccessChain %105 %114 
                                             OpStore %143 %142 
                       Private f32* %145 = OpAccessChain %105 %114 
                                f32 %146 = OpLoad %145 
                                f32 %147 = OpLoad %131 
                                f32 %148 = OpFMul %146 %147 
                                             OpStore %144 %148 
                                f32 %149 = OpLoad %131 
                       Private f32* %150 = OpAccessChain %105 %114 
                                f32 %151 = OpLoad %150 
                                f32 %152 = OpFMul %149 %151 
                                f32 %153 = OpFAdd %152 %19 
                       Private f32* %154 = OpAccessChain %105 %114 
                                             OpStore %154 %153 
                       Private f32* %155 = OpAccessChain %76 %114 
                                f32 %156 = OpLoad %155 
                                f32 %157 = OpLoad %144 
                                f32 %158 = OpFMul %156 %157 
                       Private f32* %159 = OpAccessChain %9 %114 
                                f32 %160 = OpLoad %159 
                                f32 %161 = OpFAdd %158 %160 
                       Private f32* %162 = OpAccessChain %9 %114 
                                             OpStore %162 %161 
                              f32_4 %163 = OpLoad %63 
                              f32_2 %164 = OpVectorShuffle %163 %163 1 0 
                              f32_2 %165 = OpFNegate %164 
                              f32_4 %166 = OpLoad %63 
                              f32_4 %167 = OpVectorShuffle %166 %165 0 1 4 5 
                                             OpStore %63 %167 
                              f32_4 %169 = OpLoad %63 
                              f32_4 %170 = OpVectorShuffle %169 %169 0 2 3 1 
                              f32_2 %171 = OpLoad vs_TEXCOORD0 
                              f32_4 %172 = OpVectorShuffle %171 %171 0 1 0 1 
                              f32_4 %173 = OpFAdd %170 %172 
                                             OpStore %168 %173 
                              f32_4 %174 = OpLoad %168 
                              f32_4 %175 = OpCompositeConstruct %18 %18 %18 %18 
                              f32_4 %176 = OpCompositeConstruct %19 %19 %19 %19 
                              f32_4 %177 = OpExtInst %1 43 %174 %175 %176 
                                             OpStore %168 %177 
                              f32_4 %178 = OpLoad %63 
                              f32_2 %179 = OpVectorShuffle %178 %178 0 1 
                              f32_2 %180 = OpLoad vs_TEXCOORD0 
                              f32_2 %181 = OpFAdd %179 %180 
                              f32_4 %182 = OpLoad %63 
                              f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
                                             OpStore %63 %183 
                              f32_4 %184 = OpLoad %63 
                              f32_2 %185 = OpVectorShuffle %184 %184 0 1 
                              f32_2 %186 = OpCompositeConstruct %18 %18 
                              f32_2 %187 = OpCompositeConstruct %19 %19 
                              f32_2 %188 = OpExtInst %1 43 %185 %186 %187 
                              f32_4 %189 = OpLoad %63 
                              f32_4 %190 = OpVectorShuffle %189 %188 4 5 2 3 
                                             OpStore %63 %190 
                              f32_4 %191 = OpLoad %63 
                              f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                       Uniform f32* %193 = OpAccessChain %29 %31 
                                f32 %194 = OpLoad %193 
                              f32_2 %195 = OpCompositeConstruct %194 %194 
                              f32_2 %196 = OpFMul %192 %195 
                              f32_4 %197 = OpLoad %63 
                              f32_4 %198 = OpVectorShuffle %197 %196 4 5 2 3 
                                             OpStore %63 %198 
                read_only Texture2D %199 = OpLoad %41 
                            sampler %200 = OpLoad %45 
         read_only Texture2DSampled %201 = OpSampledImage %199 %200 
                              f32_4 %202 = OpLoad %63 
                              f32_2 %203 = OpVectorShuffle %202 %202 0 1 
                              f32_4 %204 = OpImageSampleImplicitLod %201 %203 
                                             OpStore %63 %204 
                              f32_4 %205 = OpLoad %168 
                       Uniform f32* %206 = OpAccessChain %29 %31 
                                f32 %207 = OpLoad %206 
                              f32_4 %208 = OpCompositeConstruct %207 %207 %207 %207 
                              f32_4 %209 = OpFMul %205 %208 
                                             OpStore %168 %209 
                read_only Texture2D %211 = OpLoad %41 
                            sampler %212 = OpLoad %45 
         read_only Texture2DSampled %213 = OpSampledImage %211 %212 
                              f32_4 %214 = OpLoad %168 
                              f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                              f32_4 %216 = OpImageSampleImplicitLod %213 %215 
                                             OpStore %210 %216 
                read_only Texture2D %217 = OpLoad %41 
                            sampler %218 = OpLoad %45 
         read_only Texture2DSampled %219 = OpSampledImage %217 %218 
                              f32_4 %220 = OpLoad %168 
                              f32_2 %221 = OpVectorShuffle %220 %220 2 3 
                              f32_4 %222 = OpImageSampleImplicitLod %219 %221 
                                             OpStore %168 %222 
                              f32_4 %223 = OpLoad %210 
                              f32_3 %224 = OpVectorShuffle %223 %223 1 2 3 
                              f32_3 %225 = OpFMul %224 %58 
                              f32_3 %226 = OpFAdd %225 %61 
                              f32_4 %227 = OpLoad %76 
                              f32_4 %228 = OpVectorShuffle %227 %226 4 1 5 6 
                                             OpStore %76 %228 
                              f32_3 %229 = OpLoad %54 
                              f32_4 %230 = OpLoad %76 
                              f32_3 %231 = OpVectorShuffle %230 %230 0 2 3 
                                f32 %232 = OpDot %229 %231 
                       Private f32* %233 = OpAccessChain %76 %114 
                                             OpStore %233 %232 
                       Private f32* %234 = OpAccessChain %76 %114 
                                f32 %235 = OpLoad %234 
                                f32 %236 = OpFAdd %235 %119 
                       Private f32* %237 = OpAccessChain %76 %114 
                                             OpStore %237 %236 
                       Private f32* %238 = OpAccessChain %76 %114 
                                f32 %239 = OpLoad %238 
                                f32 %240 = OpFMul %239 %124 
                       Private f32* %241 = OpAccessChain %76 %114 
                                             OpStore %241 %240 
                       Private f32* %242 = OpAccessChain %76 %114 
                                f32 %243 = OpLoad %242 
                                f32 %244 = OpExtInst %1 43 %243 %18 %19 
                       Private f32* %245 = OpAccessChain %76 %114 
                                             OpStore %245 %244 
                       Private f32* %246 = OpAccessChain %76 %114 
                                f32 %247 = OpLoad %246 
                                f32 %248 = OpFMul %247 %134 
                                f32 %249 = OpFAdd %248 %136 
                                             OpStore %131 %249 
                       Private f32* %250 = OpAccessChain %76 %114 
                                f32 %251 = OpLoad %250 
                       Private f32* %252 = OpAccessChain %76 %114 
                                f32 %253 = OpLoad %252 
                                f32 %254 = OpFMul %251 %253 
                       Private f32* %255 = OpAccessChain %76 %114 
                                             OpStore %255 %254 
                       Private f32* %256 = OpAccessChain %76 %114 
                                f32 %257 = OpLoad %256 
                                f32 %258 = OpLoad %131 
                                f32 %259 = OpFMul %257 %258 
                                             OpStore %144 %259 
                                f32 %260 = OpLoad %131 
                       Private f32* %261 = OpAccessChain %76 %114 
                                f32 %262 = OpLoad %261 
                                f32 %263 = OpFMul %260 %262 
                       Private f32* %264 = OpAccessChain %105 %114 
                                f32 %265 = OpLoad %264 
                                f32 %266 = OpFAdd %263 %265 
                       Private f32* %267 = OpAccessChain %76 %114 
                                             OpStore %267 %266 
                       Private f32* %268 = OpAccessChain %210 %114 
                                f32 %269 = OpLoad %268 
                                f32 %270 = OpLoad %144 
                                f32 %271 = OpFMul %269 %270 
                       Private f32* %272 = OpAccessChain %9 %114 
                                f32 %273 = OpLoad %272 
                                f32 %274 = OpFAdd %271 %273 
                       Private f32* %275 = OpAccessChain %9 %114 
                                             OpStore %275 %274 
                              f32_4 %276 = OpLoad %168 
                              f32_3 %277 = OpVectorShuffle %276 %276 1 2 3 
                              f32_3 %278 = OpFMul %277 %58 
                              f32_3 %279 = OpFAdd %278 %61 
                                             OpStore %105 %279 
                              f32_3 %280 = OpLoad %54 
                              f32_3 %281 = OpLoad %105 
                                f32 %282 = OpDot %280 %281 
                       Private f32* %283 = OpAccessChain %105 %114 
                                             OpStore %283 %282 
                       Private f32* %284 = OpAccessChain %105 %114 
                                f32 %285 = OpLoad %284 
                                f32 %286 = OpFAdd %285 %119 
                       Private f32* %287 = OpAccessChain %105 %114 
                                             OpStore %287 %286 
                       Private f32* %288 = OpAccessChain %105 %114 
                                f32 %289 = OpLoad %288 
                                f32 %290 = OpFMul %289 %124 
                       Private f32* %291 = OpAccessChain %105 %114 
                                             OpStore %291 %290 
                       Private f32* %292 = OpAccessChain %105 %114 
                                f32 %293 = OpLoad %292 
                                f32 %294 = OpExtInst %1 43 %293 %18 %19 
                       Private f32* %295 = OpAccessChain %105 %114 
                                             OpStore %295 %294 
                       Private f32* %296 = OpAccessChain %105 %114 
                                f32 %297 = OpLoad %296 
                                f32 %298 = OpFMul %297 %134 
                                f32 %299 = OpFAdd %298 %136 
                                             OpStore %131 %299 
                       Private f32* %300 = OpAccessChain %105 %114 
                                f32 %301 = OpLoad %300 
                       Private f32* %302 = OpAccessChain %105 %114 
                                f32 %303 = OpLoad %302 
                                f32 %304 = OpFMul %301 %303 
                       Private f32* %305 = OpAccessChain %105 %114 
                                             OpStore %305 %304 
                       Private f32* %306 = OpAccessChain %105 %114 
                                f32 %307 = OpLoad %306 
                                f32 %308 = OpLoad %131 
                                f32 %309 = OpFMul %307 %308 
                                             OpStore %144 %309 
                                f32 %310 = OpLoad %131 
                       Private f32* %311 = OpAccessChain %105 %114 
                                f32 %312 = OpLoad %311 
                                f32 %313 = OpFMul %310 %312 
                       Private f32* %314 = OpAccessChain %76 %114 
                                f32 %315 = OpLoad %314 
                                f32 %316 = OpFAdd %313 %315 
                       Private f32* %317 = OpAccessChain %76 %114 
                                             OpStore %317 %316 
                       Private f32* %318 = OpAccessChain %168 %114 
                                f32 %319 = OpLoad %318 
                                f32 %320 = OpLoad %144 
                                f32 %321 = OpFMul %319 %320 
                       Private f32* %322 = OpAccessChain %9 %114 
                                f32 %323 = OpLoad %322 
                                f32 %324 = OpFAdd %321 %323 
                       Private f32* %325 = OpAccessChain %9 %114 
                                             OpStore %325 %324 
                              f32_4 %327 = OpLoad %63 
                              f32_3 %328 = OpVectorShuffle %327 %327 1 2 3 
                              f32_3 %329 = OpFMul %328 %58 
                              f32_3 %330 = OpFAdd %329 %61 
                                             OpStore %326 %330 
                              f32_3 %331 = OpLoad %54 
                              f32_3 %332 = OpLoad %326 
                                f32 %333 = OpDot %331 %332 
                       Private f32* %334 = OpAccessChain %54 %114 
                                             OpStore %334 %333 
                       Private f32* %335 = OpAccessChain %54 %114 
                                f32 %336 = OpLoad %335 
                                f32 %337 = OpFAdd %336 %119 
                       Private f32* %338 = OpAccessChain %54 %114 
                                             OpStore %338 %337 
                       Private f32* %339 = OpAccessChain %54 %114 
                                f32 %340 = OpLoad %339 
                                f32 %341 = OpFMul %340 %124 
                       Private f32* %342 = OpAccessChain %54 %114 
                                             OpStore %342 %341 
                       Private f32* %343 = OpAccessChain %54 %114 
                                f32 %344 = OpLoad %343 
                                f32 %345 = OpExtInst %1 43 %344 %18 %19 
                       Private f32* %346 = OpAccessChain %54 %114 
                                             OpStore %346 %345 
                       Private f32* %348 = OpAccessChain %54 %114 
                                f32 %349 = OpLoad %348 
                                f32 %350 = OpFMul %349 %134 
                                f32 %351 = OpFAdd %350 %136 
                                             OpStore %347 %351 
                       Private f32* %352 = OpAccessChain %54 %114 
                                f32 %353 = OpLoad %352 
                       Private f32* %354 = OpAccessChain %54 %114 
                                f32 %355 = OpLoad %354 
                                f32 %356 = OpFMul %353 %355 
                       Private f32* %357 = OpAccessChain %54 %114 
                                             OpStore %357 %356 
                       Private f32* %359 = OpAccessChain %54 %114 
                                f32 %360 = OpLoad %359 
                                f32 %361 = OpLoad %347 
                                f32 %362 = OpFMul %360 %361 
                                             OpStore %358 %362 
                                f32 %363 = OpLoad %347 
                       Private f32* %364 = OpAccessChain %54 %114 
                                f32 %365 = OpLoad %364 
                                f32 %366 = OpFMul %363 %365 
                       Private f32* %367 = OpAccessChain %76 %114 
                                f32 %368 = OpLoad %367 
                                f32 %369 = OpFAdd %366 %368 
                       Private f32* %370 = OpAccessChain %54 %114 
                                             OpStore %370 %369 
                       Private f32* %371 = OpAccessChain %63 %114 
                                f32 %372 = OpLoad %371 
                                f32 %373 = OpLoad %358 
                                f32 %374 = OpFMul %372 %373 
                       Private f32* %375 = OpAccessChain %9 %114 
                                f32 %376 = OpLoad %375 
                                f32 %377 = OpFAdd %374 %376 
                       Private f32* %378 = OpAccessChain %9 %114 
                                             OpStore %378 %377 
                       Private f32* %379 = OpAccessChain %9 %114 
                                f32 %380 = OpLoad %379 
                       Private f32* %381 = OpAccessChain %54 %114 
                                f32 %382 = OpLoad %381 
                                f32 %383 = OpFDiv %380 %382 
                       Private f32* %384 = OpAccessChain %9 %114 
                                             OpStore %384 %383 
                              f32_4 %387 = OpLoad %9 
                              f32_3 %388 = OpVectorShuffle %387 %387 0 0 0 
                              f32_3 %389 = OpFNegate %388 
                              f32_3 %391 = OpFAdd %389 %390 
                              f32_4 %392 = OpLoad %386 
                              f32_4 %393 = OpVectorShuffle %392 %391 4 5 6 3 
                                             OpStore %386 %393 
                        Output f32* %396 = OpAccessChain %386 %394 
                                             OpStore %396 %19 
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