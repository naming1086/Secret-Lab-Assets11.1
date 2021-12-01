//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Custom Effects/Artefact" {
Properties {
}
SubShader {
 Pass {
  Name "Artefact"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 32922
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
uniform 	float _Colorisation;
uniform 	float _Parasite;
uniform 	float _Noise;
uniform 	float _Fade;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
    u_xlat0 = floor(u_xlat0);
    u_xlat1.x = _Time.y * 12.0;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xz = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xz * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _Parasite;
    u_xlat2 = u_xlat1.xxxx * vec4(7.23409986, 1.0, 5.0, 1.0);
    u_xlat6.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
    u_xlat3.yz = fract(u_xlat6.xy);
    u_xlat6.x = log2(u_xlat3.y);
    u_xlat6.x = u_xlat6.x * 17.0;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.y + (-u_xlat6.x);
    u_xlat3.xy = u_xlat1.xx * vec2(31.0, 1.0);
    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
    u_xlat1.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 43758.5469;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat3.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
    u_xlat0.y = sin(u_xlat3.x);
    u_xlat0.xy = u_xlat0.xy * vec2(0.0500000007, 43758.5469);
    u_xlat3.x = fract(u_xlat0.y);
    u_xlat2.xz = u_xlat3.zx * u_xlat0.xx;
    u_xlat2.y = float(0.0);
    u_xlat2.w = float(0.0);
    u_xlat0.xy = (-u_xlat2.zw) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat2 = texture(_MainTex, u_xlat6.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.xy);
    u_xlat2.z = u_xlat0.z;
    u_xlat1.y = (-u_xlat1.x) * _Colorisation + 1.0;
    u_xlat1.z = u_xlat1.x * 0.5 + 0.5;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Noise, _Noise, _Noise)) + vec3(-2.0, -2.0, -2.0);
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.x = u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0799999982, 0.0799999982) + u_xlat2.xyz;
    u_xlat0.w = 0.200000003;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    SV_Target0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat0 + u_xlat1;
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
; Bound: 334
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %313 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate vs_TEXCOORD0 Location 12 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpMemberDecorate %24 3 Offset 24 
                                                     OpMemberDecorate %24 4 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpDecorate %232 DescriptorSet 232 
                                                     OpDecorate %232 Binding 232 
                                                     OpDecorate %236 DescriptorSet 236 
                                                     OpDecorate %236 Binding 236 
                                                     OpDecorate %313 Location 313 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         f32 %15 = OpConstant 3.674022E-40 
                                         f32 %16 = OpConstant 3.674022E-40 
                                         f32 %17 = OpConstant 3.674022E-40 
                                         f32 %18 = OpConstant 3.674022E-40 
                                       f32_4 %19 = OpConstantComposite %15 %16 %17 %18 
                              Private f32_4* %23 = OpVariable Private 
                                             %24 = OpTypeStruct %7 %6 %6 %6 %6 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32; f32; f32; f32;}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 0 
                                             %29 = OpTypeInt 32 0 
                                         u32 %30 = OpConstant 1 
                                             %31 = OpTypePointer Uniform %6 
                                         f32 %34 = OpConstant 3.674022E-40 
                                         u32 %36 = OpConstant 0 
                                             %37 = OpTypePointer Private %6 
                                         f32 %49 = OpConstant 3.674022E-40 
                                         f32 %50 = OpConstant 3.674022E-40 
                                       f32_2 %51 = OpConstantComposite %49 %50 
                                         f32 %65 = OpConstant 3.674022E-40 
                                       f32_2 %66 = OpConstantComposite %65 %65 
                                         i32 %97 = OpConstant 2 
                             Private f32_4* %102 = OpVariable Private 
                                        f32 %105 = OpConstant 3.674022E-40 
                                        f32 %106 = OpConstant 3.674022E-40 
                                        f32 %107 = OpConstant 3.674022E-40 
                                      f32_4 %108 = OpConstantComposite %105 %106 %107 %106 
                                            %110 = OpTypePointer Private %10 
                             Private f32_2* %111 = OpVariable Private 
                                            %124 = OpTypeVector %6 3 
                                            %125 = OpTypePointer Private %124 
                             Private f32_3* %126 = OpVariable Private 
                                        f32 %137 = OpConstant 3.674022E-40 
                                        f32 %162 = OpConstant 3.674022E-40 
                                      f32_2 %163 = OpConstantComposite %162 %106 
                                        f32 %199 = OpConstant 3.674022E-40 
                                      f32_2 %200 = OpConstantComposite %199 %65 
                                        f32 %215 = OpConstant 3.674022E-40 
                                        u32 %217 = OpConstant 3 
                                            %230 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %231 = OpTypePointer UniformConstant %230 
       UniformConstant read_only Texture2D* %232 = OpVariable UniformConstant 
                                            %234 = OpTypeSampler 
                                            %235 = OpTypePointer UniformConstant %234 
                   UniformConstant sampler* %236 = OpVariable UniformConstant 
                                            %238 = OpTypeSampledImage %230 
                                        u32 %250 = OpConstant 2 
                                        i32 %256 = OpConstant 1 
                                        f32 %264 = OpConstant 3.674022E-40 
                                        i32 %270 = OpConstant 3 
                                        f32 %283 = OpConstant 3.674022E-40 
                                      f32_3 %284 = OpConstantComposite %283 %283 %283 
                                        f32 %298 = OpConstant 3.674022E-40 
                                      f32_3 %299 = OpConstantComposite %298 %298 %298 
                                        f32 %306 = OpConstant 3.674022E-40 
                                            %312 = OpTypePointer Output %7 
                              Output f32_4* %313 = OpVariable Output 
                                        i32 %314 = OpConstant 4 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad vs_TEXCOORD0 
                                       f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                                       f32_4 %20 = OpFMul %14 %19 
                                                     OpStore %9 %20 
                                       f32_4 %21 = OpLoad %9 
                                       f32_4 %22 = OpExtInst %1 8 %21 
                                                     OpStore %9 %22 
                                Uniform f32* %32 = OpAccessChain %26 %28 %30 
                                         f32 %33 = OpLoad %32 
                                         f32 %35 = OpFMul %33 %34 
                                Private f32* %38 = OpAccessChain %23 %36 
                                                     OpStore %38 %35 
                                Private f32* %39 = OpAccessChain %23 %36 
                                         f32 %40 = OpLoad %39 
                                         f32 %41 = OpExtInst %1 8 %40 
                                Private f32* %42 = OpAccessChain %23 %36 
                                                     OpStore %42 %41 
                                       f32_4 %43 = OpLoad %9 
                                       f32_4 %44 = OpLoad %23 
                                       f32_4 %45 = OpVectorShuffle %44 %44 0 0 0 0 
                                       f32_4 %46 = OpFMul %43 %45 
                                                     OpStore %9 %46 
                                       f32_4 %47 = OpLoad %9 
                                       f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                         f32 %52 = OpDot %48 %51 
                                Private f32* %53 = OpAccessChain %9 %36 
                                                     OpStore %53 %52 
                                       f32_4 %54 = OpLoad %9 
                                       f32_2 %55 = OpVectorShuffle %54 %54 2 3 
                                         f32 %56 = OpDot %55 %51 
                                Private f32* %57 = OpAccessChain %9 %30 
                                                     OpStore %57 %56 
                                       f32_4 %58 = OpLoad %9 
                                       f32_2 %59 = OpVectorShuffle %58 %58 0 1 
                                       f32_2 %60 = OpExtInst %1 13 %59 
                                       f32_4 %61 = OpLoad %9 
                                       f32_4 %62 = OpVectorShuffle %61 %60 4 5 2 3 
                                                     OpStore %9 %62 
                                       f32_4 %63 = OpLoad %9 
                                       f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                       f32_2 %67 = OpFMul %64 %66 
                                       f32_4 %68 = OpLoad %9 
                                       f32_4 %69 = OpVectorShuffle %68 %67 4 5 2 3 
                                                     OpStore %9 %69 
                                       f32_4 %70 = OpLoad %9 
                                       f32_2 %71 = OpVectorShuffle %70 %70 0 1 
                                       f32_2 %72 = OpExtInst %1 10 %71 
                                       f32_4 %73 = OpLoad %9 
                                       f32_4 %74 = OpVectorShuffle %73 %72 4 5 2 3 
                                                     OpStore %9 %74 
                                       f32_4 %75 = OpLoad %9 
                                       f32_2 %76 = OpVectorShuffle %75 %75 0 1 
                                       f32_4 %77 = OpLoad %9 
                                       f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                       f32_2 %79 = OpFMul %76 %78 
                                       f32_4 %80 = OpLoad %9 
                                       f32_4 %81 = OpVectorShuffle %80 %79 4 1 5 3 
                                                     OpStore %9 %81 
                                       f32_4 %82 = OpLoad %9 
                                       f32_2 %83 = OpVectorShuffle %82 %82 0 2 
                                       f32_4 %84 = OpLoad %9 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %86 = OpFMul %83 %85 
                                       f32_4 %87 = OpLoad %9 
                                       f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                     OpStore %9 %88 
                                Private f32* %89 = OpAccessChain %9 %36 
                                         f32 %90 = OpLoad %89 
                                Private f32* %91 = OpAccessChain %9 %36 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFMul %90 %92 
                                Private f32* %94 = OpAccessChain %9 %36 
                                                     OpStore %94 %93 
                                Private f32* %95 = OpAccessChain %9 %36 
                                         f32 %96 = OpLoad %95 
                                Uniform f32* %98 = OpAccessChain %26 %97 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFMul %96 %99 
                               Private f32* %101 = OpAccessChain %9 %36 
                                                     OpStore %101 %100 
                                      f32_4 %103 = OpLoad %23 
                                      f32_4 %104 = OpVectorShuffle %103 %103 0 0 0 0 
                                      f32_4 %109 = OpFMul %104 %108 
                                                     OpStore %102 %109 
                                      f32_4 %112 = OpLoad %102 
                                      f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                        f32 %114 = OpDot %113 %51 
                               Private f32* %115 = OpAccessChain %111 %36 
                                                     OpStore %115 %114 
                                      f32_4 %116 = OpLoad %102 
                                      f32_2 %117 = OpVectorShuffle %116 %116 2 3 
                                        f32 %118 = OpDot %117 %51 
                               Private f32* %119 = OpAccessChain %111 %30 
                                                     OpStore %119 %118 
                                      f32_2 %120 = OpLoad %111 
                                      f32_2 %121 = OpExtInst %1 13 %120 
                                                     OpStore %111 %121 
                                      f32_2 %122 = OpLoad %111 
                                      f32_2 %123 = OpFMul %122 %66 
                                                     OpStore %111 %123 
                                      f32_2 %127 = OpLoad %111 
                                      f32_2 %128 = OpExtInst %1 10 %127 
                                      f32_3 %129 = OpLoad %126 
                                      f32_3 %130 = OpVectorShuffle %129 %128 0 3 4 
                                                     OpStore %126 %130 
                               Private f32* %131 = OpAccessChain %126 %30 
                                        f32 %132 = OpLoad %131 
                                        f32 %133 = OpExtInst %1 30 %132 
                               Private f32* %134 = OpAccessChain %111 %36 
                                                     OpStore %134 %133 
                               Private f32* %135 = OpAccessChain %111 %36 
                                        f32 %136 = OpLoad %135 
                                        f32 %138 = OpFMul %136 %137 
                               Private f32* %139 = OpAccessChain %111 %36 
                                                     OpStore %139 %138 
                               Private f32* %140 = OpAccessChain %111 %36 
                                        f32 %141 = OpLoad %140 
                                        f32 %142 = OpExtInst %1 29 %141 
                               Private f32* %143 = OpAccessChain %111 %36 
                                                     OpStore %143 %142 
                               Private f32* %144 = OpAccessChain %111 %36 
                                        f32 %145 = OpLoad %144 
                               Private f32* %146 = OpAccessChain %111 %36 
                                        f32 %147 = OpLoad %146 
                                        f32 %148 = OpFAdd %145 %147 
                               Private f32* %149 = OpAccessChain %111 %36 
                                                     OpStore %149 %148 
                               Private f32* %150 = OpAccessChain %9 %36 
                                        f32 %151 = OpLoad %150 
                               Private f32* %152 = OpAccessChain %9 %30 
                                        f32 %153 = OpLoad %152 
                                        f32 %154 = OpFMul %151 %153 
                               Private f32* %155 = OpAccessChain %111 %36 
                                        f32 %156 = OpLoad %155 
                                        f32 %157 = OpFNegate %156 
                                        f32 %158 = OpFAdd %154 %157 
                               Private f32* %159 = OpAccessChain %9 %36 
                                                     OpStore %159 %158 
                                      f32_4 %160 = OpLoad %23 
                                      f32_2 %161 = OpVectorShuffle %160 %160 0 0 
                                      f32_2 %164 = OpFMul %161 %163 
                                      f32_3 %165 = OpLoad %126 
                                      f32_3 %166 = OpVectorShuffle %165 %164 3 4 2 
                                                     OpStore %126 %166 
                                      f32_4 %167 = OpLoad %23 
                                      f32_2 %168 = OpVectorShuffle %167 %167 0 0 
                                      f32_2 %169 = OpLoad vs_TEXCOORD0 
                                      f32_2 %170 = OpFMul %168 %169 
                                      f32_4 %171 = OpLoad %23 
                                      f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
                                                     OpStore %23 %172 
                                      f32_4 %173 = OpLoad %23 
                                      f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                                        f32 %175 = OpDot %174 %51 
                               Private f32* %176 = OpAccessChain %23 %36 
                                                     OpStore %176 %175 
                               Private f32* %177 = OpAccessChain %23 %36 
                                        f32 %178 = OpLoad %177 
                                        f32 %179 = OpExtInst %1 13 %178 
                               Private f32* %180 = OpAccessChain %23 %36 
                                                     OpStore %180 %179 
                               Private f32* %181 = OpAccessChain %23 %36 
                                        f32 %182 = OpLoad %181 
                                        f32 %183 = OpFMul %182 %65 
                               Private f32* %184 = OpAccessChain %23 %36 
                                                     OpStore %184 %183 
                               Private f32* %185 = OpAccessChain %23 %36 
                                        f32 %186 = OpLoad %185 
                                        f32 %187 = OpExtInst %1 10 %186 
                               Private f32* %188 = OpAccessChain %23 %36 
                                                     OpStore %188 %187 
                                      f32_3 %189 = OpLoad %126 
                                      f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                        f32 %191 = OpDot %190 %51 
                               Private f32* %192 = OpAccessChain %126 %36 
                                                     OpStore %192 %191 
                               Private f32* %193 = OpAccessChain %126 %36 
                                        f32 %194 = OpLoad %193 
                                        f32 %195 = OpExtInst %1 13 %194 
                               Private f32* %196 = OpAccessChain %9 %30 
                                                     OpStore %196 %195 
                                      f32_4 %197 = OpLoad %9 
                                      f32_2 %198 = OpVectorShuffle %197 %197 0 1 
                                      f32_2 %201 = OpFMul %198 %200 
                                      f32_4 %202 = OpLoad %9 
                                      f32_4 %203 = OpVectorShuffle %202 %201 4 5 2 3 
                                                     OpStore %9 %203 
                               Private f32* %204 = OpAccessChain %9 %30 
                                        f32 %205 = OpLoad %204 
                                        f32 %206 = OpExtInst %1 10 %205 
                               Private f32* %207 = OpAccessChain %126 %36 
                                                     OpStore %207 %206 
                                      f32_3 %208 = OpLoad %126 
                                      f32_2 %209 = OpVectorShuffle %208 %208 2 0 
                                      f32_4 %210 = OpLoad %9 
                                      f32_2 %211 = OpVectorShuffle %210 %210 0 0 
                                      f32_2 %212 = OpFMul %209 %211 
                                      f32_4 %213 = OpLoad %102 
                                      f32_4 %214 = OpVectorShuffle %213 %212 4 1 5 3 
                                                     OpStore %102 %214 
                               Private f32* %216 = OpAccessChain %102 %30 
                                                     OpStore %216 %215 
                               Private f32* %218 = OpAccessChain %102 %217 
                                                     OpStore %218 %215 
                                      f32_4 %219 = OpLoad %102 
                                      f32_2 %220 = OpVectorShuffle %219 %219 2 3 
                                      f32_2 %221 = OpFNegate %220 
                                      f32_2 %222 = OpLoad vs_TEXCOORD0 
                                      f32_2 %223 = OpFAdd %221 %222 
                                      f32_4 %224 = OpLoad %9 
                                      f32_4 %225 = OpVectorShuffle %224 %223 4 5 2 3 
                                                     OpStore %9 %225 
                                      f32_4 %226 = OpLoad %102 
                                      f32_2 %227 = OpVectorShuffle %226 %226 0 1 
                                      f32_2 %228 = OpLoad vs_TEXCOORD0 
                                      f32_2 %229 = OpFAdd %227 %228 
                                                     OpStore %111 %229 
                        read_only Texture2D %233 = OpLoad %232 
                                    sampler %237 = OpLoad %236 
                 read_only Texture2DSampled %239 = OpSampledImage %233 %237 
                                      f32_2 %240 = OpLoad %111 
                                      f32_4 %241 = OpImageSampleImplicitLod %239 %240 
                                        f32 %242 = OpCompositeExtract %241 1 
                               Private f32* %243 = OpAccessChain %102 %30 
                                                     OpStore %243 %242 
                        read_only Texture2D %244 = OpLoad %232 
                                    sampler %245 = OpLoad %236 
                 read_only Texture2DSampled %246 = OpSampledImage %244 %245 
                                      f32_4 %247 = OpLoad %9 
                                      f32_2 %248 = OpVectorShuffle %247 %247 0 1 
                                      f32_4 %249 = OpImageSampleImplicitLod %246 %248 
                                        f32 %251 = OpCompositeExtract %249 2 
                               Private f32* %252 = OpAccessChain %102 %250 
                                                     OpStore %252 %251 
                               Private f32* %253 = OpAccessChain %23 %36 
                                        f32 %254 = OpLoad %253 
                                        f32 %255 = OpFNegate %254 
                               Uniform f32* %257 = OpAccessChain %26 %256 
                                        f32 %258 = OpLoad %257 
                                        f32 %259 = OpFMul %255 %258 
                                        f32 %260 = OpFAdd %259 %106 
                               Private f32* %261 = OpAccessChain %23 %30 
                                                     OpStore %261 %260 
                               Private f32* %262 = OpAccessChain %23 %36 
                                        f32 %263 = OpLoad %262 
                                        f32 %265 = OpFMul %263 %264 
                                        f32 %266 = OpFAdd %265 %264 
                               Private f32* %267 = OpAccessChain %23 %250 
                                                     OpStore %267 %266 
                                      f32_4 %268 = OpLoad %23 
                                      f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                               Uniform f32* %271 = OpAccessChain %26 %270 
                                        f32 %272 = OpLoad %271 
                               Uniform f32* %273 = OpAccessChain %26 %270 
                                        f32 %274 = OpLoad %273 
                               Uniform f32* %275 = OpAccessChain %26 %270 
                                        f32 %276 = OpLoad %275 
                                      f32_3 %277 = OpCompositeConstruct %272 %274 %276 
                                        f32 %278 = OpCompositeExtract %277 0 
                                        f32 %279 = OpCompositeExtract %277 1 
                                        f32 %280 = OpCompositeExtract %277 2 
                                      f32_3 %281 = OpCompositeConstruct %278 %279 %280 
                                      f32_3 %282 = OpFMul %269 %281 
                                      f32_3 %285 = OpFAdd %282 %284 
                                      f32_4 %286 = OpLoad %9 
                                      f32_4 %287 = OpVectorShuffle %286 %285 4 5 6 3 
                                                     OpStore %9 %287 
                        read_only Texture2D %288 = OpLoad %232 
                                    sampler %289 = OpLoad %236 
                 read_only Texture2DSampled %290 = OpSampledImage %288 %289 
                                      f32_2 %291 = OpLoad vs_TEXCOORD0 
                                      f32_4 %292 = OpImageSampleImplicitLod %290 %291 
                                                     OpStore %23 %292 
                               Private f32* %293 = OpAccessChain %23 %36 
                                        f32 %294 = OpLoad %293 
                               Private f32* %295 = OpAccessChain %102 %36 
                                                     OpStore %295 %294 
                                      f32_4 %296 = OpLoad %9 
                                      f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                                      f32_3 %300 = OpFMul %297 %299 
                                      f32_4 %301 = OpLoad %102 
                                      f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
                                      f32_3 %303 = OpFAdd %300 %302 
                                      f32_4 %304 = OpLoad %9 
                                      f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                                     OpStore %9 %305 
                               Private f32* %307 = OpAccessChain %9 %217 
                                                     OpStore %307 %306 
                                      f32_4 %308 = OpLoad %23 
                                      f32_4 %309 = OpFNegate %308 
                                      f32_4 %310 = OpLoad %9 
                                      f32_4 %311 = OpFAdd %309 %310 
                                                     OpStore %9 %311 
                               Uniform f32* %315 = OpAccessChain %26 %314 
                                        f32 %316 = OpLoad %315 
                               Uniform f32* %317 = OpAccessChain %26 %314 
                                        f32 %318 = OpLoad %317 
                               Uniform f32* %319 = OpAccessChain %26 %314 
                                        f32 %320 = OpLoad %319 
                               Uniform f32* %321 = OpAccessChain %26 %314 
                                        f32 %322 = OpLoad %321 
                                      f32_4 %323 = OpCompositeConstruct %316 %318 %320 %322 
                                        f32 %324 = OpCompositeExtract %323 0 
                                        f32 %325 = OpCompositeExtract %323 1 
                                        f32 %326 = OpCompositeExtract %323 2 
                                        f32 %327 = OpCompositeExtract %323 3 
                                      f32_4 %328 = OpCompositeConstruct %324 %325 %326 %327 
                                      f32_4 %329 = OpLoad %9 
                                      f32_4 %330 = OpFMul %328 %329 
                                      f32_4 %331 = OpLoad %23 
                                      f32_4 %332 = OpFAdd %330 %331 
                                                     OpStore %313 %332 
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