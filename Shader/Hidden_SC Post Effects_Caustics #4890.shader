//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Caustics" {
Properties {
}
SubShader {
 Pass {
  Name "Caustics"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 36535
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 hlslcc_mtx4x4clipToWorld[4];
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec3 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4clipToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4clipToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4clipToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _Time;
uniform 	vec4 _FadeParams;
uniform 	vec4 _CausticsParams;
uniform 	vec4 _HeightParams;
uniform 	float _LuminanceThreshold;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform  sampler2D _CausticsTex;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat3.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = u_xlat0.x * _ZBufferParams.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.xyz = vs_TEXCOORD2.xyz * u_xlat3.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat1.xy = u_xlat3.xz * _CausticsParams.xx;
    u_xlat7.xy = _Time.yy * _CausticsParams.yz;
    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + (-u_xlat7.xy);
    u_xlat7.xy = u_xlat3.xz * _CausticsParams.xx + u_xlat7.xy;
    u_xlat2 = texture(_CausticsTex, u_xlat7.xy);
    u_xlat1 = texture(_CausticsTex, u_xlat1.xy);
    u_xlat1.xyz = min(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _CausticsParams.www;
    u_xlat2.xy = u_xlat3.yy + (-_HeightParams.xz);
    u_xlat3.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + _FadeParams.y;
    u_xlat6.xy = _HeightParams.yw + vec2(-0.00999999978, 0.00999999978);
    u_xlat10 = (-u_xlat6.x) + _HeightParams.x;
    u_xlat10 = (-u_xlat2.x) + u_xlat10;
    u_xlat6.x = u_xlat10 / (-u_xlat6.x);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat10 = u_xlat6.y + _HeightParams.z;
    u_xlat10 = (-u_xlat2.y) + u_xlat10;
    u_xlat9 = u_xlat10 / u_xlat6.y;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat9;
    u_xlat9 = float(1.0) / _LuminanceThreshold;
    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat10 = dot(u_xlat2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat9 = u_xlat9 * u_xlat10;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10 = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat10;
    u_xlat6.x = u_xlat9 * u_xlat6.x;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz;
    u_xlat6.x = (-unity_OrthoParams.w) + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = (-unity_OrthoParams.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlatb0 = 0.99000001<u_xlat0.x;
    u_xlat0.xzw = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat1.x = (-_FadeParams.x) + _FadeParams.y;
    u_xlat3.x = u_xlat3.x / u_xlat1.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlatb1 = _FadeParams.w!=0.0;
    u_xlat3.x = (u_xlatb1) ? u_xlat3.x : 1.0;
    SV_Target0.xyz = u_xlat0.xzw * u_xlat3.xxx + u_xlat2.xyz;
    SV_Target0.w = u_xlat2.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 117
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Vertex %4 "main" %13 %18 %50 %74 %104 
                                                OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                                OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                                OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                                OpDecorate %11 Block 
                                                OpDecorate %18 Location 18 
                                                OpDecorate vs_TEXCOORD1 Location 50 
                                                OpDecorate %54 ArrayStride 54 
                                                OpMemberDecorate %55 0 Offset 55 
                                                OpMemberDecorate %55 1 Offset 55 
                                                OpMemberDecorate %55 2 Offset 55 
                                                OpDecorate %55 Block 
                                                OpDecorate %57 DescriptorSet 57 
                                                OpDecorate %57 Binding 57 
                                                OpDecorate vs_TEXCOORD0 Location 74 
                                                OpDecorate vs_TEXCOORD2 Location 104 
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
                                        %32 = OpTypePointer Private %16 
                         Private f32_3* %33 = OpVariable Private 
                                  f32_2 %36 = OpConstantComposite %27 %27 
                                    f32 %42 = OpConstant 3.674022E-40 
                                    f32 %43 = OpConstant 3.674022E-40 
                                  f32_2 %44 = OpConstantComposite %42 %43 
                                        %49 = OpTypePointer Output %19 
                 Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                    u32 %53 = OpConstant 4 
                                        %54 = OpTypeArray %7 %53 
                                        %55 = OpTypeStruct %16 %6 %54 
                                        %56 = OpTypePointer Uniform %55 
Uniform struct {f32_3; f32; f32_4[4];}* %57 = OpVariable Uniform 
                                    i32 %58 = OpConstant 1 
                                        %59 = OpTypePointer Uniform %6 
                                    f32 %66 = OpConstant 3.674022E-40 
                                  f32_2 %67 = OpConstantComposite %66 %66 
                                    f32 %69 = OpConstant 3.674022E-40 
                                  f32_2 %70 = OpConstantComposite %69 %69 
                 Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                  f32_2 %78 = OpConstantComposite %42 %42 
                         Private f32_3* %80 = OpVariable Private 
                                    i32 %83 = OpConstant 2 
                                        %84 = OpTypePointer Uniform %7 
                                    i32 %98 = OpConstant 3 
                                       %103 = OpTypePointer Output %16 
                 Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                       %106 = OpTypePointer Uniform %16 
                                       %111 = OpTypePointer Output %6 
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
                                  f32_3 %38 = OpLoad %33 
                                  f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
                                                OpStore %33 %39 
                                  f32_3 %40 = OpLoad %33 
                                  f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                  f32_2 %45 = OpFMul %41 %44 
                                  f32_2 %46 = OpFAdd %45 %28 
                                  f32_3 %47 = OpLoad %33 
                                  f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
                                                OpStore %33 %48 
                                  f32_3 %51 = OpLoad %33 
                                  f32_2 %52 = OpVectorShuffle %51 %51 0 1 
                           Uniform f32* %60 = OpAccessChain %57 %58 
                                    f32 %61 = OpLoad %60 
                                  f32_2 %62 = OpCompositeConstruct %61 %61 
                                  f32_2 %63 = OpFMul %52 %62 
                                                OpStore vs_TEXCOORD1 %63 
                                  f32_3 %64 = OpLoad %33 
                                  f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                  f32_2 %68 = OpFMul %65 %67 
                                  f32_2 %71 = OpFAdd %68 %70 
                                  f32_3 %72 = OpLoad %33 
                                  f32_3 %73 = OpVectorShuffle %72 %71 3 4 2 
                                                OpStore %33 %73 
                                  f32_3 %75 = OpLoad %18 
                                  f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                  f32_2 %77 = OpFMul %76 %44 
                                  f32_2 %79 = OpFAdd %77 %78 
                                                OpStore vs_TEXCOORD0 %79 
                                  f32_3 %81 = OpLoad %33 
                                  f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                         Uniform f32_4* %85 = OpAccessChain %57 %83 %58 
                                  f32_4 %86 = OpLoad %85 
                                  f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                  f32_3 %88 = OpFMul %82 %87 
                                                OpStore %80 %88 
                         Uniform f32_4* %89 = OpAccessChain %57 %83 %15 
                                  f32_4 %90 = OpLoad %89 
                                  f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                  f32_3 %92 = OpLoad %33 
                                  f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                  f32_3 %94 = OpFMul %91 %93 
                                  f32_3 %95 = OpLoad %80 
                                  f32_3 %96 = OpFAdd %94 %95 
                                                OpStore %33 %96 
                                  f32_3 %97 = OpLoad %33 
                         Uniform f32_4* %99 = OpAccessChain %57 %83 %98 
                                 f32_4 %100 = OpLoad %99 
                                 f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                 f32_3 %102 = OpFAdd %97 %101 
                                                OpStore %33 %102 
                                 f32_3 %105 = OpLoad %33 
                        Uniform f32_3* %107 = OpAccessChain %57 %15 
                                 f32_3 %108 = OpLoad %107 
                                 f32_3 %109 = OpFNegate %108 
                                 f32_3 %110 = OpFAdd %105 %109 
                                                OpStore vs_TEXCOORD2 %110 
                           Output f32* %112 = OpAccessChain %13 %15 %9 
                                   f32 %113 = OpLoad %112 
                                   f32 %114 = OpFNegate %113 
                           Output f32* %115 = OpAccessChain %13 %15 %9 
                                                OpStore %115 %114 
                                                OpReturn
                                                OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 360
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %62 %344 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 22 
                                                      OpMemberDecorate %33 0 Offset 33 
                                                      OpMemberDecorate %33 1 Offset 33 
                                                      OpMemberDecorate %33 2 Offset 33 
                                                      OpMemberDecorate %33 3 Offset 33 
                                                      OpMemberDecorate %33 4 Offset 33 
                                                      OpMemberDecorate %33 5 Offset 33 
                                                      OpMemberDecorate %33 6 Offset 33 
                                                      OpMemberDecorate %33 7 Offset 33 
                                                      OpDecorate %33 Block 
                                                      OpDecorate %35 DescriptorSet 35 
                                                      OpDecorate %35 Binding 35 
                                                      OpDecorate vs_TEXCOORD2 Location 62 
                                                      OpDecorate %112 DescriptorSet 112 
                                                      OpDecorate %112 Binding 112 
                                                      OpDecorate %114 DescriptorSet 114 
                                                      OpDecorate %114 Binding 114 
                                                      OpDecorate %227 DescriptorSet 227 
                                                      OpDecorate %227 Binding 227 
                                                      OpDecorate %344 Location 344 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                              %30 = OpTypeVector %6 3 
                                              %31 = OpTypePointer Private %30 
                               Private f32_3* %32 = OpVariable Private 
                                              %33 = OpTypeStruct %30 %7 %7 %7 %7 %7 %7 %6 
                                              %34 = OpTypePointer Uniform %33 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32;}* %35 = OpVariable Uniform 
                                              %36 = OpTypeInt 32 1 
                                          i32 %37 = OpConstant 2 
                                          u32 %38 = OpConstant 2 
                                              %39 = OpTypePointer Uniform %6 
                                          u32 %45 = OpConstant 3 
                                          f32 %56 = OpConstant 3.674022E-40 
                                              %61 = OpTypePointer Input %30 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                          i32 %67 = OpConstant 0 
                                              %68 = OpTypePointer Uniform %30 
                               Private f32_3* %72 = OpVariable Private 
                                          i32 %75 = OpConstant 5 
                                              %76 = OpTypePointer Uniform %7 
                                              %83 = OpTypePointer Private %20 
                               Private f32_2* %84 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                              Private f32_4* %111 = OpVariable Private 
        UniformConstant read_only Texture2D* %112 = OpVariable UniformConstant 
                    UniformConstant sampler* %114 = OpVariable UniformConstant 
                                         i32 %140 = OpConstant 6 
                                         i32 %164 = OpConstant 4 
                                         u32 %165 = OpConstant 1 
                              Private f32_2* %170 = OpVariable Private 
                                         f32 %174 = OpConstant 3.674022E-40 
                                         f32 %175 = OpConstant 3.674022E-40 
                                       f32_2 %176 = OpConstantComposite %174 %175 
                                Private f32* %178 = OpVariable Private 
                                         f32 %198 = OpConstant 3.674022E-40 
                                Private f32* %211 = OpVariable Private 
                                         i32 %223 = OpConstant 7 
        UniformConstant read_only Texture2D* %227 = OpVariable UniformConstant 
                                         f32 %235 = OpConstant 3.674022E-40 
                                         f32 %236 = OpConstant 3.674022E-40 
                                         f32 %237 = OpConstant 3.674022E-40 
                                       f32_3 %238 = OpConstantComposite %235 %236 %237 
                                         f32 %246 = OpConstant 3.674022E-40 
                                         f32 %248 = OpConstant 3.674022E-40 
                                         i32 %265 = OpConstant 1 
                                             %294 = OpTypeBool 
                                             %295 = OpTypePointer Private %294 
                               Private bool* %296 = OpVariable Private 
                                         f32 %297 = OpConstant 3.674022E-40 
                                             %302 = OpTypePointer Function %30 
                                       f32_3 %306 = OpConstantComposite %198 %198 %198 
                               Private bool* %329 = OpVariable Private 
                                             %334 = OpTypePointer Function %6 
                                             %343 = OpTypePointer Output %7 
                               Output f32_4* %344 = OpVariable Output 
                                             %357 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %303 = OpVariable Function 
                               Function f32* %335 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                                      OpStore %29 %27 
                                 Uniform f32* %40 = OpAccessChain %35 %37 %38 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %9 %26 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                 Uniform f32* %46 = OpAccessChain %35 %37 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %32 %26 
                                                      OpStore %49 %48 
                                 Private f32* %50 = OpAccessChain %9 %26 
                                          f32 %51 = OpLoad %50 
                                 Uniform f32* %52 = OpAccessChain %35 %37 %26 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %51 %53 
                                 Private f32* %55 = OpAccessChain %9 %26 
                                                      OpStore %55 %54 
                                 Private f32* %57 = OpAccessChain %32 %26 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFDiv %56 %58 
                                 Private f32* %60 = OpAccessChain %32 %26 
                                                      OpStore %60 %59 
                                        f32_3 %63 = OpLoad vs_TEXCOORD2 
                                        f32_3 %64 = OpLoad %32 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 0 0 
                                        f32_3 %66 = OpFMul %63 %65 
                               Uniform f32_3* %69 = OpAccessChain %35 %67 
                                        f32_3 %70 = OpLoad %69 
                                        f32_3 %71 = OpFAdd %66 %70 
                                                      OpStore %32 %71 
                                        f32_3 %73 = OpLoad %32 
                                        f32_2 %74 = OpVectorShuffle %73 %73 0 2 
                               Uniform f32_4* %77 = OpAccessChain %35 %75 
                                        f32_4 %78 = OpLoad %77 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 0 
                                        f32_2 %80 = OpFMul %74 %79 
                                        f32_3 %81 = OpLoad %72 
                                        f32_3 %82 = OpVectorShuffle %81 %80 3 4 2 
                                                      OpStore %72 %82 
                               Uniform f32_4* %86 = OpAccessChain %35 %85 
                                        f32_4 %87 = OpLoad %86 
                                        f32_2 %88 = OpVectorShuffle %87 %87 1 1 
                               Uniform f32_4* %89 = OpAccessChain %35 %75 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 1 2 
                                        f32_2 %92 = OpFMul %88 %91 
                                                      OpStore %84 %92 
                                        f32_3 %93 = OpLoad %72 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_2 %98 = OpLoad %84 
                                        f32_2 %99 = OpFNegate %98 
                                       f32_2 %100 = OpFAdd %97 %99 
                                       f32_3 %101 = OpLoad %72 
                                       f32_3 %102 = OpVectorShuffle %101 %100 3 4 2 
                                                      OpStore %72 %102 
                                       f32_3 %103 = OpLoad %32 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 2 
                              Uniform f32_4* %105 = OpAccessChain %35 %75 
                                       f32_4 %106 = OpLoad %105 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 0 
                                       f32_2 %108 = OpFMul %104 %107 
                                       f32_2 %109 = OpLoad %84 
                                       f32_2 %110 = OpFAdd %108 %109 
                                                      OpStore %84 %110 
                         read_only Texture2D %113 = OpLoad %112 
                                     sampler %115 = OpLoad %114 
                  read_only Texture2DSampled %116 = OpSampledImage %113 %115 
                                       f32_2 %117 = OpLoad %84 
                                       f32_4 %118 = OpImageSampleImplicitLod %116 %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_4 %120 = OpLoad %111 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %111 %121 
                         read_only Texture2D %122 = OpLoad %112 
                                     sampler %123 = OpLoad %114 
                  read_only Texture2DSampled %124 = OpSampledImage %122 %123 
                                       f32_3 %125 = OpLoad %72 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_4 %127 = OpImageSampleImplicitLod %124 %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                                      OpStore %72 %128 
                                       f32_3 %129 = OpLoad %72 
                                       f32_4 %130 = OpLoad %111 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpExtInst %1 37 %129 %131 
                                                      OpStore %72 %132 
                                       f32_3 %133 = OpLoad %72 
                              Uniform f32_4* %134 = OpAccessChain %35 %75 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 3 3 3 
                                       f32_3 %137 = OpFMul %133 %136 
                                                      OpStore %72 %137 
                                       f32_3 %138 = OpLoad %32 
                                       f32_2 %139 = OpVectorShuffle %138 %138 1 1 
                              Uniform f32_4* %141 = OpAccessChain %35 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 2 
                                       f32_2 %144 = OpFNegate %143 
                                       f32_2 %145 = OpFAdd %139 %144 
                                       f32_4 %146 = OpLoad %111 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %111 %147 
                                       f32_3 %148 = OpLoad %32 
                                       f32_3 %149 = OpFNegate %148 
                              Uniform f32_3* %150 = OpAccessChain %35 %67 
                                       f32_3 %151 = OpLoad %150 
                                       f32_3 %152 = OpFAdd %149 %151 
                                                      OpStore %32 %152 
                                       f32_3 %153 = OpLoad %32 
                                       f32_3 %154 = OpLoad %32 
                                         f32 %155 = OpDot %153 %154 
                                Private f32* %156 = OpAccessChain %32 %26 
                                                      OpStore %156 %155 
                                Private f32* %157 = OpAccessChain %32 %26 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpExtInst %1 31 %158 
                                Private f32* %160 = OpAccessChain %32 %26 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %32 %26 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                Uniform f32* %166 = OpAccessChain %35 %164 %165 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFAdd %163 %167 
                                Private f32* %169 = OpAccessChain %32 %26 
                                                      OpStore %169 %168 
                              Uniform f32_4* %171 = OpAccessChain %35 %140 
                                       f32_4 %172 = OpLoad %171 
                                       f32_2 %173 = OpVectorShuffle %172 %172 1 3 
                                       f32_2 %177 = OpFAdd %173 %176 
                                                      OpStore %170 %177 
                                Private f32* %179 = OpAccessChain %170 %26 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFNegate %180 
                                Uniform f32* %182 = OpAccessChain %35 %140 %26 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFAdd %181 %183 
                                                      OpStore %178 %184 
                                Private f32* %185 = OpAccessChain %111 %26 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFNegate %186 
                                         f32 %188 = OpLoad %178 
                                         f32 %189 = OpFAdd %187 %188 
                                                      OpStore %178 %189 
                                         f32 %190 = OpLoad %178 
                                Private f32* %191 = OpAccessChain %170 %26 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFNegate %192 
                                         f32 %194 = OpFDiv %190 %193 
                                Private f32* %195 = OpAccessChain %170 %26 
                                                      OpStore %195 %194 
                                Private f32* %196 = OpAccessChain %170 %26 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpExtInst %1 43 %197 %198 %56 
                                Private f32* %200 = OpAccessChain %170 %26 
                                                      OpStore %200 %199 
                                Private f32* %201 = OpAccessChain %170 %165 
                                         f32 %202 = OpLoad %201 
                                Uniform f32* %203 = OpAccessChain %35 %140 %38 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFAdd %202 %204 
                                                      OpStore %178 %205 
                                Private f32* %206 = OpAccessChain %111 %165 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpLoad %178 
                                         f32 %210 = OpFAdd %208 %209 
                                                      OpStore %178 %210 
                                         f32 %212 = OpLoad %178 
                                Private f32* %213 = OpAccessChain %170 %165 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFDiv %212 %214 
                                                      OpStore %211 %215 
                                         f32 %216 = OpLoad %211 
                                         f32 %217 = OpExtInst %1 43 %216 %198 %56 
                                                      OpStore %211 %217 
                                Private f32* %218 = OpAccessChain %170 %26 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpLoad %211 
                                         f32 %221 = OpFMul %219 %220 
                                Private f32* %222 = OpAccessChain %170 %26 
                                                      OpStore %222 %221 
                                Uniform f32* %224 = OpAccessChain %35 %223 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFDiv %56 %225 
                                                      OpStore %211 %226 
                         read_only Texture2D %228 = OpLoad %227 
                                     sampler %229 = OpLoad %16 
                  read_only Texture2DSampled %230 = OpSampledImage %228 %229 
                                       f32_2 %231 = OpLoad vs_TEXCOORD1 
                                       f32_4 %232 = OpImageSampleImplicitLod %230 %231 
                                                      OpStore %111 %232 
                                       f32_4 %233 = OpLoad %111 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                         f32 %239 = OpDot %234 %238 
                                                      OpStore %178 %239 
                                         f32 %240 = OpLoad %211 
                                         f32 %241 = OpLoad %178 
                                         f32 %242 = OpFMul %240 %241 
                                                      OpStore %211 %242 
                                         f32 %243 = OpLoad %211 
                                         f32 %244 = OpExtInst %1 43 %243 %198 %56 
                                                      OpStore %211 %244 
                                         f32 %245 = OpLoad %211 
                                         f32 %247 = OpFMul %245 %246 
                                         f32 %249 = OpFAdd %247 %248 
                                                      OpStore %178 %249 
                                         f32 %250 = OpLoad %211 
                                         f32 %251 = OpLoad %211 
                                         f32 %252 = OpFMul %250 %251 
                                                      OpStore %211 %252 
                                         f32 %253 = OpLoad %211 
                                         f32 %254 = OpLoad %178 
                                         f32 %255 = OpFMul %253 %254 
                                                      OpStore %211 %255 
                                         f32 %256 = OpLoad %211 
                                Private f32* %257 = OpAccessChain %170 %26 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                Private f32* %260 = OpAccessChain %170 %26 
                                                      OpStore %260 %259 
                                       f32_2 %261 = OpLoad %170 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 0 0 
                                       f32_3 %263 = OpLoad %72 
                                       f32_3 %264 = OpFMul %262 %263 
                                                      OpStore %72 %264 
                                Uniform f32* %266 = OpAccessChain %35 %265 %45 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFNegate %267 
                                         f32 %269 = OpFAdd %268 %56 
                                Private f32* %270 = OpAccessChain %170 %26 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %170 %26 
                                         f32 %272 = OpLoad %271 
                                Private f32* %273 = OpAccessChain %9 %26 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %272 %274 
                                Uniform f32* %276 = OpAccessChain %35 %37 %165 
                                         f32 %277 = OpLoad %276 
                                         f32 %278 = OpFAdd %275 %277 
                                Private f32* %279 = OpAccessChain %170 %26 
                                                      OpStore %279 %278 
                                Uniform f32* %280 = OpAccessChain %35 %265 %45 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFNegate %281 
                                Private f32* %283 = OpAccessChain %9 %26 
                                         f32 %284 = OpLoad %283 
                                         f32 %285 = OpFMul %282 %284 
                                         f32 %286 = OpFAdd %285 %56 
                                Private f32* %287 = OpAccessChain %9 %26 
                                                      OpStore %287 %286 
                                Private f32* %288 = OpAccessChain %9 %26 
                                         f32 %289 = OpLoad %288 
                                Private f32* %290 = OpAccessChain %170 %26 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpFDiv %289 %291 
                                Private f32* %293 = OpAccessChain %9 %26 
                                                      OpStore %293 %292 
                                Private f32* %298 = OpAccessChain %9 %26 
                                         f32 %299 = OpLoad %298 
                                        bool %300 = OpFOrdLessThan %297 %299 
                                                      OpStore %296 %300 
                                        bool %301 = OpLoad %296 
                                                      OpSelectionMerge %305 None 
                                                      OpBranchConditional %301 %304 %307 
                                             %304 = OpLabel 
                                                      OpStore %303 %306 
                                                      OpBranch %305 
                                             %307 = OpLabel 
                                       f32_3 %308 = OpLoad %72 
                                                      OpStore %303 %308 
                                                      OpBranch %305 
                                             %305 = OpLabel 
                                       f32_3 %309 = OpLoad %303 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %309 4 1 5 6 
                                                      OpStore %9 %311 
                                Uniform f32* %312 = OpAccessChain %35 %164 %26 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFNegate %313 
                                Uniform f32* %315 = OpAccessChain %35 %164 %165 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpFAdd %314 %316 
                                Private f32* %318 = OpAccessChain %72 %26 
                                                      OpStore %318 %317 
                                Private f32* %319 = OpAccessChain %32 %26 
                                         f32 %320 = OpLoad %319 
                                Private f32* %321 = OpAccessChain %72 %26 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFDiv %320 %322 
                                Private f32* %324 = OpAccessChain %32 %26 
                                                      OpStore %324 %323 
                                Private f32* %325 = OpAccessChain %32 %26 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpExtInst %1 43 %326 %198 %56 
                                Private f32* %328 = OpAccessChain %32 %26 
                                                      OpStore %328 %327 
                                Uniform f32* %330 = OpAccessChain %35 %164 %45 
                                         f32 %331 = OpLoad %330 
                                        bool %332 = OpFOrdNotEqual %331 %198 
                                                      OpStore %329 %332 
                                        bool %333 = OpLoad %329 
                                                      OpSelectionMerge %337 None 
                                                      OpBranchConditional %333 %336 %340 
                                             %336 = OpLabel 
                                Private f32* %338 = OpAccessChain %32 %26 
                                         f32 %339 = OpLoad %338 
                                                      OpStore %335 %339 
                                                      OpBranch %337 
                                             %340 = OpLabel 
                                                      OpStore %335 %56 
                                                      OpBranch %337 
                                             %337 = OpLabel 
                                         f32 %341 = OpLoad %335 
                                Private f32* %342 = OpAccessChain %32 %26 
                                                      OpStore %342 %341 
                                       f32_4 %345 = OpLoad %9 
                                       f32_3 %346 = OpVectorShuffle %345 %345 0 2 3 
                                       f32_3 %347 = OpLoad %32 
                                       f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
                                       f32_3 %349 = OpFMul %346 %348 
                                       f32_4 %350 = OpLoad %111 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_3 %352 = OpFAdd %349 %351 
                                       f32_4 %353 = OpLoad %344 
                                       f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
                                                      OpStore %344 %354 
                                Private f32* %355 = OpAccessChain %111 %45 
                                         f32 %356 = OpLoad %355 
                                 Output f32* %358 = OpAccessChain %344 %45 
                                                      OpStore %358 %356 
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