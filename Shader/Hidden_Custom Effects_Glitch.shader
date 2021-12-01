//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/Glitch" {
Properties {
}
SubShader {
 Pass {
  Name "Glitch"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1590
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
uniform 	vec4 _Time;
uniform 	float _Glitch;
uniform 	float _Noise;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat4;
int u_xlati4;
vec2 u_xlat8;
float u_xlat12;
int u_xlati12;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * 16.0;
    u_xlat0.yz = _Time.yy * vec2(4.0, 100.0);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat8.xy = u_xlat0.zz * vs_TEXCOORD0.xy;
    u_xlat8.x = dot(u_xlat8.xy, vec2(12.9898005, 78.2330017));
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 43758.5469;
    u_xlat0.z = fract(u_xlat8.x);
    u_xlat4.xy = u_xlat0.yz * vec2(37.5, 0.5);
    u_xlat0.x = u_xlat0.x * 0.0625 + u_xlat4.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat4.x = u_xlat0.x * _Time.y;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat0.x = u_xlat4.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 5.0 + vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xx * vec2(11.0, 7.0);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(0.0909090936, 0.142857149);
    u_xlat0.y = dot(u_xlat0.yy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.x = u_xlat0.y * 1.5;
    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat4.x;
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
    u_xlati12 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
    u_xlat0.x = abs(u_xlat0.x) + -0.600000024;
    u_xlat0.x = u_xlat0.x * 2.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlati4 = (-u_xlati4) + u_xlati12;
    u_xlat4.x = float(u_xlati4);
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat4.x = (-_Glitch) * u_xlat0.x + 10.5;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat12 = u_xlat0.x * _Glitch;
    u_xlat0.x = _Glitch * u_xlat0.x + -0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = abs(u_xlat12) * 3.0;
    u_xlat2.xy = vec2(u_xlat12) * vec2(0.100000001, 1.125);
    u_xlat4.x = (-u_xlat1.x) * u_xlat4.x + 1.0;
    u_xlat2.z = 0.0;
    u_xlat1.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1 = texture(_MainTex, u_xlat1.xy);
    u_xlat12 = dot(u_xlat1.xyz, vec3(-0.147129998, -0.288859993, 0.43599999));
    u_xlat3.x = u_xlat12 / u_xlat4.x;
    u_xlat4.x = dot(u_xlat1.xyz, vec3(0.61500001, -0.514989972, -0.10001));
    u_xlat3.y = u_xlat2.y * u_xlat0.x + u_xlat4.x;
    u_xlat0.x = dot(vec2(-0.394650012, -0.580600023), u_xlat3.xy);
    u_xlat4.x = dot(u_xlat1.xyz, vec3(-0.298999995, 0.587000012, 0.114));
    u_xlat2.y = u_xlat0.x + u_xlat4.x;
    u_xlat2.xz = u_xlat3.yx * vec2(1.13982999, 2.03210998) + u_xlat4.xx;
    u_xlat2.w = u_xlat1.w;
    u_xlat3 = (-u_xlat2) + vec4(0.0, 0.0, 0.0, 1.0);
    u_xlat0 = u_xlat4.yyyy * u_xlat3 + u_xlat2;
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + (-u_xlat1);
    SV_Target0 = vec4(vec4(_Noise, _Noise, _Noise, _Noise)) * u_xlat0 + u_xlat1;
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
; Bound: 425
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %12 %404 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD0 Location 12 
                                              OpMemberDecorate %23 0 Offset 23 
                                              OpMemberDecorate %23 1 Offset 23 
                                              OpMemberDecorate %23 2 Offset 23 
                                              OpDecorate %23 Block 
                                              OpDecorate %25 DescriptorSet 25 
                                              OpDecorate %25 Binding 25 
                                              OpDecorate %309 DescriptorSet 309 
                                              OpDecorate %309 Binding 309 
                                              OpDecorate %313 DescriptorSet 313 
                                              OpDecorate %313 Binding 313 
                                              OpDecorate %404 Location 404 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 2 
                                      %11 = OpTypePointer Input %10 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                      %13 = OpTypeInt 32 0 
                                  u32 %14 = OpConstant 1 
                                      %15 = OpTypePointer Input %6 
                                  f32 %18 = OpConstant 3.674022E-40 
                                  u32 %20 = OpConstant 0 
                                      %21 = OpTypePointer Private %6 
                                      %23 = OpTypeStruct %7 %6 %6 
                                      %24 = OpTypePointer Uniform %23 
   Uniform struct {f32_4; f32; f32;}* %25 = OpVariable Uniform 
                                      %26 = OpTypeInt 32 1 
                                  i32 %27 = OpConstant 0 
                                      %28 = OpTypePointer Uniform %7 
                                  f32 %32 = OpConstant 3.674022E-40 
                                  f32 %33 = OpConstant 3.674022E-40 
                                f32_2 %34 = OpConstantComposite %32 %33 
                                      %43 = OpTypePointer Private %10 
                       Private f32_2* %44 = OpVariable Private 
                                  f32 %50 = OpConstant 3.674022E-40 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_2 %52 = OpConstantComposite %50 %51 
                                  f32 %61 = OpConstant 3.674022E-40 
                                  u32 %67 = OpConstant 2 
                       Private f32_2* %69 = OpVariable Private 
                                  f32 %72 = OpConstant 3.674022E-40 
                                  f32 %73 = OpConstant 3.674022E-40 
                                f32_2 %74 = OpConstantComposite %72 %73 
                                  f32 %78 = OpConstant 3.674022E-40 
                                     %106 = OpTypePointer Uniform %6 
                                 f32 %123 = OpConstant 3.674022E-40 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 f32 %132 = OpConstant 3.674022E-40 
                               f32_2 %133 = OpConstantComposite %131 %132 
                                 f32 %144 = OpConstant 3.674022E-40 
                                 f32 %145 = OpConstant 3.674022E-40 
                               f32_2 %146 = OpConstantComposite %144 %145 
                               f32_2 %165 = OpConstantComposite %61 %61 
                                 f32 %176 = OpConstant 3.674022E-40 
                                 f32 %188 = OpConstant 3.674022E-40 
                                 f32 %190 = OpConstant 3.674022E-40 
                                     %193 = OpTypePointer Private %26 
                        Private i32* %194 = OpVariable Private 
                                 f32 %195 = OpConstant 3.674022E-40 
                                     %198 = OpTypeBool 
                                 u32 %200 = OpConstant 4294967295 
                        Private i32* %203 = OpVariable Private 
                                 f32 %212 = OpConstant 3.674022E-40 
                                 f32 %217 = OpConstant 3.674022E-40 
                                 f32 %222 = OpConstant 3.674022E-40 
                                 i32 %238 = OpConstant 1 
                                 f32 %245 = OpConstant 3.674022E-40 
                        Private f32* %252 = OpVariable Private 
                                 f32 %263 = OpConstant 3.674022E-40 
                      Private f32_4* %270 = OpVariable Private 
                                 f32 %273 = OpConstant 3.674022E-40 
                      Private f32_4* %276 = OpVariable Private 
                                 f32 %279 = OpConstant 3.674022E-40 
                                 f32 %280 = OpConstant 3.674022E-40 
                               f32_2 %281 = OpConstantComposite %279 %280 
                                     %307 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %308 = OpTypePointer UniformConstant %307 
UniformConstant read_only Texture2D* %309 = OpVariable UniformConstant 
                                     %311 = OpTypeSampler 
                                     %312 = OpTypePointer UniformConstant %311 
            UniformConstant sampler* %313 = OpVariable UniformConstant 
                                     %315 = OpTypeSampledImage %307 
                                     %320 = OpTypeVector %6 3 
                                 f32 %323 = OpConstant 3.674022E-40 
                                 f32 %324 = OpConstant 3.674022E-40 
                                 f32 %325 = OpConstant 3.674022E-40 
                               f32_3 %326 = OpConstantComposite %323 %324 %325 
                      Private f32_4* %328 = OpVariable Private 
                                 f32 %336 = OpConstant 3.674022E-40 
                                 f32 %337 = OpConstant 3.674022E-40 
                                 f32 %338 = OpConstant 3.674022E-40 
                               f32_3 %339 = OpConstantComposite %336 %337 %338 
                                 f32 %351 = OpConstant 3.674022E-40 
                                 f32 %352 = OpConstant 3.674022E-40 
                               f32_2 %353 = OpConstantComposite %351 %352 
                                 f32 %360 = OpConstant 3.674022E-40 
                                 f32 %361 = OpConstant 3.674022E-40 
                                 f32 %362 = OpConstant 3.674022E-40 
                               f32_3 %363 = OpConstantComposite %360 %361 %362 
                                 f32 %374 = OpConstant 3.674022E-40 
                                 f32 %375 = OpConstant 3.674022E-40 
                               f32_2 %376 = OpConstantComposite %374 %375 
                                 u32 %383 = OpConstant 3 
                               f32_4 %389 = OpConstantComposite %195 %195 %195 %222 
                               f32_4 %398 = OpConstantComposite %188 %188 %188 %188 
                                     %403 = OpTypePointer Output %7 
                       Output f32_4* %404 = OpVariable Output 
                                 i32 %405 = OpConstant 2 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                           Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                  f32 %17 = OpLoad %16 
                                  f32 %19 = OpFMul %17 %18 
                         Private f32* %22 = OpAccessChain %9 %20 
                                              OpStore %22 %19 
                       Uniform f32_4* %29 = OpAccessChain %25 %27 
                                f32_4 %30 = OpLoad %29 
                                f32_2 %31 = OpVectorShuffle %30 %30 1 1 
                                f32_2 %35 = OpFMul %31 %34 
                                f32_4 %36 = OpLoad %9 
                                f32_4 %37 = OpVectorShuffle %36 %35 0 4 5 3 
                                              OpStore %9 %37 
                                f32_4 %38 = OpLoad %9 
                                f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                f32_2 %40 = OpExtInst %1 8 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpVectorShuffle %41 %40 4 5 2 3 
                                              OpStore %9 %42 
                                f32_4 %45 = OpLoad %9 
                                f32_2 %46 = OpVectorShuffle %45 %45 2 2 
                                f32_2 %47 = OpLoad vs_TEXCOORD0 
                                f32_2 %48 = OpFMul %46 %47 
                                              OpStore %44 %48 
                                f32_2 %49 = OpLoad %44 
                                  f32 %53 = OpDot %49 %52 
                         Private f32* %54 = OpAccessChain %44 %20 
                                              OpStore %54 %53 
                         Private f32* %55 = OpAccessChain %44 %20 
                                  f32 %56 = OpLoad %55 
                                  f32 %57 = OpExtInst %1 13 %56 
                         Private f32* %58 = OpAccessChain %44 %20 
                                              OpStore %58 %57 
                         Private f32* %59 = OpAccessChain %44 %20 
                                  f32 %60 = OpLoad %59 
                                  f32 %62 = OpFMul %60 %61 
                         Private f32* %63 = OpAccessChain %44 %20 
                                              OpStore %63 %62 
                         Private f32* %64 = OpAccessChain %44 %20 
                                  f32 %65 = OpLoad %64 
                                  f32 %66 = OpExtInst %1 10 %65 
                         Private f32* %68 = OpAccessChain %9 %67 
                                              OpStore %68 %66 
                                f32_4 %70 = OpLoad %9 
                                f32_2 %71 = OpVectorShuffle %70 %70 1 2 
                                f32_2 %75 = OpFMul %71 %74 
                                              OpStore %69 %75 
                         Private f32* %76 = OpAccessChain %9 %20 
                                  f32 %77 = OpLoad %76 
                                  f32 %79 = OpFMul %77 %78 
                         Private f32* %80 = OpAccessChain %69 %20 
                                  f32 %81 = OpLoad %80 
                                  f32 %82 = OpFAdd %79 %81 
                         Private f32* %83 = OpAccessChain %9 %20 
                                              OpStore %83 %82 
                                f32_4 %84 = OpLoad %9 
                                f32_2 %85 = OpVectorShuffle %84 %84 0 0 
                                  f32 %86 = OpDot %85 %52 
                         Private f32* %87 = OpAccessChain %9 %20 
                                              OpStore %87 %86 
                         Private f32* %88 = OpAccessChain %9 %20 
                                  f32 %89 = OpLoad %88 
                                  f32 %90 = OpExtInst %1 13 %89 
                         Private f32* %91 = OpAccessChain %9 %20 
                                              OpStore %91 %90 
                         Private f32* %92 = OpAccessChain %9 %20 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFMul %93 %61 
                         Private f32* %95 = OpAccessChain %9 %20 
                                              OpStore %95 %94 
                         Private f32* %96 = OpAccessChain %9 %20 
                                  f32 %97 = OpLoad %96 
                                  f32 %98 = OpExtInst %1 10 %97 
                         Private f32* %99 = OpAccessChain %9 %20 
                                              OpStore %99 %98 
                        Private f32* %100 = OpAccessChain %9 %20 
                                 f32 %101 = OpLoad %100 
                                 f32 %102 = OpFMul %101 %18 
                        Private f32* %103 = OpAccessChain %9 %20 
                                              OpStore %103 %102 
                        Private f32* %104 = OpAccessChain %9 %20 
                                 f32 %105 = OpLoad %104 
                        Uniform f32* %107 = OpAccessChain %25 %27 %14 
                                 f32 %108 = OpLoad %107 
                                 f32 %109 = OpFMul %105 %108 
                        Private f32* %110 = OpAccessChain %69 %20 
                                              OpStore %110 %109 
                        Private f32* %111 = OpAccessChain %69 %20 
                                 f32 %112 = OpLoad %111 
                                 f32 %113 = OpExtInst %1 8 %112 
                        Private f32* %114 = OpAccessChain %69 %20 
                                              OpStore %114 %113 
                        Private f32* %115 = OpAccessChain %69 %20 
                                 f32 %116 = OpLoad %115 
                        Private f32* %117 = OpAccessChain %9 %20 
                                 f32 %118 = OpLoad %117 
                                 f32 %119 = OpFDiv %116 %118 
                        Private f32* %120 = OpAccessChain %9 %20 
                                              OpStore %120 %119 
                        Private f32* %121 = OpAccessChain %9 %20 
                                 f32 %122 = OpLoad %121 
                                 f32 %124 = OpFMul %122 %123 
                          Input f32* %125 = OpAccessChain vs_TEXCOORD0 %14 
                                 f32 %126 = OpLoad %125 
                                 f32 %127 = OpFAdd %124 %126 
                        Private f32* %128 = OpAccessChain %9 %20 
                                              OpStore %128 %127 
                               f32_4 %129 = OpLoad %9 
                               f32_2 %130 = OpVectorShuffle %129 %129 0 0 
                               f32_2 %134 = OpFMul %130 %133 
                               f32_4 %135 = OpLoad %9 
                               f32_4 %136 = OpVectorShuffle %135 %134 4 5 2 3 
                                              OpStore %9 %136 
                               f32_4 %137 = OpLoad %9 
                               f32_2 %138 = OpVectorShuffle %137 %137 0 1 
                               f32_2 %139 = OpExtInst %1 8 %138 
                               f32_4 %140 = OpLoad %9 
                               f32_4 %141 = OpVectorShuffle %140 %139 4 5 2 3 
                                              OpStore %9 %141 
                               f32_4 %142 = OpLoad %9 
                               f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                               f32_2 %147 = OpFMul %143 %146 
                               f32_4 %148 = OpLoad %9 
                               f32_4 %149 = OpVectorShuffle %148 %147 4 5 2 3 
                                              OpStore %9 %149 
                               f32_4 %150 = OpLoad %9 
                               f32_2 %151 = OpVectorShuffle %150 %150 1 1 
                                 f32 %152 = OpDot %151 %52 
                        Private f32* %153 = OpAccessChain %9 %14 
                                              OpStore %153 %152 
                               f32_4 %154 = OpLoad %9 
                               f32_2 %155 = OpVectorShuffle %154 %154 0 0 
                                 f32 %156 = OpDot %155 %52 
                        Private f32* %157 = OpAccessChain %9 %20 
                                              OpStore %157 %156 
                               f32_4 %158 = OpLoad %9 
                               f32_2 %159 = OpVectorShuffle %158 %158 0 1 
                               f32_2 %160 = OpExtInst %1 13 %159 
                               f32_4 %161 = OpLoad %9 
                               f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                              OpStore %9 %162 
                               f32_4 %163 = OpLoad %9 
                               f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                               f32_2 %166 = OpFMul %164 %165 
                               f32_4 %167 = OpLoad %9 
                               f32_4 %168 = OpVectorShuffle %167 %166 4 5 2 3 
                                              OpStore %9 %168 
                               f32_4 %169 = OpLoad %9 
                               f32_2 %170 = OpVectorShuffle %169 %169 0 1 
                               f32_2 %171 = OpExtInst %1 10 %170 
                               f32_4 %172 = OpLoad %9 
                               f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                              OpStore %9 %173 
                        Private f32* %174 = OpAccessChain %9 %14 
                                 f32 %175 = OpLoad %174 
                                 f32 %177 = OpFMul %175 %176 
                        Private f32* %178 = OpAccessChain %69 %20 
                                              OpStore %178 %177 
                        Private f32* %179 = OpAccessChain %9 %20 
                                 f32 %180 = OpLoad %179 
                                 f32 %181 = OpFMul %180 %73 
                        Private f32* %182 = OpAccessChain %69 %20 
                                 f32 %183 = OpLoad %182 
                                 f32 %184 = OpFAdd %181 %183 
                        Private f32* %185 = OpAccessChain %9 %20 
                                              OpStore %185 %184 
                        Private f32* %186 = OpAccessChain %9 %20 
                                 f32 %187 = OpLoad %186 
                                 f32 %189 = OpFMul %187 %188 
                                 f32 %191 = OpFAdd %189 %190 
                        Private f32* %192 = OpAccessChain %9 %20 
                                              OpStore %192 %191 
                        Private f32* %196 = OpAccessChain %9 %20 
                                 f32 %197 = OpLoad %196 
                                bool %199 = OpFOrdLessThan %195 %197 
                                 u32 %201 = OpSelect %199 %200 %20 
                                 i32 %202 = OpBitcast %201 
                                              OpStore %194 %202 
                        Private f32* %204 = OpAccessChain %9 %20 
                                 f32 %205 = OpLoad %204 
                                bool %206 = OpFOrdLessThan %205 %195 
                                 u32 %207 = OpSelect %206 %200 %20 
                                 i32 %208 = OpBitcast %207 
                                              OpStore %203 %208 
                        Private f32* %209 = OpAccessChain %9 %20 
                                 f32 %210 = OpLoad %209 
                                 f32 %211 = OpExtInst %1 4 %210 
                                 f32 %213 = OpFAdd %211 %212 
                        Private f32* %214 = OpAccessChain %9 %20 
                                              OpStore %214 %213 
                        Private f32* %215 = OpAccessChain %9 %20 
                                 f32 %216 = OpLoad %215 
                                 f32 %218 = OpFMul %216 %217 
                        Private f32* %219 = OpAccessChain %9 %20 
                                              OpStore %219 %218 
                        Private f32* %220 = OpAccessChain %9 %20 
                                 f32 %221 = OpLoad %220 
                                 f32 %223 = OpExtInst %1 43 %221 %195 %222 
                        Private f32* %224 = OpAccessChain %9 %20 
                                              OpStore %224 %223 
                                 i32 %225 = OpLoad %194 
                                 i32 %226 = OpSNegate %225 
                                 i32 %227 = OpLoad %203 
                                 i32 %228 = OpIAdd %226 %227 
                                              OpStore %194 %228 
                                 i32 %229 = OpLoad %194 
                                 f32 %230 = OpConvertSToF %229 
                        Private f32* %231 = OpAccessChain %69 %20 
                                              OpStore %231 %230 
                        Private f32* %232 = OpAccessChain %9 %20 
                                 f32 %233 = OpLoad %232 
                        Private f32* %234 = OpAccessChain %69 %20 
                                 f32 %235 = OpLoad %234 
                                 f32 %236 = OpFMul %233 %235 
                        Private f32* %237 = OpAccessChain %9 %20 
                                              OpStore %237 %236 
                        Uniform f32* %239 = OpAccessChain %25 %238 
                                 f32 %240 = OpLoad %239 
                                 f32 %241 = OpFNegate %240 
                        Private f32* %242 = OpAccessChain %9 %20 
                                 f32 %243 = OpLoad %242 
                                 f32 %244 = OpFMul %241 %243 
                                 f32 %246 = OpFAdd %244 %245 
                        Private f32* %247 = OpAccessChain %69 %20 
                                              OpStore %247 %246 
                        Private f32* %248 = OpAccessChain %69 %20 
                                 f32 %249 = OpLoad %248 
                                 f32 %250 = OpExtInst %1 43 %249 %195 %222 
                        Private f32* %251 = OpAccessChain %69 %20 
                                              OpStore %251 %250 
                        Private f32* %253 = OpAccessChain %9 %20 
                                 f32 %254 = OpLoad %253 
                        Uniform f32* %255 = OpAccessChain %25 %238 
                                 f32 %256 = OpLoad %255 
                                 f32 %257 = OpFMul %254 %256 
                                              OpStore %252 %257 
                        Uniform f32* %258 = OpAccessChain %25 %238 
                                 f32 %259 = OpLoad %258 
                        Private f32* %260 = OpAccessChain %9 %20 
                                 f32 %261 = OpLoad %260 
                                 f32 %262 = OpFMul %259 %261 
                                 f32 %264 = OpFAdd %262 %263 
                        Private f32* %265 = OpAccessChain %9 %20 
                                              OpStore %265 %264 
                        Private f32* %266 = OpAccessChain %9 %20 
                                 f32 %267 = OpLoad %266 
                                 f32 %268 = OpExtInst %1 43 %267 %195 %222 
                        Private f32* %269 = OpAccessChain %9 %20 
                                              OpStore %269 %268 
                                 f32 %271 = OpLoad %252 
                                 f32 %272 = OpExtInst %1 4 %271 
                                 f32 %274 = OpFMul %272 %273 
                        Private f32* %275 = OpAccessChain %270 %20 
                                              OpStore %275 %274 
                                 f32 %277 = OpLoad %252 
                               f32_2 %278 = OpCompositeConstruct %277 %277 
                               f32_2 %282 = OpFMul %278 %281 
                               f32_4 %283 = OpLoad %276 
                               f32_4 %284 = OpVectorShuffle %283 %282 4 5 2 3 
                                              OpStore %276 %284 
                        Private f32* %285 = OpAccessChain %270 %20 
                                 f32 %286 = OpLoad %285 
                                 f32 %287 = OpFNegate %286 
                        Private f32* %288 = OpAccessChain %69 %20 
                                 f32 %289 = OpLoad %288 
                                 f32 %290 = OpFMul %287 %289 
                                 f32 %291 = OpFAdd %290 %222 
                        Private f32* %292 = OpAccessChain %69 %20 
                                              OpStore %292 %291 
                        Private f32* %293 = OpAccessChain %276 %67 
                                              OpStore %293 %195 
                               f32_4 %294 = OpLoad %276 
                               f32_2 %295 = OpVectorShuffle %294 %294 0 2 
                               f32_2 %296 = OpLoad vs_TEXCOORD0 
                               f32_2 %297 = OpFAdd %295 %296 
                               f32_4 %298 = OpLoad %270 
                               f32_4 %299 = OpVectorShuffle %298 %297 4 5 2 3 
                                              OpStore %270 %299 
                               f32_4 %300 = OpLoad %270 
                               f32_2 %301 = OpVectorShuffle %300 %300 0 1 
                               f32_2 %302 = OpCompositeConstruct %195 %195 
                               f32_2 %303 = OpCompositeConstruct %222 %222 
                               f32_2 %304 = OpExtInst %1 43 %301 %302 %303 
                               f32_4 %305 = OpLoad %270 
                               f32_4 %306 = OpVectorShuffle %305 %304 4 5 2 3 
                                              OpStore %270 %306 
                 read_only Texture2D %310 = OpLoad %309 
                             sampler %314 = OpLoad %313 
          read_only Texture2DSampled %316 = OpSampledImage %310 %314 
                               f32_4 %317 = OpLoad %270 
                               f32_2 %318 = OpVectorShuffle %317 %317 0 1 
                               f32_4 %319 = OpImageSampleImplicitLod %316 %318 
                                              OpStore %270 %319 
                               f32_4 %321 = OpLoad %270 
                               f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                 f32 %327 = OpDot %322 %326 
                                              OpStore %252 %327 
                                 f32 %329 = OpLoad %252 
                        Private f32* %330 = OpAccessChain %69 %20 
                                 f32 %331 = OpLoad %330 
                                 f32 %332 = OpFDiv %329 %331 
                        Private f32* %333 = OpAccessChain %328 %20 
                                              OpStore %333 %332 
                               f32_4 %334 = OpLoad %270 
                               f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                                 f32 %340 = OpDot %335 %339 
                        Private f32* %341 = OpAccessChain %69 %20 
                                              OpStore %341 %340 
                        Private f32* %342 = OpAccessChain %276 %14 
                                 f32 %343 = OpLoad %342 
                        Private f32* %344 = OpAccessChain %9 %20 
                                 f32 %345 = OpLoad %344 
                                 f32 %346 = OpFMul %343 %345 
                        Private f32* %347 = OpAccessChain %69 %20 
                                 f32 %348 = OpLoad %347 
                                 f32 %349 = OpFAdd %346 %348 
                        Private f32* %350 = OpAccessChain %328 %14 
                                              OpStore %350 %349 
                               f32_4 %354 = OpLoad %328 
                               f32_2 %355 = OpVectorShuffle %354 %354 0 1 
                                 f32 %356 = OpDot %353 %355 
                        Private f32* %357 = OpAccessChain %9 %20 
                                              OpStore %357 %356 
                               f32_4 %358 = OpLoad %270 
                               f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                 f32 %364 = OpDot %359 %363 
                        Private f32* %365 = OpAccessChain %69 %20 
                                              OpStore %365 %364 
                        Private f32* %366 = OpAccessChain %9 %20 
                                 f32 %367 = OpLoad %366 
                        Private f32* %368 = OpAccessChain %69 %20 
                                 f32 %369 = OpLoad %368 
                                 f32 %370 = OpFAdd %367 %369 
                        Private f32* %371 = OpAccessChain %276 %14 
                                              OpStore %371 %370 
                               f32_4 %372 = OpLoad %328 
                               f32_2 %373 = OpVectorShuffle %372 %372 1 0 
                               f32_2 %377 = OpFMul %373 %376 
                               f32_2 %378 = OpLoad %69 
                               f32_2 %379 = OpVectorShuffle %378 %378 0 0 
                               f32_2 %380 = OpFAdd %377 %379 
                               f32_4 %381 = OpLoad %276 
                               f32_4 %382 = OpVectorShuffle %381 %380 4 1 5 3 
                                              OpStore %276 %382 
                        Private f32* %384 = OpAccessChain %270 %383 
                                 f32 %385 = OpLoad %384 
                        Private f32* %386 = OpAccessChain %276 %383 
                                              OpStore %386 %385 
                               f32_4 %387 = OpLoad %276 
                               f32_4 %388 = OpFNegate %387 
                               f32_4 %390 = OpFAdd %388 %389 
                                              OpStore %328 %390 
                               f32_2 %391 = OpLoad %69 
                               f32_4 %392 = OpVectorShuffle %391 %391 1 1 1 1 
                               f32_4 %393 = OpLoad %328 
                               f32_4 %394 = OpFMul %392 %393 
                               f32_4 %395 = OpLoad %276 
                               f32_4 %396 = OpFAdd %394 %395 
                                              OpStore %9 %396 
                               f32_4 %397 = OpLoad %9 
                               f32_4 %399 = OpFMul %397 %398 
                               f32_4 %400 = OpLoad %270 
                               f32_4 %401 = OpFNegate %400 
                               f32_4 %402 = OpFAdd %399 %401 
                                              OpStore %9 %402 
                        Uniform f32* %406 = OpAccessChain %25 %405 
                                 f32 %407 = OpLoad %406 
                        Uniform f32* %408 = OpAccessChain %25 %405 
                                 f32 %409 = OpLoad %408 
                        Uniform f32* %410 = OpAccessChain %25 %405 
                                 f32 %411 = OpLoad %410 
                        Uniform f32* %412 = OpAccessChain %25 %405 
                                 f32 %413 = OpLoad %412 
                               f32_4 %414 = OpCompositeConstruct %407 %409 %411 %413 
                                 f32 %415 = OpCompositeExtract %414 0 
                                 f32 %416 = OpCompositeExtract %414 1 
                                 f32 %417 = OpCompositeExtract %414 2 
                                 f32 %418 = OpCompositeExtract %414 3 
                               f32_4 %419 = OpCompositeConstruct %415 %416 %417 %418 
                               f32_4 %420 = OpLoad %9 
                               f32_4 %421 = OpFMul %419 %420 
                               f32_4 %422 = OpLoad %270 
                               f32_4 %423 = OpFAdd %421 %422 
                                              OpStore %404 %423 
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