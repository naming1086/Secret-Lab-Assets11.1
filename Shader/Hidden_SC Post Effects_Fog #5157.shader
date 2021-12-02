//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Fog" {
Properties {
}
SubShader {
 Pass {
  Name "Fog: Light Scattering Prefilter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 53706
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _Threshold;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _AutoExposureTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat4;
float u_xlat10;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    u_xlat0 = min(u_xlat0, vec4(65504.0, 65504.0, 65504.0, 65504.0));
    u_xlat1 = texture(_AutoExposureTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, u_xlat1.x);
    u_xlat1.yz = u_xlat1.xx + (-_Threshold.yx);
    u_xlat1.xy = max(u_xlat1.xy, vec2(9.99999975e-05, 0.0));
    u_xlat4 = min(u_xlat1.y, _Threshold.z);
    u_xlat10 = u_xlat4 * _Threshold.w;
    u_xlat4 = u_xlat4 * u_xlat10;
    u_xlat4 = max(u_xlat1.z, u_xlat4);
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    SV_Target0 = u_xlat0 * u_xlat1.xxxx;
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
; Bound: 166
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %160 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %160 Location 160 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypePointer Uniform %7 
                                 f32 %19 = OpConstant 3.674022E-40 
                                 f32 %20 = OpConstant 3.674022E-40 
                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
                                     %23 = OpTypeVector %6 2 
                                     %24 = OpTypePointer Input %23 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                               f32_4 %55 = OpConstantComposite %19 %20 %20 %20 
                      Private f32_4* %60 = OpVariable Private 
                                 f32 %80 = OpConstant 3.674022E-40 
                               f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
                                 f32 %84 = OpConstant 3.674022E-40 
                               f32_4 %85 = OpConstantComposite %84 %84 %84 %84 
UniformConstant read_only Texture2D* %87 = OpVariable UniformConstant 
                                     %93 = OpTypeInt 32 0 
                                 u32 %94 = OpConstant 0 
                                     %96 = OpTypePointer Private %6 
                                u32 %102 = OpConstant 1 
                                u32 %109 = OpConstant 2 
                                i32 %118 = OpConstant 1 
                                f32 %128 = OpConstant 3.674022E-40 
                                f32 %129 = OpConstant 3.674022E-40 
                              f32_2 %130 = OpConstantComposite %128 %129 
                       Private f32* %134 = OpVariable Private 
                                    %137 = OpTypePointer Uniform %6 
                       Private f32* %141 = OpVariable Private 
                                u32 %143 = OpConstant 3 
                                    %159 = OpTypePointer Output %7 
                      Output f32_4* %160 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %16 = OpAccessChain %12 %14 
                               f32_4 %17 = OpLoad %16 
                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
                               f32_4 %22 = OpFMul %18 %21 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %22 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                             OpStore %29 %42 
                 read_only Texture2D %43 = OpLoad %32 
                             sampler %44 = OpLoad %36 
          read_only Texture2DSampled %45 = OpSampledImage %43 %44 
                               f32_4 %46 = OpLoad %9 
                               f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                             OpStore %9 %48 
                               f32_4 %49 = OpLoad %9 
                               f32_4 %50 = OpLoad %29 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                      Uniform f32_4* %52 = OpAccessChain %12 %14 
                               f32_4 %53 = OpLoad %52 
                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                               f32_4 %56 = OpFMul %54 %55 
                               f32_2 %57 = OpLoad vs_TEXCOORD0 
                               f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
                               f32_4 %59 = OpFAdd %56 %58 
                                             OpStore %29 %59 
                 read_only Texture2D %61 = OpLoad %32 
                             sampler %62 = OpLoad %36 
          read_only Texture2DSampled %63 = OpSampledImage %61 %62 
                               f32_4 %64 = OpLoad %29 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                               f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                             OpStore %60 %66 
                 read_only Texture2D %67 = OpLoad %32 
                             sampler %68 = OpLoad %36 
          read_only Texture2DSampled %69 = OpSampledImage %67 %68 
                               f32_4 %70 = OpLoad %29 
                               f32_2 %71 = OpVectorShuffle %70 %70 2 3 
                               f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                             OpStore %29 %72 
                               f32_4 %73 = OpLoad %9 
                               f32_4 %74 = OpLoad %60 
                               f32_4 %75 = OpFAdd %73 %74 
                                             OpStore %9 %75 
                               f32_4 %76 = OpLoad %29 
                               f32_4 %77 = OpLoad %9 
                               f32_4 %78 = OpFAdd %76 %77 
                                             OpStore %9 %78 
                               f32_4 %79 = OpLoad %9 
                               f32_4 %82 = OpFMul %79 %81 
                                             OpStore %9 %82 
                               f32_4 %83 = OpLoad %9 
                               f32_4 %86 = OpExtInst %1 37 %83 %85 
                                             OpStore %9 %86 
                 read_only Texture2D %88 = OpLoad %87 
                             sampler %89 = OpLoad %36 
          read_only Texture2DSampled %90 = OpSampledImage %88 %89 
                               f32_2 %91 = OpLoad vs_TEXCOORD0 
                               f32_4 %92 = OpImageSampleImplicitLod %90 %91 
                                 f32 %95 = OpCompositeExtract %92 0 
                        Private f32* %97 = OpAccessChain %29 %94 
                                             OpStore %97 %95 
                               f32_4 %98 = OpLoad %9 
                               f32_4 %99 = OpLoad %29 
                              f32_4 %100 = OpVectorShuffle %99 %99 0 0 0 0 
                              f32_4 %101 = OpFMul %98 %100 
                                             OpStore %9 %101 
                       Private f32* %103 = OpAccessChain %9 %102 
                                f32 %104 = OpLoad %103 
                       Private f32* %105 = OpAccessChain %9 %94 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpExtInst %1 40 %104 %106 
                       Private f32* %108 = OpAccessChain %29 %94 
                                             OpStore %108 %107 
                       Private f32* %110 = OpAccessChain %9 %109 
                                f32 %111 = OpLoad %110 
                       Private f32* %112 = OpAccessChain %29 %94 
                                f32 %113 = OpLoad %112 
                                f32 %114 = OpExtInst %1 40 %111 %113 
                       Private f32* %115 = OpAccessChain %29 %94 
                                             OpStore %115 %114 
                              f32_4 %116 = OpLoad %29 
                              f32_2 %117 = OpVectorShuffle %116 %116 0 0 
                     Uniform f32_4* %119 = OpAccessChain %12 %118 
                              f32_4 %120 = OpLoad %119 
                              f32_2 %121 = OpVectorShuffle %120 %120 1 0 
                              f32_2 %122 = OpFNegate %121 
                              f32_2 %123 = OpFAdd %117 %122 
                              f32_4 %124 = OpLoad %29 
                              f32_4 %125 = OpVectorShuffle %124 %123 0 4 5 3 
                                             OpStore %29 %125 
                              f32_4 %126 = OpLoad %29 
                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                              f32_2 %131 = OpExtInst %1 40 %127 %130 
                              f32_4 %132 = OpLoad %29 
                              f32_4 %133 = OpVectorShuffle %132 %131 4 5 2 3 
                                             OpStore %29 %133 
                       Private f32* %135 = OpAccessChain %29 %102 
                                f32 %136 = OpLoad %135 
                       Uniform f32* %138 = OpAccessChain %12 %118 %109 
                                f32 %139 = OpLoad %138 
                                f32 %140 = OpExtInst %1 37 %136 %139 
                                             OpStore %134 %140 
                                f32 %142 = OpLoad %134 
                       Uniform f32* %144 = OpAccessChain %12 %118 %143 
                                f32 %145 = OpLoad %144 
                                f32 %146 = OpFMul %142 %145 
                                             OpStore %141 %146 
                                f32 %147 = OpLoad %134 
                                f32 %148 = OpLoad %141 
                                f32 %149 = OpFMul %147 %148 
                                             OpStore %134 %149 
                       Private f32* %150 = OpAccessChain %29 %109 
                                f32 %151 = OpLoad %150 
                                f32 %152 = OpLoad %134 
                                f32 %153 = OpExtInst %1 40 %151 %152 
                                             OpStore %134 %153 
                                f32 %154 = OpLoad %134 
                       Private f32* %155 = OpAccessChain %29 %94 
                                f32 %156 = OpLoad %155 
                                f32 %157 = OpFDiv %154 %156 
                       Private f32* %158 = OpAccessChain %29 %94 
                                             OpStore %158 %157 
                              f32_4 %161 = OpLoad %9 
                              f32_4 %162 = OpLoad %29 
                              f32_4 %163 = OpVectorShuffle %162 %162 0 0 0 0 
                              f32_4 %164 = OpFMul %161 %163 
                                             OpStore %160 %164 
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
  Name "Fog: Light Scattering Downsample"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 126409
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
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
; Bound: 86
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %25 %80 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD0 Location 25 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %36 DescriptorSet 36 
                                             OpDecorate %36 Binding 36 
                                             OpDecorate %80 Location 80 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 
                                     %11 = OpTypePointer Uniform %10 
            Uniform struct {f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 0 
                                     %15 = OpTypePointer Uniform %7 
                                 f32 %19 = OpConstant 3.674022E-40 
                                 f32 %20 = OpConstant 3.674022E-40 
                               f32_4 %21 = OpConstantComposite %19 %19 %20 %19 
                                     %23 = OpTypeVector %6 2 
                                     %24 = OpTypePointer Input %23 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %29 = OpVariable Private 
                                     %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %31 = OpTypePointer UniformConstant %30 
UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampler 
                                     %35 = OpTypePointer UniformConstant %34 
            UniformConstant sampler* %36 = OpVariable UniformConstant 
                                     %38 = OpTypeSampledImage %30 
                               f32_4 %55 = OpConstantComposite %19 %20 %20 %20 
                      Private f32_4* %60 = OpVariable Private 
                                     %79 = OpTypePointer Output %7 
                       Output f32_4* %80 = OpVariable Output 
                                 f32 %82 = OpConstant 3.674022E-40 
                               f32_4 %83 = OpConstantComposite %82 %82 %82 %82 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %16 = OpAccessChain %12 %14 
                               f32_4 %17 = OpLoad %16 
                               f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
                               f32_4 %22 = OpFMul %18 %21 
                               f32_2 %26 = OpLoad vs_TEXCOORD0 
                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
                               f32_4 %28 = OpFAdd %22 %27 
                                             OpStore %9 %28 
                 read_only Texture2D %33 = OpLoad %32 
                             sampler %37 = OpLoad %36 
          read_only Texture2DSampled %39 = OpSampledImage %33 %37 
                               f32_4 %40 = OpLoad %9 
                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                               f32_4 %42 = OpImageSampleImplicitLod %39 %41 
                                             OpStore %29 %42 
                 read_only Texture2D %43 = OpLoad %32 
                             sampler %44 = OpLoad %36 
          read_only Texture2DSampled %45 = OpSampledImage %43 %44 
                               f32_4 %46 = OpLoad %9 
                               f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                             OpStore %9 %48 
                               f32_4 %49 = OpLoad %9 
                               f32_4 %50 = OpLoad %29 
                               f32_4 %51 = OpFAdd %49 %50 
                                             OpStore %9 %51 
                      Uniform f32_4* %52 = OpAccessChain %12 %14 
                               f32_4 %53 = OpLoad %52 
                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
                               f32_4 %56 = OpFMul %54 %55 
                               f32_2 %57 = OpLoad vs_TEXCOORD0 
                               f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
                               f32_4 %59 = OpFAdd %56 %58 
                                             OpStore %29 %59 
                 read_only Texture2D %61 = OpLoad %32 
                             sampler %62 = OpLoad %36 
          read_only Texture2DSampled %63 = OpSampledImage %61 %62 
                               f32_4 %64 = OpLoad %29 
                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                               f32_4 %66 = OpImageSampleImplicitLod %63 %65 
                                             OpStore %60 %66 
                 read_only Texture2D %67 = OpLoad %32 
                             sampler %68 = OpLoad %36 
          read_only Texture2DSampled %69 = OpSampledImage %67 %68 
                               f32_4 %70 = OpLoad %29 
                               f32_2 %71 = OpVectorShuffle %70 %70 2 3 
                               f32_4 %72 = OpImageSampleImplicitLod %69 %71 
                                             OpStore %29 %72 
                               f32_4 %73 = OpLoad %9 
                               f32_4 %74 = OpLoad %60 
                               f32_4 %75 = OpFAdd %73 %74 
                                             OpStore %9 %75 
                               f32_4 %76 = OpLoad %29 
                               f32_4 %77 = OpLoad %9 
                               f32_4 %78 = OpFAdd %76 %77 
                                             OpStore %9 %78 
                               f32_4 %81 = OpLoad %9 
                               f32_4 %84 = OpFMul %81 %83 
                                             OpStore %80 %84 
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
  Name "Fog: Light Scattering Upsample"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 156621
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
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BloomTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(_RenderViewportScaleFactor);
    u_xlat1 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat2 = texture(_MainTex, u_xlat1.xy);
    u_xlat1 = texture(_MainTex, u_xlat1.zw);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat2 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = texture(_MainTex, u_xlat0.zw);
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1 = texture(_BloomTex, vs_TEXCOORD1.xy);
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
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
; Bound: 130
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %42 %118 %122 
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
                                              OpDecorate %76 DescriptorSet 76 
                                              OpDecorate %76 Binding 76 
                                              OpDecorate %80 DescriptorSet 80 
                                              OpDecorate %80 Binding 80 
                                              OpDecorate %114 DescriptorSet 114 
                                              OpDecorate %114 Binding 114 
                                              OpDecorate vs_TEXCOORD1 Location 118 
                                              OpDecorate %122 Location 122 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypeStruct %6 %7 %6 
                                      %11 = OpTypePointer Uniform %10 
   Uniform struct {f32; f32_4; f32;}* %12 = OpVariable Uniform 
                                      %13 = OpTypeInt 32 1 
                                  i32 %14 = OpConstant 1 
                                      %15 = OpTypePointer Uniform %7 
                                  f32 %19 = OpConstant 3.674022E-40 
                                  f32 %20 = OpConstant 3.674022E-40 
                                f32_4 %21 = OpConstantComposite %19 %19 %20 %20 
                       Private f32_4* %23 = OpVariable Private 
                                  i32 %24 = OpConstant 2 
                                      %25 = OpTypePointer Uniform %6 
                                  f32 %28 = OpConstant 3.674022E-40 
                                      %30 = OpTypeInt 32 0 
                                  u32 %31 = OpConstant 0 
                                      %32 = OpTypePointer Private %6 
                       Private f32_4* %34 = OpVariable Private 
                                      %40 = OpTypeVector %6 2 
                                      %41 = OpTypePointer Input %40 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %47 = OpConstant 3.674022E-40 
                                  i32 %64 = OpConstant 0 
                                      %74 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %75 = OpTypePointer UniformConstant %74 
 UniformConstant read_only Texture2D* %76 = OpVariable UniformConstant 
                                      %78 = OpTypeSampler 
                                      %79 = OpTypePointer UniformConstant %78 
             UniformConstant sampler* %80 = OpVariable UniformConstant 
                                      %82 = OpTypeSampledImage %74 
UniformConstant read_only Texture2D* %114 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %121 = OpTypePointer Output %7 
                       Output f32_4* %122 = OpVariable Output 
                                 f32 %124 = OpConstant 3.674022E-40 
                               f32_4 %125 = OpConstantComposite %124 %124 %124 %124 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Uniform f32_4* %16 = OpAccessChain %12 %14 
                                f32_4 %17 = OpLoad %16 
                                f32_4 %18 = OpVectorShuffle %17 %17 0 1 0 1 
                                f32_4 %22 = OpFMul %18 %21 
                                              OpStore %9 %22 
                         Uniform f32* %26 = OpAccessChain %12 %24 
                                  f32 %27 = OpLoad %26 
                                  f32 %29 = OpFMul %27 %28 
                         Private f32* %33 = OpAccessChain %23 %31 
                                              OpStore %33 %29 
                                f32_4 %35 = OpLoad %9 
                                f32_4 %36 = OpVectorShuffle %35 %35 0 1 2 1 
                                f32_4 %37 = OpLoad %23 
                                f32_4 %38 = OpVectorShuffle %37 %37 0 0 0 0 
                                f32_4 %39 = OpFMul %36 %38 
                                f32_2 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
                                f32_4 %45 = OpFAdd %39 %44 
                                              OpStore %34 %45 
                                f32_4 %46 = OpLoad %34 
                                f32_4 %48 = OpCompositeConstruct %47 %47 %47 %47 
                                f32_4 %49 = OpCompositeConstruct %20 %20 %20 %20 
                                f32_4 %50 = OpExtInst %1 43 %46 %48 %49 
                                              OpStore %34 %50 
                                f32_4 %51 = OpLoad %9 
                                f32_4 %52 = OpVectorShuffle %51 %51 0 3 2 3 
                                f32_4 %53 = OpLoad %23 
                                f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                                f32_4 %55 = OpFMul %52 %54 
                                f32_2 %56 = OpLoad vs_TEXCOORD0 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
                                f32_4 %58 = OpFAdd %55 %57 
                                              OpStore %9 %58 
                                f32_4 %59 = OpLoad %9 
                                f32_4 %60 = OpCompositeConstruct %47 %47 %47 %47 
                                f32_4 %61 = OpCompositeConstruct %20 %20 %20 %20 
                                f32_4 %62 = OpExtInst %1 43 %59 %60 %61 
                                              OpStore %9 %62 
                                f32_4 %63 = OpLoad %9 
                         Uniform f32* %65 = OpAccessChain %12 %64 
                                  f32 %66 = OpLoad %65 
                                f32_4 %67 = OpCompositeConstruct %66 %66 %66 %66 
                                f32_4 %68 = OpFMul %63 %67 
                                              OpStore %9 %68 
                                f32_4 %69 = OpLoad %34 
                         Uniform f32* %70 = OpAccessChain %12 %64 
                                  f32 %71 = OpLoad %70 
                                f32_4 %72 = OpCompositeConstruct %71 %71 %71 %71 
                                f32_4 %73 = OpFMul %69 %72 
                                              OpStore %23 %73 
                  read_only Texture2D %77 = OpLoad %76 
                              sampler %81 = OpLoad %80 
           read_only Texture2DSampled %83 = OpSampledImage %77 %81 
                                f32_4 %84 = OpLoad %23 
                                f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                f32_4 %86 = OpImageSampleImplicitLod %83 %85 
                                              OpStore %34 %86 
                  read_only Texture2D %87 = OpLoad %76 
                              sampler %88 = OpLoad %80 
           read_only Texture2DSampled %89 = OpSampledImage %87 %88 
                                f32_4 %90 = OpLoad %23 
                                f32_2 %91 = OpVectorShuffle %90 %90 2 3 
                                f32_4 %92 = OpImageSampleImplicitLod %89 %91 
                                              OpStore %23 %92 
                                f32_4 %93 = OpLoad %23 
                                f32_4 %94 = OpLoad %34 
                                f32_4 %95 = OpFAdd %93 %94 
                                              OpStore %23 %95 
                  read_only Texture2D %96 = OpLoad %76 
                              sampler %97 = OpLoad %80 
           read_only Texture2DSampled %98 = OpSampledImage %96 %97 
                                f32_4 %99 = OpLoad %9 
                               f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                               f32_4 %101 = OpImageSampleImplicitLod %98 %100 
                                              OpStore %34 %101 
                 read_only Texture2D %102 = OpLoad %76 
                             sampler %103 = OpLoad %80 
          read_only Texture2DSampled %104 = OpSampledImage %102 %103 
                               f32_4 %105 = OpLoad %9 
                               f32_2 %106 = OpVectorShuffle %105 %105 2 3 
                               f32_4 %107 = OpImageSampleImplicitLod %104 %106 
                                              OpStore %9 %107 
                               f32_4 %108 = OpLoad %23 
                               f32_4 %109 = OpLoad %34 
                               f32_4 %110 = OpFAdd %108 %109 
                                              OpStore %23 %110 
                               f32_4 %111 = OpLoad %9 
                               f32_4 %112 = OpLoad %23 
                               f32_4 %113 = OpFAdd %111 %112 
                                              OpStore %9 %113 
                 read_only Texture2D %115 = OpLoad %114 
                             sampler %116 = OpLoad %80 
          read_only Texture2DSampled %117 = OpSampledImage %115 %116 
                               f32_2 %119 = OpLoad vs_TEXCOORD1 
                               f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                              OpStore %23 %120 
                               f32_4 %123 = OpLoad %9 
                               f32_4 %126 = OpFMul %123 %125 
                               f32_4 %127 = OpLoad %23 
                               f32_4 %128 = OpFAdd %126 %127 
                                              OpStore %122 %128 
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
  Name "Fog: Composite"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 238806
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
uniform 	vec4 _Time;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 hlslcc_mtx4x4clipToWorld[4];
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out float vs_TEXCOORD3;
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
    vs_TEXCOORD3 = _Time.y;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	ivec4 _SceneFogMode;
uniform 	vec4 _HeightParams;
uniform 	vec4 _DistanceParams;
uniform 	vec4 _SceneFogParams;
uniform 	vec4 _DensityParams;
uniform 	vec4 _NoiseParams;
uniform 	vec4 _FogColor;
uniform 	vec4 _SkyboxParams;
uniform 	vec4 _DirLightParams;
uniform 	vec4 _DirLightColor;
uniform 	float _FarClippingPlane;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform  sampler2D _NoiseTex;
UNITY_LOCATION(3) uniform  sampler2D _ColorGradient;
UNITY_LOCATION(4) uniform  sampler2D _SkyboxTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  float vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec3 u_xlat7;
float u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat13;
bvec2 u_xlatb13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat7.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.xzw = vs_TEXCOORD2.xyz * u_xlat1.xxx + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = (-unity_OrthoParams.w) + 1.0;
    u_xlat8 = (-unity_OrthoParams.w) * u_xlat7.x + 1.0;
    u_xlat7.x = u_xlat2.x * u_xlat7.x + _ZBufferParams.y;
    u_xlat7.x = u_xlat8 / u_xlat7.x;
    u_xlatb2 = 0.99000001<u_xlat7.x;
    u_xlatb8.xy = equal(_DistanceParams.zwzz, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat3.xyz = (-u_xlat1.xzw) + _WorldSpaceCameraPos.xyz;
    u_xlatb4 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat7.x = u_xlat7.x * _ProjectionParams.z;
    u_xlat7.x = (u_xlatb4.x) ? u_xlat20 : u_xlat7.x;
    u_xlat7.x = u_xlat7.x + (-_ProjectionParams.y);
    u_xlat7.x = u_xlat7.x * _DensityParams.x;
    u_xlat7.x = u_xlatb8.x ? u_xlat7.x : float(0.0);
    u_xlat8 = u_xlat7.x + _DistanceParams.x;
    if(u_xlatb8.y){
        u_xlatb14 = _SceneFogMode.w==1;
        if(u_xlatb14){
            u_xlat14.x = vs_TEXCOORD3 * _NoiseParams.y;
            u_xlat14.xy = u_xlat14.xx * vec2(0.0, 1.0);
            u_xlat1.xw = u_xlat1.xw * _NoiseParams.xx + u_xlat14.xy;
            u_xlat5 = texture(_NoiseTex, u_xlat1.xw);
            u_xlat1.x = (u_xlatb2) ? 0.0 : _DensityParams.y;
            u_xlat19 = u_xlat5.x + -1.0;
            u_xlat1.x = u_xlat1.x * u_xlat19 + 1.0;
        } else {
            u_xlat1.x = 1.0;
        }
        u_xlat3.xzw = u_xlat3.xyz * _HeightParams.www;
        u_xlat13.x = u_xlat1.z + (-_HeightParams.x);
        u_xlat19 = u_xlat13.x + _HeightParams.y;
        u_xlat14.x = (-_HeightParams.z) * 2.0 + 1.0;
        u_xlat13.x = u_xlat13.x * u_xlat14.x;
        u_xlat13.x = min(u_xlat13.x, 0.0);
        u_xlat14.x = dot(u_xlat3.xzw, u_xlat3.xzw);
        u_xlat14.x = sqrt(u_xlat14.x);
        u_xlat13.x = u_xlat13.x * u_xlat13.x;
        u_xlat20 = u_xlat3.y + 9.99999975e-06;
        u_xlat13.x = u_xlat13.x / abs(u_xlat20);
        u_xlat13.x = _HeightParams.z * u_xlat19 + (-u_xlat13.x);
        u_xlat13.x = u_xlat13.x * (-u_xlat14.x);
        u_xlat1.x = u_xlat1.x * u_xlat13.x;
    } else {
        u_xlat1.x = 0.0;
    }
    u_xlat1.x = u_xlat1.x + u_xlat8;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat13.xy = u_xlat1.xx * _SceneFogParams.yx;
    u_xlat1.x = u_xlat1.x * _SceneFogParams.z + _SceneFogParams.w;
    u_xlat1.x = u_xlatb4.y ? u_xlat1.x : float(0.0);
    u_xlat13.x = exp2((-u_xlat13.x));
    u_xlat1.x = (u_xlatb4.z) ? u_xlat13.x : u_xlat1.x;
    u_xlat13.x = u_xlat13.y * (-u_xlat13.y);
    u_xlat13.x = exp2(u_xlat13.x);
    u_xlat1.x = (u_xlatb4.w) ? u_xlat13.x : u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13.x = u_xlat1.x + -1.0;
    u_xlat13.x = _SkyboxParams.x * u_xlat13.x + 1.0;
    u_xlat1.x = (u_xlatb2) ? u_xlat13.x : u_xlat1.x;
    u_xlatb13.xy = equal(_SceneFogMode.zzzz, ivec4(1, 2, 1, 2)).xy;
    if(u_xlatb13.x){
        u_xlat2.x = u_xlat7.x / _FarClippingPlane;
        u_xlat2.y = 0.0;
        u_xlat2 = texture(_ColorGradient, u_xlat2.xy);
    } else {
        u_xlat2.xyz = _FogColor.xyz;
    }
    if(u_xlatb13.y){
        u_xlat2 = textureLod(_SkyboxTex, vs_TEXCOORD0.xy, 0.0);
    }
    u_xlat7.x = dot(vs_TEXCOORD2.xyz, _DirLightParams.xyz);
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat7.x = u_xlat7.x * _DirLightParams.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + _DirLightColor.xyz;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat7.xyz);
    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat7.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %18 %50 %74 %104 %112 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
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
                                                      OpMemberDecorate %55 3 Offset 55 
                                                      OpDecorate %55 Block 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate vs_TEXCOORD0 Location 74 
                                                      OpDecorate vs_TEXCOORD2 Location 104 
                                                      OpDecorate vs_TEXCOORD3 Location 112 
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
                                              %55 = OpTypeStruct %16 %7 %6 %54 
                                              %56 = OpTypePointer Uniform %55 
Uniform struct {f32_3; f32_4; f32; f32_4[4];}* %57 = OpVariable Uniform 
                                          i32 %58 = OpConstant 2 
                                              %59 = OpTypePointer Uniform %6 
                                          f32 %66 = OpConstant 3.674022E-40 
                                        f32_2 %67 = OpConstantComposite %66 %66 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_2 %70 = OpConstantComposite %69 %69 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                        f32_2 %78 = OpConstantComposite %42 %42 
                               Private f32_3* %80 = OpVariable Private 
                                          i32 %83 = OpConstant 3 
                                          i32 %84 = OpConstant 1 
                                              %85 = OpTypePointer Uniform %7 
                                             %103 = OpTypePointer Output %16 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                             %106 = OpTypePointer Uniform %16 
                                             %111 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD3 = OpVariable Output 
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
                               Uniform f32_4* %86 = OpAccessChain %57 %83 %84 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpFMul %82 %88 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %57 %83 %15 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %33 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 0 0 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_3 %96 = OpLoad %80 
                                        f32_3 %97 = OpFAdd %95 %96 
                                                      OpStore %33 %97 
                                        f32_3 %98 = OpLoad %33 
                               Uniform f32_4* %99 = OpAccessChain %57 %83 %83 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFAdd %98 %101 
                                                      OpStore %33 %102 
                                       f32_3 %105 = OpLoad %33 
                              Uniform f32_3* %107 = OpAccessChain %57 %15 
                                       f32_3 %108 = OpLoad %107 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %105 %109 
                                                      OpStore vs_TEXCOORD2 %110 
                                Uniform f32* %113 = OpAccessChain %57 %84 %9 
                                         f32 %114 = OpLoad %113 
                                                      OpStore vs_TEXCOORD3 %114 
                                 Output f32* %115 = OpAccessChain %13 %15 %9 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %13 %15 %9 
                                                      OpStore %118 %117 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 566
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %71 %222 %506 %551 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 22 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpMemberDecorate %45 0 Offset 45 
                                                      OpMemberDecorate %45 1 Offset 45 
                                                      OpMemberDecorate %45 2 Offset 45 
                                                      OpMemberDecorate %45 3 Offset 45 
                                                      OpMemberDecorate %45 4 Offset 45 
                                                      OpMemberDecorate %45 5 Offset 45 
                                                      OpMemberDecorate %45 6 Offset 45 
                                                      OpMemberDecorate %45 7 Offset 45 
                                                      OpMemberDecorate %45 8 Offset 45 
                                                      OpMemberDecorate %45 9 Offset 45 
                                                      OpMemberDecorate %45 10 Offset 45 
                                                      OpMemberDecorate %45 11 Offset 45 
                                                      OpMemberDecorate %45 12 Offset 45 
                                                      OpMemberDecorate %45 13 Offset 45 
                                                      OpMemberDecorate %45 14 Offset 45 
                                                      OpDecorate %45 Block 
                                                      OpDecorate %47 DescriptorSet 47 
                                                      OpDecorate %47 Binding 47 
                                                      OpDecorate vs_TEXCOORD2 Location 71 
                                                      OpDecorate vs_TEXCOORD3 Location 222 
                                                      OpDecorate %243 DescriptorSet 243 
                                                      OpDecorate %243 Binding 243 
                                                      OpDecorate %245 DescriptorSet 245 
                                                      OpDecorate %245 Binding 245 
                                                      OpDecorate %485 DescriptorSet 485 
                                                      OpDecorate %485 Binding 485 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate vs_TEXCOORD0 Location 506 
                                                      OpDecorate %551 Location 551 
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
                               Private f32_4* %25 = OpVariable Private 
         UniformConstant read_only Texture2D* %26 = OpVariable UniformConstant 
                     UniformConstant sampler* %28 = OpVariable UniformConstant 
                                              %33 = OpTypeInt 32 0 
                                          u32 %34 = OpConstant 0 
                                              %36 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 3 
                                              %39 = OpTypePointer Private %38 
                               Private f32_3* %40 = OpVariable Private 
                                              %43 = OpTypeInt 32 1 
                                              %44 = OpTypeVector %43 4 
                                              %45 = OpTypeStruct %38 %7 %7 %7 %44 %7 %7 %7 %7 %7 %7 %7 %7 %7 %6 
                                              %46 = OpTypePointer Uniform %45 
Uniform struct {f32_3; f32_4; f32_4; f32_4; i32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32;}* %47 = OpVariable Uniform 
                                          i32 %48 = OpConstant 3 
                                              %49 = OpTypePointer Uniform %6 
                                          u32 %54 = OpConstant 2 
                                          u32 %60 = OpConstant 3 
                                          f32 %65 = OpConstant 3.674022E-40 
                                              %70 = OpTypePointer Input %38 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                          i32 %76 = OpConstant 0 
                                              %77 = OpTypePointer Uniform %38 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %84 = OpConstant 2 
                                 Private f32* %90 = OpVariable Private 
                                         u32 %103 = OpConstant 1 
                                             %113 = OpTypeBool 
                                             %114 = OpTypePointer Private %113 
                               Private bool* %115 = OpVariable Private 
                                         f32 %116 = OpConstant 3.674022E-40 
                                             %120 = OpTypeVector %113 2 
                                             %121 = OpTypePointer Private %120 
                             Private bool_2* %122 = OpVariable Private 
                                         i32 %123 = OpConstant 6 
                                             %124 = OpTypePointer Uniform %7 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_4 %129 = OpConstantComposite %65 %65 %128 %128 
                                             %130 = OpTypeVector %113 4 
                              Private f32_4* %133 = OpVariable Private 
                                             %142 = OpTypePointer Private %130 
                             Private bool_4* %143 = OpVariable Private 
                                         i32 %144 = OpConstant 4 
                                             %145 = OpTypePointer Uniform %44 
                                         i32 %149 = OpConstant 1 
                                       i32_4 %150 = OpConstantComposite %149 %149 %84 %48 
                                Private f32* %152 = OpVariable Private 
                                             %168 = OpTypePointer Function %6 
                                         i32 %187 = OpConstant 8 
                               Private bool* %211 = OpVariable Private 
                                             %212 = OpTypePointer Uniform %43 
                                             %219 = OpTypePointer Private %20 
                              Private f32_2* %220 = OpVariable Private 
                                             %221 = OpTypePointer Input %6 
                          Input f32* vs_TEXCOORD3 = OpVariable Input 
                                         i32 %224 = OpConstant 9 
                                       f32_2 %231 = OpConstantComposite %128 %65 
        UniformConstant read_only Texture2D* %243 = OpVariable UniformConstant 
                    UniformConstant sampler* %245 = OpVariable UniformConstant 
                                Private f32* %253 = OpVariable Private 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         i32 %277 = OpConstant 5 
                              Private f32_2* %284 = OpVariable Private 
                                         f32 %300 = OpConstant 3.674022E-40 
                                         f32 %332 = OpConstant 3.674022E-40 
                                         i32 %375 = OpConstant 7 
                                         i32 %447 = OpConstant 11 
                             Private bool_2* %466 = OpVariable Private 
                                       i32_4 %470 = OpConstantComposite %149 %84 %149 %84 
                                         i32 %479 = OpConstant 14 
        UniformConstant read_only Texture2D* %485 = OpVariable UniformConstant 
                                         i32 %494 = OpConstant 10 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %511 = OpConstant 12 
                                         i32 %529 = OpConstant 13 
                                             %550 = OpTypePointer Output %7 
                               Output f32_4* %551 = OpVariable Output 
                                             %563 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %169 = OpVariable Function 
                               Function f32* %194 = OpVariable Function 
                               Function f32* %255 = OpVariable Function 
                               Function f32* %391 = OpVariable Function 
                               Function f32* %406 = OpVariable Function 
                               Function f32* %429 = OpVariable Function 
                               Function f32* %456 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                      OpStore %9 %24 
                          read_only Texture2D %27 = OpLoad %26 
                                      sampler %29 = OpLoad %28 
                   read_only Texture2DSampled %30 = OpSampledImage %27 %29 
                                        f32_2 %31 = OpLoad vs_TEXCOORD1 
                                        f32_4 %32 = OpImageSampleImplicitLod %30 %31 
                                          f32 %35 = OpCompositeExtract %32 0 
                                 Private f32* %37 = OpAccessChain %25 %34 
                                                      OpStore %37 %35 
                                 Private f32* %41 = OpAccessChain %25 %34 
                                          f32 %42 = OpLoad %41 
                                 Uniform f32* %50 = OpAccessChain %47 %48 %34 
                                          f32 %51 = OpLoad %50 
                                          f32 %52 = OpFMul %42 %51 
                                 Private f32* %53 = OpAccessChain %40 %34 
                                                      OpStore %53 %52 
                                 Uniform f32* %55 = OpAccessChain %47 %48 %54 
                                          f32 %56 = OpLoad %55 
                                 Private f32* %57 = OpAccessChain %25 %34 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %56 %58 
                                 Uniform f32* %61 = OpAccessChain %47 %48 %60 
                                          f32 %62 = OpLoad %61 
                                          f32 %63 = OpFAdd %59 %62 
                                 Private f32* %64 = OpAccessChain %25 %34 
                                                      OpStore %64 %63 
                                 Private f32* %66 = OpAccessChain %25 %34 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFDiv %65 %67 
                                 Private f32* %69 = OpAccessChain %25 %34 
                                                      OpStore %69 %68 
                                        f32_3 %72 = OpLoad vs_TEXCOORD2 
                                        f32_4 %73 = OpLoad %25 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 0 0 
                                        f32_3 %75 = OpFMul %72 %74 
                               Uniform f32_3* %78 = OpAccessChain %47 %76 
                                        f32_3 %79 = OpLoad %78 
                                        f32_3 %80 = OpFAdd %75 %79 
                                        f32_4 %81 = OpLoad %25 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 1 5 6 
                                                      OpStore %25 %82 
                                 Uniform f32* %85 = OpAccessChain %47 %84 %60 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpFNegate %86 
                                          f32 %88 = OpFAdd %87 %65 
                                 Private f32* %89 = OpAccessChain %83 %34 
                                                      OpStore %89 %88 
                                 Uniform f32* %91 = OpAccessChain %47 %84 %60 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpFNegate %92 
                                 Private f32* %94 = OpAccessChain %40 %34 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFMul %93 %95 
                                          f32 %97 = OpFAdd %96 %65 
                                                      OpStore %90 %97 
                                 Private f32* %98 = OpAccessChain %83 %34 
                                          f32 %99 = OpLoad %98 
                                Private f32* %100 = OpAccessChain %40 %34 
                                         f32 %101 = OpLoad %100 
                                         f32 %102 = OpFMul %99 %101 
                                Uniform f32* %104 = OpAccessChain %47 %48 %103 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %102 %105 
                                Private f32* %107 = OpAccessChain %40 %34 
                                                      OpStore %107 %106 
                                         f32 %108 = OpLoad %90 
                                Private f32* %109 = OpAccessChain %40 %34 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFDiv %108 %110 
                                Private f32* %112 = OpAccessChain %40 %34 
                                                      OpStore %112 %111 
                                Private f32* %117 = OpAccessChain %40 %34 
                                         f32 %118 = OpLoad %117 
                                        bool %119 = OpFOrdLessThan %116 %118 
                                                      OpStore %115 %119 
                              Uniform f32_4* %125 = OpAccessChain %47 %123 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpVectorShuffle %126 %126 2 3 2 2 
                                      bool_4 %131 = OpFOrdEqual %127 %129 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %122 %132 
                                       f32_4 %134 = OpLoad %25 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 2 3 
                                       f32_3 %136 = OpFNegate %135 
                              Uniform f32_3* %137 = OpAccessChain %47 %76 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %133 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %133 %141 
                              Uniform i32_4* %146 = OpAccessChain %47 %144 
                                       i32_4 %147 = OpLoad %146 
                                       i32_4 %148 = OpVectorShuffle %147 %147 1 0 0 0 
                                      bool_4 %151 = OpIEqual %148 %150 
                                                      OpStore %143 %151 
                                       f32_4 %153 = OpLoad %133 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_4 %155 = OpLoad %133 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %154 %156 
                                                      OpStore %152 %157 
                                         f32 %158 = OpLoad %152 
                                         f32 %159 = OpExtInst %1 31 %158 
                                                      OpStore %152 %159 
                                Private f32* %160 = OpAccessChain %40 %34 
                                         f32 %161 = OpLoad %160 
                                Uniform f32* %162 = OpAccessChain %47 %149 %54 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                Private f32* %165 = OpAccessChain %40 %34 
                                                      OpStore %165 %164 
                               Private bool* %166 = OpAccessChain %143 %34 
                                        bool %167 = OpLoad %166 
                                                      OpSelectionMerge %171 None 
                                                      OpBranchConditional %167 %170 %173 
                                             %170 = OpLabel 
                                         f32 %172 = OpLoad %152 
                                                      OpStore %169 %172 
                                                      OpBranch %171 
                                             %173 = OpLabel 
                                Private f32* %174 = OpAccessChain %40 %34 
                                         f32 %175 = OpLoad %174 
                                                      OpStore %169 %175 
                                                      OpBranch %171 
                                             %171 = OpLabel 
                                         f32 %176 = OpLoad %169 
                                Private f32* %177 = OpAccessChain %40 %34 
                                                      OpStore %177 %176 
                                Private f32* %178 = OpAccessChain %40 %34 
                                         f32 %179 = OpLoad %178 
                                Uniform f32* %180 = OpAccessChain %47 %149 %103 
                                         f32 %181 = OpLoad %180 
                                         f32 %182 = OpFNegate %181 
                                         f32 %183 = OpFAdd %179 %182 
                                Private f32* %184 = OpAccessChain %40 %34 
                                                      OpStore %184 %183 
                                Private f32* %185 = OpAccessChain %40 %34 
                                         f32 %186 = OpLoad %185 
                                Uniform f32* %188 = OpAccessChain %47 %187 %34 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %186 %189 
                                Private f32* %191 = OpAccessChain %40 %34 
                                                      OpStore %191 %190 
                               Private bool* %192 = OpAccessChain %122 %34 
                                        bool %193 = OpLoad %192 
                                                      OpSelectionMerge %196 None 
                                                      OpBranchConditional %193 %195 %199 
                                             %195 = OpLabel 
                                Private f32* %197 = OpAccessChain %40 %34 
                                         f32 %198 = OpLoad %197 
                                                      OpStore %194 %198 
                                                      OpBranch %196 
                                             %199 = OpLabel 
                                                      OpStore %194 %128 
                                                      OpBranch %196 
                                             %196 = OpLabel 
                                         f32 %200 = OpLoad %194 
                                Private f32* %201 = OpAccessChain %40 %34 
                                                      OpStore %201 %200 
                                Private f32* %202 = OpAccessChain %40 %34 
                                         f32 %203 = OpLoad %202 
                                Uniform f32* %204 = OpAccessChain %47 %123 %34 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFAdd %203 %205 
                                                      OpStore %90 %206 
                               Private bool* %207 = OpAccessChain %122 %103 
                                        bool %208 = OpLoad %207 
                                                      OpSelectionMerge %210 None 
                                                      OpBranchConditional %208 %209 %362 
                                             %209 = OpLabel 
                                Uniform i32* %213 = OpAccessChain %47 %144 %60 
                                         i32 %214 = OpLoad %213 
                                        bool %215 = OpIEqual %214 %149 
                                                      OpStore %211 %215 
                                        bool %216 = OpLoad %211 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %216 %217 %273 
                                             %217 = OpLabel 
                                         f32 %223 = OpLoad vs_TEXCOORD3 
                                Uniform f32* %225 = OpAccessChain %47 %224 %103 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFMul %223 %226 
                                Private f32* %228 = OpAccessChain %220 %34 
                                                      OpStore %228 %227 
                                       f32_2 %229 = OpLoad %220 
                                       f32_2 %230 = OpVectorShuffle %229 %229 0 0 
                                       f32_2 %232 = OpFMul %230 %231 
                                                      OpStore %220 %232 
                                       f32_4 %233 = OpLoad %25 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 3 
                              Uniform f32_4* %235 = OpAccessChain %47 %224 
                                       f32_4 %236 = OpLoad %235 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 0 
                                       f32_2 %238 = OpFMul %234 %237 
                                       f32_2 %239 = OpLoad %220 
                                       f32_2 %240 = OpFAdd %238 %239 
                                       f32_4 %241 = OpLoad %25 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 1 2 5 
                                                      OpStore %25 %242 
                         read_only Texture2D %244 = OpLoad %243 
                                     sampler %246 = OpLoad %245 
                  read_only Texture2DSampled %247 = OpSampledImage %244 %246 
                                       f32_4 %248 = OpLoad %25 
                                       f32_2 %249 = OpVectorShuffle %248 %248 0 3 
                                       f32_4 %250 = OpImageSampleImplicitLod %247 %249 
                                         f32 %251 = OpCompositeExtract %250 0 
                                Private f32* %252 = OpAccessChain %25 %34 
                                                      OpStore %252 %251 
                                        bool %254 = OpLoad %115 
                                                      OpSelectionMerge %257 None 
                                                      OpBranchConditional %254 %256 %258 
                                             %256 = OpLabel 
                                                      OpStore %255 %128 
                                                      OpBranch %257 
                                             %258 = OpLabel 
                                Uniform f32* %259 = OpAccessChain %47 %187 %103 
                                         f32 %260 = OpLoad %259 
                                                      OpStore %255 %260 
                                                      OpBranch %257 
                                             %257 = OpLabel 
                                         f32 %261 = OpLoad %255 
                                                      OpStore %253 %261 
                                Private f32* %262 = OpAccessChain %25 %34 
                                         f32 %263 = OpLoad %262 
                                         f32 %265 = OpFAdd %263 %264 
                                Private f32* %266 = OpAccessChain %25 %34 
                                                      OpStore %266 %265 
                                         f32 %267 = OpLoad %253 
                                Private f32* %268 = OpAccessChain %25 %34 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFMul %267 %269 
                                         f32 %271 = OpFAdd %270 %65 
                                Private f32* %272 = OpAccessChain %25 %34 
                                                      OpStore %272 %271 
                                                      OpBranch %218 
                                             %273 = OpLabel 
                                Private f32* %274 = OpAccessChain %25 %34 
                                                      OpStore %274 %65 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                       f32_4 %275 = OpLoad %133 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %47 %277 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 3 3 3 
                                       f32_3 %281 = OpFMul %276 %280 
                                       f32_4 %282 = OpLoad %133 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 1 5 6 
                                                      OpStore %133 %283 
                                Private f32* %285 = OpAccessChain %25 %54 
                                         f32 %286 = OpLoad %285 
                                Uniform f32* %287 = OpAccessChain %47 %277 %34 
                                         f32 %288 = OpLoad %287 
                                         f32 %289 = OpFNegate %288 
                                         f32 %290 = OpFAdd %286 %289 
                                Private f32* %291 = OpAccessChain %284 %34 
                                                      OpStore %291 %290 
                                Private f32* %292 = OpAccessChain %284 %34 
                                         f32 %293 = OpLoad %292 
                                Uniform f32* %294 = OpAccessChain %47 %277 %103 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                                      OpStore %253 %296 
                                Uniform f32* %297 = OpAccessChain %47 %277 %54 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFNegate %298 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %65 
                                Private f32* %303 = OpAccessChain %220 %34 
                                                      OpStore %303 %302 
                                Private f32* %304 = OpAccessChain %284 %34 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %220 %34 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpFMul %305 %307 
                                Private f32* %309 = OpAccessChain %284 %34 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %284 %34 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpExtInst %1 37 %311 %128 
                                Private f32* %313 = OpAccessChain %284 %34 
                                                      OpStore %313 %312 
                                       f32_4 %314 = OpLoad %133 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 2 3 
                                       f32_4 %316 = OpLoad %133 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 2 3 
                                         f32 %318 = OpDot %315 %317 
                                Private f32* %319 = OpAccessChain %220 %34 
                                                      OpStore %319 %318 
                                Private f32* %320 = OpAccessChain %220 %34 
                                         f32 %321 = OpLoad %320 
                                         f32 %322 = OpExtInst %1 31 %321 
                                Private f32* %323 = OpAccessChain %220 %34 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %284 %34 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %284 %34 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFMul %325 %327 
                                Private f32* %329 = OpAccessChain %284 %34 
                                                      OpStore %329 %328 
                                Private f32* %330 = OpAccessChain %133 %103 
                                         f32 %331 = OpLoad %330 
                                         f32 %333 = OpFAdd %331 %332 
                                                      OpStore %152 %333 
                                Private f32* %334 = OpAccessChain %284 %34 
                                         f32 %335 = OpLoad %334 
                                         f32 %336 = OpLoad %152 
                                         f32 %337 = OpExtInst %1 4 %336 
                                         f32 %338 = OpFDiv %335 %337 
                                Private f32* %339 = OpAccessChain %284 %34 
                                                      OpStore %339 %338 
                                Uniform f32* %340 = OpAccessChain %47 %277 %54 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpLoad %253 
                                         f32 %343 = OpFMul %341 %342 
                                Private f32* %344 = OpAccessChain %284 %34 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFNegate %345 
                                         f32 %347 = OpFAdd %343 %346 
                                Private f32* %348 = OpAccessChain %284 %34 
                                                      OpStore %348 %347 
                                Private f32* %349 = OpAccessChain %284 %34 
                                         f32 %350 = OpLoad %349 
                                Private f32* %351 = OpAccessChain %220 %34 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpFNegate %352 
                                         f32 %354 = OpFMul %350 %353 
                                Private f32* %355 = OpAccessChain %284 %34 
                                                      OpStore %355 %354 
                                Private f32* %356 = OpAccessChain %25 %34 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %284 %34 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFMul %357 %359 
                                Private f32* %361 = OpAccessChain %25 %34 
                                                      OpStore %361 %360 
                                                      OpBranch %210 
                                             %362 = OpLabel 
                                Private f32* %363 = OpAccessChain %25 %34 
                                                      OpStore %363 %128 
                                                      OpBranch %210 
                                             %210 = OpLabel 
                                Private f32* %364 = OpAccessChain %25 %34 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpLoad %90 
                                         f32 %367 = OpFAdd %365 %366 
                                Private f32* %368 = OpAccessChain %25 %34 
                                                      OpStore %368 %367 
                                Private f32* %369 = OpAccessChain %25 %34 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpExtInst %1 40 %370 %128 
                                Private f32* %372 = OpAccessChain %25 %34 
                                                      OpStore %372 %371 
                                       f32_4 %373 = OpLoad %25 
                                       f32_2 %374 = OpVectorShuffle %373 %373 0 0 
                              Uniform f32_4* %376 = OpAccessChain %47 %375 
                                       f32_4 %377 = OpLoad %376 
                                       f32_2 %378 = OpVectorShuffle %377 %377 1 0 
                                       f32_2 %379 = OpFMul %374 %378 
                                                      OpStore %284 %379 
                                Private f32* %380 = OpAccessChain %25 %34 
                                         f32 %381 = OpLoad %380 
                                Uniform f32* %382 = OpAccessChain %47 %375 %54 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFMul %381 %383 
                                Uniform f32* %385 = OpAccessChain %47 %375 %60 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                Private f32* %388 = OpAccessChain %25 %34 
                                                      OpStore %388 %387 
                               Private bool* %389 = OpAccessChain %143 %103 
                                        bool %390 = OpLoad %389 
                                                      OpSelectionMerge %393 None 
                                                      OpBranchConditional %390 %392 %396 
                                             %392 = OpLabel 
                                Private f32* %394 = OpAccessChain %25 %34 
                                         f32 %395 = OpLoad %394 
                                                      OpStore %391 %395 
                                                      OpBranch %393 
                                             %396 = OpLabel 
                                                      OpStore %391 %128 
                                                      OpBranch %393 
                                             %393 = OpLabel 
                                         f32 %397 = OpLoad %391 
                                Private f32* %398 = OpAccessChain %25 %34 
                                                      OpStore %398 %397 
                                Private f32* %399 = OpAccessChain %284 %34 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpFNegate %400 
                                         f32 %402 = OpExtInst %1 29 %401 
                                Private f32* %403 = OpAccessChain %284 %34 
                                                      OpStore %403 %402 
                               Private bool* %404 = OpAccessChain %143 %54 
                                        bool %405 = OpLoad %404 
                                                      OpSelectionMerge %408 None 
                                                      OpBranchConditional %405 %407 %411 
                                             %407 = OpLabel 
                                Private f32* %409 = OpAccessChain %284 %34 
                                         f32 %410 = OpLoad %409 
                                                      OpStore %406 %410 
                                                      OpBranch %408 
                                             %411 = OpLabel 
                                Private f32* %412 = OpAccessChain %25 %34 
                                         f32 %413 = OpLoad %412 
                                                      OpStore %406 %413 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         f32 %414 = OpLoad %406 
                                Private f32* %415 = OpAccessChain %25 %34 
                                                      OpStore %415 %414 
                                Private f32* %416 = OpAccessChain %284 %103 
                                         f32 %417 = OpLoad %416 
                                Private f32* %418 = OpAccessChain %284 %103 
                                         f32 %419 = OpLoad %418 
                                         f32 %420 = OpFNegate %419 
                                         f32 %421 = OpFMul %417 %420 
                                Private f32* %422 = OpAccessChain %284 %34 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %284 %34 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpExtInst %1 29 %424 
                                Private f32* %426 = OpAccessChain %284 %34 
                                                      OpStore %426 %425 
                               Private bool* %427 = OpAccessChain %143 %60 
                                        bool %428 = OpLoad %427 
                                                      OpSelectionMerge %431 None 
                                                      OpBranchConditional %428 %430 %434 
                                             %430 = OpLabel 
                                Private f32* %432 = OpAccessChain %284 %34 
                                         f32 %433 = OpLoad %432 
                                                      OpStore %429 %433 
                                                      OpBranch %431 
                                             %434 = OpLabel 
                                Private f32* %435 = OpAccessChain %25 %34 
                                         f32 %436 = OpLoad %435 
                                                      OpStore %429 %436 
                                                      OpBranch %431 
                                             %431 = OpLabel 
                                         f32 %437 = OpLoad %429 
                                Private f32* %438 = OpAccessChain %25 %34 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %25 %34 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpExtInst %1 43 %440 %128 %65 
                                Private f32* %442 = OpAccessChain %25 %34 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %25 %34 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpFAdd %444 %264 
                                Private f32* %446 = OpAccessChain %284 %34 
                                                      OpStore %446 %445 
                                Uniform f32* %448 = OpAccessChain %47 %447 %34 
                                         f32 %449 = OpLoad %448 
                                Private f32* %450 = OpAccessChain %284 %34 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFMul %449 %451 
                                         f32 %453 = OpFAdd %452 %65 
                                Private f32* %454 = OpAccessChain %284 %34 
                                                      OpStore %454 %453 
                                        bool %455 = OpLoad %115 
                                                      OpSelectionMerge %458 None 
                                                      OpBranchConditional %455 %457 %461 
                                             %457 = OpLabel 
                                Private f32* %459 = OpAccessChain %284 %34 
                                         f32 %460 = OpLoad %459 
                                                      OpStore %456 %460 
                                                      OpBranch %458 
                                             %461 = OpLabel 
                                Private f32* %462 = OpAccessChain %25 %34 
                                         f32 %463 = OpLoad %462 
                                                      OpStore %456 %463 
                                                      OpBranch %458 
                                             %458 = OpLabel 
                                         f32 %464 = OpLoad %456 
                                Private f32* %465 = OpAccessChain %25 %34 
                                                      OpStore %465 %464 
                              Uniform i32_4* %467 = OpAccessChain %47 %144 
                                       i32_4 %468 = OpLoad %467 
                                       i32_4 %469 = OpVectorShuffle %468 %468 2 2 2 2 
                                      bool_4 %471 = OpIEqual %469 %470 
                                      bool_2 %472 = OpVectorShuffle %471 %471 0 1 
                                                      OpStore %466 %472 
                               Private bool* %473 = OpAccessChain %466 %34 
                                        bool %474 = OpLoad %473 
                                                      OpSelectionMerge %476 None 
                                                      OpBranchConditional %474 %475 %493 
                                             %475 = OpLabel 
                                Private f32* %477 = OpAccessChain %40 %34 
                                         f32 %478 = OpLoad %477 
                                Uniform f32* %480 = OpAccessChain %47 %479 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpFDiv %478 %481 
                                Private f32* %483 = OpAccessChain %83 %34 
                                                      OpStore %483 %482 
                                Private f32* %484 = OpAccessChain %83 %103 
                                                      OpStore %484 %128 
                         read_only Texture2D %486 = OpLoad %485 
                                     sampler %487 = OpLoad %28 
                  read_only Texture2DSampled %488 = OpSampledImage %486 %487 
                                       f32_3 %489 = OpLoad %83 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 1 
                                       f32_4 %491 = OpImageSampleImplicitLod %488 %490 
                                       f32_3 %492 = OpVectorShuffle %491 %491 0 1 2 
                                                      OpStore %83 %492 
                                                      OpBranch %476 
                                             %493 = OpLabel 
                              Uniform f32_4* %495 = OpAccessChain %47 %494 
                                       f32_4 %496 = OpLoad %495 
                                       f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
                                                      OpStore %83 %497 
                                                      OpBranch %476 
                                             %476 = OpLabel 
                               Private bool* %498 = OpAccessChain %466 %103 
                                        bool %499 = OpLoad %498 
                                                      OpSelectionMerge %501 None 
                                                      OpBranchConditional %499 %500 %501 
                                             %500 = OpLabel 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %504 = OpLoad %28 
                  read_only Texture2DSampled %505 = OpSampledImage %503 %504 
                                       f32_2 %507 = OpLoad vs_TEXCOORD0 
                                       f32_4 %508 = OpImageSampleExplicitLod %505 %507 Lod %7 
                                       f32_3 %509 = OpVectorShuffle %508 %508 0 1 2 
                                                      OpStore %83 %509 
                                                      OpBranch %501 
                                             %501 = OpLabel 
                                       f32_3 %510 = OpLoad vs_TEXCOORD2 
                              Uniform f32_4* %512 = OpAccessChain %47 %511 
                                       f32_4 %513 = OpLoad %512 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
                                         f32 %515 = OpDot %510 %514 
                                Private f32* %516 = OpAccessChain %40 %34 
                                                      OpStore %516 %515 
                                Private f32* %517 = OpAccessChain %40 %34 
                                         f32 %518 = OpLoad %517 
                                         f32 %519 = OpExtInst %1 43 %518 %128 %65 
                                Private f32* %520 = OpAccessChain %40 %34 
                                                      OpStore %520 %519 
                                Private f32* %521 = OpAccessChain %40 %34 
                                         f32 %522 = OpLoad %521 
                                Uniform f32* %523 = OpAccessChain %47 %511 %60 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpFMul %522 %524 
                                Private f32* %526 = OpAccessChain %40 %34 
                                                      OpStore %526 %525 
                                       f32_3 %527 = OpLoad %83 
                                       f32_3 %528 = OpFNegate %527 
                              Uniform f32_4* %530 = OpAccessChain %47 %529 
                                       f32_4 %531 = OpLoad %530 
                                       f32_3 %532 = OpVectorShuffle %531 %531 0 1 2 
                                       f32_3 %533 = OpFAdd %528 %532 
                                       f32_4 %534 = OpLoad %133 
                                       f32_4 %535 = OpVectorShuffle %534 %533 4 5 6 3 
                                                      OpStore %133 %535 
                                       f32_3 %536 = OpLoad %40 
                                       f32_3 %537 = OpVectorShuffle %536 %536 0 0 0 
                                       f32_4 %538 = OpLoad %133 
                                       f32_3 %539 = OpVectorShuffle %538 %538 0 1 2 
                                       f32_3 %540 = OpFMul %537 %539 
                                       f32_3 %541 = OpLoad %83 
                                       f32_3 %542 = OpFAdd %540 %541 
                                                      OpStore %40 %542 
                                       f32_4 %543 = OpLoad %9 
                                       f32_3 %544 = OpVectorShuffle %543 %543 0 1 2 
                                       f32_3 %545 = OpLoad %40 
                                       f32_3 %546 = OpFNegate %545 
                                       f32_3 %547 = OpFAdd %544 %546 
                                       f32_4 %548 = OpLoad %9 
                                       f32_4 %549 = OpVectorShuffle %548 %547 4 5 6 3 
                                                      OpStore %9 %549 
                                       f32_4 %552 = OpLoad %25 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 0 0 
                                       f32_4 %554 = OpLoad %9 
                                       f32_3 %555 = OpVectorShuffle %554 %554 0 1 2 
                                       f32_3 %556 = OpFMul %553 %555 
                                       f32_3 %557 = OpLoad %40 
                                       f32_3 %558 = OpFAdd %556 %557 
                                       f32_4 %559 = OpLoad %551 
                                       f32_4 %560 = OpVectorShuffle %559 %558 4 5 6 3 
                                                      OpStore %551 %560 
                                Private f32* %561 = OpAccessChain %9 %60 
                                         f32 %562 = OpLoad %561 
                                 Output f32* %564 = OpAccessChain %551 %60 
                                                      OpStore %564 %562 
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
  Name "Fog: Light Scattering Composite"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 298293
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
uniform 	vec4 _Time;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 hlslcc_mtx4x4clipToWorld[4];
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out float vs_TEXCOORD3;
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
    vs_TEXCOORD3 = _Time.y;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	ivec4 _SceneFogMode;
uniform 	vec4 _HeightParams;
uniform 	vec4 _DistanceParams;
uniform 	vec4 _SceneFogParams;
uniform 	vec4 _DensityParams;
uniform 	vec4 _NoiseParams;
uniform 	vec4 _FogColor;
uniform 	vec4 _SkyboxParams;
uniform 	vec4 _DirLightParams;
uniform 	vec4 _DirLightColor;
uniform 	float _FarClippingPlane;
uniform 	vec4 _ScatteringParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BloomTex;
UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
UNITY_LOCATION(3) uniform  sampler2D _NoiseTex;
UNITY_LOCATION(4) uniform  sampler2D _ColorGradient;
UNITY_LOCATION(5) uniform  sampler2D _SkyboxTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  float vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bvec4 u_xlatb6;
vec2 u_xlat10;
float u_xlat11;
float u_xlat17;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = texture(_BloomTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat1.xyz * _ScatteringParams.yyy;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat22 = u_xlat3.x * _ZBufferParams.x;
    u_xlat23 = _ZBufferParams.z * u_xlat3.x + _ZBufferParams.w;
    u_xlat23 = float(1.0) / u_xlat23;
    u_xlat3.xyz = vs_TEXCOORD2.xyz * vec3(u_xlat23) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = (-unity_OrthoParams.w) + 1.0;
    u_xlat24 = (-unity_OrthoParams.w) * u_xlat22 + 1.0;
    u_xlat22 = u_xlat23 * u_xlat22 + _ZBufferParams.y;
    u_xlat22 = u_xlat24 / u_xlat22;
    u_xlatb23 = 0.99000001<u_xlat22;
    u_xlatb4.xy = equal(_DistanceParams.zwzz, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat5.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb6 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = sqrt(u_xlat24);
    u_xlat22 = u_xlat22 * _ProjectionParams.z;
    u_xlat22 = (u_xlatb6.x) ? u_xlat24 : u_xlat22;
    u_xlat22 = u_xlat22 + (-_ProjectionParams.y);
    u_xlat22 = u_xlat22 * _DensityParams.x;
    u_xlat22 = u_xlatb4.x ? u_xlat22 : float(0.0);
    u_xlat24 = u_xlat22 + _DistanceParams.x;
    if(u_xlatb4.y){
        u_xlatb4.x = _SceneFogMode.w==1;
        if(u_xlatb4.x){
            u_xlat4.x = vs_TEXCOORD3 * _NoiseParams.y;
            u_xlat4.xy = u_xlat4.xx * vec2(0.0, 1.0);
            u_xlat3.xz = u_xlat3.xz * _NoiseParams.xx + u_xlat4.xy;
            u_xlat4 = texture(_NoiseTex, u_xlat3.xz);
            u_xlat3.x = (u_xlatb23) ? 0.0 : _DensityParams.y;
            u_xlat17 = u_xlat4.x + -1.0;
            u_xlat3.x = u_xlat3.x * u_xlat17 + 1.0;
        } else {
            u_xlat3.x = 1.0;
        }
        u_xlat4.xyz = u_xlat5.xyz * _HeightParams.www;
        u_xlat10.x = u_xlat3.y + (-_HeightParams.x);
        u_xlat17 = u_xlat10.x + _HeightParams.y;
        u_xlat25 = (-_HeightParams.z) * 2.0 + 1.0;
        u_xlat10.x = u_xlat10.x * u_xlat25;
        u_xlat10.x = min(u_xlat10.x, 0.0);
        u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat4.x = sqrt(u_xlat4.x);
        u_xlat10.x = u_xlat10.x * u_xlat10.x;
        u_xlat11 = u_xlat5.y + 9.99999975e-06;
        u_xlat10.x = u_xlat10.x / abs(u_xlat11);
        u_xlat10.x = _HeightParams.z * u_xlat17 + (-u_xlat10.x);
        u_xlat10.x = u_xlat10.x * (-u_xlat4.x);
        u_xlat3.x = u_xlat3.x * u_xlat10.x;
    } else {
        u_xlat3.x = 0.0;
    }
    u_xlat3.x = u_xlat3.x + u_xlat24;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat10.xy = u_xlat3.xx * _SceneFogParams.yx;
    u_xlat3.x = u_xlat3.x * _SceneFogParams.z + _SceneFogParams.w;
    u_xlat3.x = u_xlatb6.y ? u_xlat3.x : float(0.0);
    u_xlat10.x = exp2((-u_xlat10.x));
    u_xlat3.x = (u_xlatb6.z) ? u_xlat10.x : u_xlat3.x;
    u_xlat10.x = u_xlat10.y * (-u_xlat10.y);
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat3.x = (u_xlatb6.w) ? u_xlat10.x : u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat10.x = u_xlat3.x + -1.0;
    u_xlat10.x = _SkyboxParams.x * u_xlat10.x + 1.0;
    u_xlat23 = (u_xlatb23) ? u_xlat10.x : u_xlat3.x;
    u_xlatb3.xy = equal(_SceneFogMode.zzzz, ivec4(1, 2, 0, 0)).xy;
    if(u_xlatb3.x){
        u_xlat4.x = u_xlat22 / _FarClippingPlane;
        u_xlat4.y = 0.0;
        u_xlat4 = texture(_ColorGradient, u_xlat4.xy);
    } else {
        u_xlat4.xyz = _FogColor.xyz;
    }
    if(u_xlatb3.y){
        u_xlat4 = textureLod(_SkyboxTex, vs_TEXCOORD0.xy, 0.0);
    }
    u_xlat22 = dot(vs_TEXCOORD2.xyz, _DirLightParams.xyz);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _DirLightParams.w;
    u_xlat3.xyz = (-u_xlat4.xyz) + _DirLightColor.xyz;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = u_xlat1.xyz * _ScatteringParams.yyy + u_xlat3.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) * _ScatteringParams.yyy + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = (-u_xlat3.xyz) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat23) * u_xlat0.xyz + u_xlat3.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 120
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %18 %50 %74 %104 %112 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
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
                                                      OpMemberDecorate %55 3 Offset 55 
                                                      OpDecorate %55 Block 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate vs_TEXCOORD0 Location 74 
                                                      OpDecorate vs_TEXCOORD2 Location 104 
                                                      OpDecorate vs_TEXCOORD3 Location 112 
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
                                              %55 = OpTypeStruct %16 %7 %6 %54 
                                              %56 = OpTypePointer Uniform %55 
Uniform struct {f32_3; f32_4; f32; f32_4[4];}* %57 = OpVariable Uniform 
                                          i32 %58 = OpConstant 2 
                                              %59 = OpTypePointer Uniform %6 
                                          f32 %66 = OpConstant 3.674022E-40 
                                        f32_2 %67 = OpConstantComposite %66 %66 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_2 %70 = OpConstantComposite %69 %69 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                        f32_2 %78 = OpConstantComposite %42 %42 
                               Private f32_3* %80 = OpVariable Private 
                                          i32 %83 = OpConstant 3 
                                          i32 %84 = OpConstant 1 
                                              %85 = OpTypePointer Uniform %7 
                                             %103 = OpTypePointer Output %16 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                             %106 = OpTypePointer Uniform %16 
                                             %111 = OpTypePointer Output %6 
                         Output f32* vs_TEXCOORD3 = OpVariable Output 
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
                               Uniform f32_4* %86 = OpAccessChain %57 %83 %84 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                                        f32_3 %89 = OpFMul %82 %88 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %57 %83 %15 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %33 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 0 0 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_3 %96 = OpLoad %80 
                                        f32_3 %97 = OpFAdd %95 %96 
                                                      OpStore %33 %97 
                                        f32_3 %98 = OpLoad %33 
                               Uniform f32_4* %99 = OpAccessChain %57 %83 %83 
                                       f32_4 %100 = OpLoad %99 
                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                       f32_3 %102 = OpFAdd %98 %101 
                                                      OpStore %33 %102 
                                       f32_3 %105 = OpLoad %33 
                              Uniform f32_3* %107 = OpAccessChain %57 %15 
                                       f32_3 %108 = OpLoad %107 
                                       f32_3 %109 = OpFNegate %108 
                                       f32_3 %110 = OpFAdd %105 %109 
                                                      OpStore vs_TEXCOORD2 %110 
                                Uniform f32* %113 = OpAccessChain %57 %84 %9 
                                         f32 %114 = OpLoad %113 
                                                      OpStore vs_TEXCOORD3 %114 
                                 Output f32* %115 = OpAccessChain %13 %15 %9 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                 Output f32* %118 = OpAccessChain %13 %15 %9 
                                                      OpStore %118 %117 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 573
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %81 %197 %483 %557 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 22 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpMemberDecorate %40 9 Offset 40 
                                                      OpMemberDecorate %40 10 Offset 40 
                                                      OpMemberDecorate %40 11 Offset 40 
                                                      OpMemberDecorate %40 12 Offset 40 
                                                      OpMemberDecorate %40 13 Offset 40 
                                                      OpMemberDecorate %40 14 Offset 40 
                                                      OpMemberDecorate %40 15 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate vs_TEXCOORD2 Location 81 
                                                      OpDecorate vs_TEXCOORD3 Location 197 
                                                      OpDecorate %221 DescriptorSet 221 
                                                      OpDecorate %221 Binding 221 
                                                      OpDecorate %223 DescriptorSet 223 
                                                      OpDecorate %223 Binding 223 
                                                      OpDecorate %458 DescriptorSet 458 
                                                      OpDecorate %458 Binding 458 
                                                      OpDecorate %479 DescriptorSet 479 
                                                      OpDecorate %479 Binding 479 
                                                      OpDecorate vs_TEXCOORD0 Location 483 
                                                      OpDecorate %557 Location 557 
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
                                              %26 = OpTypePointer Private %25 
                               Private f32_3* %27 = OpVariable Private 
         UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                     UniformConstant sampler* %30 = OpVariable UniformConstant 
                               Private f32_3* %36 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypeStruct %25 %7 %7 %7 %39 %7 %7 %7 %7 %7 %7 %7 %7 %7 %6 %7 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_3; f32_4; f32_4; f32_4; i32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %42 = OpVariable Uniform 
                                          i32 %43 = OpConstant 15 
                                              %44 = OpTypePointer Uniform %7 
                                              %49 = OpTypePointer Private %6 
                                 Private f32* %50 = OpVariable Private 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %57 = OpTypeInt 32 0 
                                          u32 %58 = OpConstant 0 
                                 Private f32* %60 = OpVariable Private 
                                          i32 %62 = OpConstant 3 
                                              %63 = OpTypePointer Uniform %6 
                                          u32 %67 = OpConstant 2 
                                          u32 %72 = OpConstant 3 
                                          f32 %76 = OpConstant 3.674022E-40 
                               Private f32_4* %79 = OpVariable Private 
                                              %80 = OpTypePointer Input %25 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                          i32 %86 = OpConstant 0 
                                              %87 = OpTypePointer Uniform %25 
                                          i32 %93 = OpConstant 2 
                                 Private f32* %98 = OpVariable Private 
                                         u32 %108 = OpConstant 1 
                                             %115 = OpTypeBool 
                                             %116 = OpTypePointer Private %115 
                               Private bool* %117 = OpVariable Private 
                                         f32 %118 = OpConstant 3.674022E-40 
                                             %121 = OpTypeVector %115 2 
                                             %122 = OpTypePointer Private %121 
                             Private bool_2* %123 = OpVariable Private 
                                         i32 %124 = OpConstant 6 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_4 %129 = OpConstantComposite %76 %76 %128 %128 
                                             %130 = OpTypeVector %115 4 
                              Private f32_3* %133 = OpVariable Private 
                                             %140 = OpTypePointer Private %130 
                             Private bool_4* %141 = OpVariable Private 
                                         i32 %142 = OpConstant 4 
                                             %143 = OpTypePointer Uniform %39 
                                         i32 %147 = OpConstant 1 
                                       i32_4 %148 = OpConstantComposite %147 %147 %93 %62 
                                         i32 %170 = OpConstant 8 
                                             %186 = OpTypePointer Uniform %38 
                              Private f32_3* %195 = OpVariable Private 
                                             %196 = OpTypePointer Input %6 
                          Input f32* vs_TEXCOORD3 = OpVariable Input 
                                         i32 %199 = OpConstant 9 
                                       f32_2 %206 = OpConstantComposite %128 %76 
        UniformConstant read_only Texture2D* %221 = OpVariable UniformConstant 
                    UniformConstant sampler* %223 = OpVariable UniformConstant 
                                Private f32* %231 = OpVariable Private 
                                             %233 = OpTypePointer Function %6 
                                         f32 %243 = OpConstant 3.674022E-40 
                                         i32 %255 = OpConstant 5 
                                             %260 = OpTypePointer Private %20 
                              Private f32_2* %261 = OpVariable Private 
                                Private f32* %274 = OpVariable Private 
                                         f32 %278 = OpConstant 3.674022E-40 
                                Private f32* %304 = OpVariable Private 
                                         f32 %307 = OpConstant 3.674022E-40 
                                         i32 %350 = OpConstant 7 
                                         i32 %422 = OpConstant 11 
                             Private bool_2* %440 = OpVariable Private 
                                       i32_4 %444 = OpConstantComposite %147 %93 %86 %86 
                                         i32 %452 = OpConstant 14 
        UniformConstant read_only Texture2D* %458 = OpVariable UniformConstant 
                                         i32 %469 = OpConstant 10 
        UniformConstant read_only Texture2D* %479 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                         i32 %490 = OpConstant 12 
                                         i32 %504 = OpConstant 13 
                                             %556 = OpTypePointer Output %7 
                               Output f32_4* %557 = OpVariable Output 
                                             %570 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %234 = OpVariable Function 
                               Function f32* %366 = OpVariable Function 
                               Function f32* %381 = OpVariable Function 
                               Function f32* %404 = OpVariable Function 
                               Function f32* %431 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                      OpStore %9 %24 
                          read_only Texture2D %29 = OpLoad %28 
                                      sampler %31 = OpLoad %30 
                   read_only Texture2DSampled %32 = OpSampledImage %29 %31 
                                        f32_2 %33 = OpLoad vs_TEXCOORD1 
                                        f32_4 %34 = OpImageSampleImplicitLod %32 %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                                      OpStore %27 %35 
                                        f32_3 %37 = OpLoad %27 
                               Uniform f32_4* %45 = OpAccessChain %42 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 1 1 1 
                                        f32_3 %48 = OpFMul %37 %47 
                                                      OpStore %36 %48 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %53 = OpLoad %30 
                   read_only Texture2DSampled %54 = OpSampledImage %52 %53 
                                        f32_2 %55 = OpLoad vs_TEXCOORD1 
                                        f32_4 %56 = OpImageSampleImplicitLod %54 %55 
                                          f32 %59 = OpCompositeExtract %56 0 
                                                      OpStore %50 %59 
                                          f32 %61 = OpLoad %50 
                                 Uniform f32* %64 = OpAccessChain %42 %62 %58 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFMul %61 %65 
                                                      OpStore %60 %66 
                                 Uniform f32* %68 = OpAccessChain %42 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpLoad %50 
                                          f32 %71 = OpFMul %69 %70 
                                 Uniform f32* %73 = OpAccessChain %42 %62 %72 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFAdd %71 %74 
                                                      OpStore %50 %75 
                                          f32 %77 = OpLoad %50 
                                          f32 %78 = OpFDiv %76 %77 
                                                      OpStore %50 %78 
                                        f32_3 %82 = OpLoad vs_TEXCOORD2 
                                          f32 %83 = OpLoad %50 
                                        f32_3 %84 = OpCompositeConstruct %83 %83 %83 
                                        f32_3 %85 = OpFMul %82 %84 
                               Uniform f32_3* %88 = OpAccessChain %42 %86 
                                        f32_3 %89 = OpLoad %88 
                                        f32_3 %90 = OpFAdd %85 %89 
                                        f32_4 %91 = OpLoad %79 
                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
                                                      OpStore %79 %92 
                                 Uniform f32* %94 = OpAccessChain %42 %93 %72 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFNegate %95 
                                          f32 %97 = OpFAdd %96 %76 
                                                      OpStore %50 %97 
                                 Uniform f32* %99 = OpAccessChain %42 %93 %72 
                                         f32 %100 = OpLoad %99 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpLoad %60 
                                         f32 %103 = OpFMul %101 %102 
                                         f32 %104 = OpFAdd %103 %76 
                                                      OpStore %98 %104 
                                         f32 %105 = OpLoad %50 
                                         f32 %106 = OpLoad %60 
                                         f32 %107 = OpFMul %105 %106 
                                Uniform f32* %109 = OpAccessChain %42 %62 %108 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %107 %110 
                                                      OpStore %50 %111 
                                         f32 %112 = OpLoad %98 
                                         f32 %113 = OpLoad %50 
                                         f32 %114 = OpFDiv %112 %113 
                                                      OpStore %50 %114 
                                         f32 %119 = OpLoad %50 
                                        bool %120 = OpFOrdLessThan %118 %119 
                                                      OpStore %117 %120 
                              Uniform f32_4* %125 = OpAccessChain %42 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpVectorShuffle %126 %126 2 3 2 2 
                                      bool_4 %131 = OpFOrdEqual %127 %129 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %123 %132 
                                       f32_4 %134 = OpLoad %79 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFNegate %135 
                              Uniform f32_3* %137 = OpAccessChain %42 %86 
                                       f32_3 %138 = OpLoad %137 
                                       f32_3 %139 = OpFAdd %136 %138 
                                                      OpStore %133 %139 
                              Uniform i32_4* %144 = OpAccessChain %42 %142 
                                       i32_4 %145 = OpLoad %144 
                                       i32_4 %146 = OpVectorShuffle %145 %145 1 0 0 0 
                                      bool_4 %149 = OpIEqual %146 %148 
                                                      OpStore %141 %149 
                                       f32_3 %150 = OpLoad %133 
                                       f32_3 %151 = OpLoad %133 
                                         f32 %152 = OpDot %150 %151 
                                                      OpStore %98 %152 
                                         f32 %153 = OpLoad %98 
                                         f32 %154 = OpExtInst %1 31 %153 
                                                      OpStore %98 %154 
                                         f32 %155 = OpLoad %50 
                                Uniform f32* %156 = OpAccessChain %42 %147 %67 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFMul %155 %157 
                                                      OpStore %50 %158 
                               Private bool* %159 = OpAccessChain %141 %58 
                                        bool %160 = OpLoad %159 
                                         f32 %161 = OpLoad %98 
                                         f32 %162 = OpLoad %50 
                                         f32 %163 = OpSelect %160 %161 %162 
                                                      OpStore %50 %163 
                                         f32 %164 = OpLoad %50 
                                Uniform f32* %165 = OpAccessChain %42 %147 %108 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFNegate %166 
                                         f32 %168 = OpFAdd %164 %167 
                                                      OpStore %50 %168 
                                         f32 %169 = OpLoad %50 
                                Uniform f32* %171 = OpAccessChain %42 %170 %58 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFMul %169 %172 
                                                      OpStore %50 %173 
                               Private bool* %174 = OpAccessChain %123 %58 
                                        bool %175 = OpLoad %174 
                                         f32 %176 = OpLoad %50 
                                         f32 %177 = OpSelect %175 %176 %128 
                                                      OpStore %50 %177 
                                         f32 %178 = OpLoad %50 
                                Uniform f32* %179 = OpAccessChain %42 %124 %58 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %178 %180 
                                                      OpStore %98 %181 
                               Private bool* %182 = OpAccessChain %123 %108 
                                        bool %183 = OpLoad %182 
                                                      OpSelectionMerge %185 None 
                                                      OpBranchConditional %183 %184 %337 
                                             %184 = OpLabel 
                                Uniform i32* %187 = OpAccessChain %42 %142 %72 
                                         i32 %188 = OpLoad %187 
                                        bool %189 = OpIEqual %188 %147 
                               Private bool* %190 = OpAccessChain %123 %58 
                                                      OpStore %190 %189 
                               Private bool* %191 = OpAccessChain %123 %58 
                                        bool %192 = OpLoad %191 
                                                      OpSelectionMerge %194 None 
                                                      OpBranchConditional %192 %193 %252 
                                             %193 = OpLabel 
                                         f32 %198 = OpLoad vs_TEXCOORD3 
                                Uniform f32* %200 = OpAccessChain %42 %199 %108 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFMul %198 %201 
                                Private f32* %203 = OpAccessChain %195 %58 
                                                      OpStore %203 %202 
                                       f32_3 %204 = OpLoad %195 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 0 
                                       f32_2 %207 = OpFMul %205 %206 
                                       f32_3 %208 = OpLoad %195 
                                       f32_3 %209 = OpVectorShuffle %208 %207 3 4 2 
                                                      OpStore %195 %209 
                                       f32_4 %210 = OpLoad %79 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 2 
                              Uniform f32_4* %212 = OpAccessChain %42 %199 
                                       f32_4 %213 = OpLoad %212 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 0 
                                       f32_2 %215 = OpFMul %211 %214 
                                       f32_3 %216 = OpLoad %195 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_2 %218 = OpFAdd %215 %217 
                                       f32_4 %219 = OpLoad %79 
                                       f32_4 %220 = OpVectorShuffle %219 %218 4 1 5 3 
                                                      OpStore %79 %220 
                         read_only Texture2D %222 = OpLoad %221 
                                     sampler %224 = OpLoad %223 
                  read_only Texture2DSampled %225 = OpSampledImage %222 %224 
                                       f32_4 %226 = OpLoad %79 
                                       f32_2 %227 = OpVectorShuffle %226 %226 0 2 
                                       f32_4 %228 = OpImageSampleImplicitLod %225 %227 
                                         f32 %229 = OpCompositeExtract %228 0 
                                Private f32* %230 = OpAccessChain %79 %58 
                                                      OpStore %230 %229 
                                        bool %232 = OpLoad %117 
                                                      OpSelectionMerge %236 None 
                                                      OpBranchConditional %232 %235 %237 
                                             %235 = OpLabel 
                                                      OpStore %234 %128 
                                                      OpBranch %236 
                                             %237 = OpLabel 
                                Uniform f32* %238 = OpAccessChain %42 %170 %108 
                                         f32 %239 = OpLoad %238 
                                                      OpStore %234 %239 
                                                      OpBranch %236 
                                             %236 = OpLabel 
                                         f32 %240 = OpLoad %234 
                                                      OpStore %231 %240 
                                Private f32* %241 = OpAccessChain %79 %58 
                                         f32 %242 = OpLoad %241 
                                         f32 %244 = OpFAdd %242 %243 
                                Private f32* %245 = OpAccessChain %79 %58 
                                                      OpStore %245 %244 
                                         f32 %246 = OpLoad %231 
                                Private f32* %247 = OpAccessChain %79 %58 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFMul %246 %248 
                                         f32 %250 = OpFAdd %249 %76 
                                Private f32* %251 = OpAccessChain %79 %58 
                                                      OpStore %251 %250 
                                                      OpBranch %194 
                                             %252 = OpLabel 
                                Private f32* %253 = OpAccessChain %79 %58 
                                                      OpStore %253 %76 
                                                      OpBranch %194 
                                             %194 = OpLabel 
                                       f32_3 %254 = OpLoad %133 
                              Uniform f32_4* %256 = OpAccessChain %42 %255 
                                       f32_4 %257 = OpLoad %256 
                                       f32_3 %258 = OpVectorShuffle %257 %257 3 3 3 
                                       f32_3 %259 = OpFMul %254 %258 
                                                      OpStore %195 %259 
                                Private f32* %262 = OpAccessChain %79 %108 
                                         f32 %263 = OpLoad %262 
                                Uniform f32* %264 = OpAccessChain %42 %255 %58 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFNegate %265 
                                         f32 %267 = OpFAdd %263 %266 
                                Private f32* %268 = OpAccessChain %261 %58 
                                                      OpStore %268 %267 
                                Private f32* %269 = OpAccessChain %261 %58 
                                         f32 %270 = OpLoad %269 
                                Uniform f32* %271 = OpAccessChain %42 %255 %108 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                                      OpStore %231 %273 
                                Uniform f32* %275 = OpAccessChain %42 %255 %67 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFNegate %276 
                                         f32 %279 = OpFMul %277 %278 
                                         f32 %280 = OpFAdd %279 %76 
                                                      OpStore %274 %280 
                                Private f32* %281 = OpAccessChain %261 %58 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpLoad %274 
                                         f32 %284 = OpFMul %282 %283 
                                Private f32* %285 = OpAccessChain %261 %58 
                                                      OpStore %285 %284 
                                Private f32* %286 = OpAccessChain %261 %58 
                                         f32 %287 = OpLoad %286 
                                         f32 %288 = OpExtInst %1 37 %287 %128 
                                Private f32* %289 = OpAccessChain %261 %58 
                                                      OpStore %289 %288 
                                       f32_3 %290 = OpLoad %195 
                                       f32_3 %291 = OpLoad %195 
                                         f32 %292 = OpDot %290 %291 
                                Private f32* %293 = OpAccessChain %195 %58 
                                                      OpStore %293 %292 
                                Private f32* %294 = OpAccessChain %195 %58 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpExtInst %1 31 %295 
                                Private f32* %297 = OpAccessChain %195 %58 
                                                      OpStore %297 %296 
                                Private f32* %298 = OpAccessChain %261 %58 
                                         f32 %299 = OpLoad %298 
                                Private f32* %300 = OpAccessChain %261 %58 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFMul %299 %301 
                                Private f32* %303 = OpAccessChain %261 %58 
                                                      OpStore %303 %302 
                                Private f32* %305 = OpAccessChain %133 %108 
                                         f32 %306 = OpLoad %305 
                                         f32 %308 = OpFAdd %306 %307 
                                                      OpStore %304 %308 
                                Private f32* %309 = OpAccessChain %261 %58 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpLoad %304 
                                         f32 %312 = OpExtInst %1 4 %311 
                                         f32 %313 = OpFDiv %310 %312 
                                Private f32* %314 = OpAccessChain %261 %58 
                                                      OpStore %314 %313 
                                Uniform f32* %315 = OpAccessChain %42 %255 %67 
                                         f32 %316 = OpLoad %315 
                                         f32 %317 = OpLoad %231 
                                         f32 %318 = OpFMul %316 %317 
                                Private f32* %319 = OpAccessChain %261 %58 
                                         f32 %320 = OpLoad %319 
                                         f32 %321 = OpFNegate %320 
                                         f32 %322 = OpFAdd %318 %321 
                                Private f32* %323 = OpAccessChain %261 %58 
                                                      OpStore %323 %322 
                                Private f32* %324 = OpAccessChain %261 %58 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %195 %58 
                                         f32 %327 = OpLoad %326 
                                         f32 %328 = OpFNegate %327 
                                         f32 %329 = OpFMul %325 %328 
                                Private f32* %330 = OpAccessChain %261 %58 
                                                      OpStore %330 %329 
                                Private f32* %331 = OpAccessChain %79 %58 
                                         f32 %332 = OpLoad %331 
                                Private f32* %333 = OpAccessChain %261 %58 
                                         f32 %334 = OpLoad %333 
                                         f32 %335 = OpFMul %332 %334 
                                Private f32* %336 = OpAccessChain %79 %58 
                                                      OpStore %336 %335 
                                                      OpBranch %185 
                                             %337 = OpLabel 
                                Private f32* %338 = OpAccessChain %79 %58 
                                                      OpStore %338 %128 
                                                      OpBranch %185 
                                             %185 = OpLabel 
                                Private f32* %339 = OpAccessChain %79 %58 
                                         f32 %340 = OpLoad %339 
                                         f32 %341 = OpLoad %98 
                                         f32 %342 = OpFAdd %340 %341 
                                Private f32* %343 = OpAccessChain %79 %58 
                                                      OpStore %343 %342 
                                Private f32* %344 = OpAccessChain %79 %58 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpExtInst %1 40 %345 %128 
                                Private f32* %347 = OpAccessChain %79 %58 
                                                      OpStore %347 %346 
                                       f32_4 %348 = OpLoad %79 
                                       f32_2 %349 = OpVectorShuffle %348 %348 0 0 
                              Uniform f32_4* %351 = OpAccessChain %42 %350 
                                       f32_4 %352 = OpLoad %351 
                                       f32_2 %353 = OpVectorShuffle %352 %352 1 0 
                                       f32_2 %354 = OpFMul %349 %353 
                                                      OpStore %261 %354 
                                Private f32* %355 = OpAccessChain %79 %58 
                                         f32 %356 = OpLoad %355 
                                Uniform f32* %357 = OpAccessChain %42 %350 %67 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFMul %356 %358 
                                Uniform f32* %360 = OpAccessChain %42 %350 %72 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFAdd %359 %361 
                                Private f32* %363 = OpAccessChain %79 %58 
                                                      OpStore %363 %362 
                               Private bool* %364 = OpAccessChain %141 %108 
                                        bool %365 = OpLoad %364 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                                Private f32* %369 = OpAccessChain %79 %58 
                                         f32 %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                                                      OpStore %366 %128 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                         f32 %372 = OpLoad %366 
                                Private f32* %373 = OpAccessChain %79 %58 
                                                      OpStore %373 %372 
                                Private f32* %374 = OpAccessChain %261 %58 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpFNegate %375 
                                         f32 %377 = OpExtInst %1 29 %376 
                                Private f32* %378 = OpAccessChain %261 %58 
                                                      OpStore %378 %377 
                               Private bool* %379 = OpAccessChain %141 %67 
                                        bool %380 = OpLoad %379 
                                                      OpSelectionMerge %383 None 
                                                      OpBranchConditional %380 %382 %386 
                                             %382 = OpLabel 
                                Private f32* %384 = OpAccessChain %261 %58 
                                         f32 %385 = OpLoad %384 
                                                      OpStore %381 %385 
                                                      OpBranch %383 
                                             %386 = OpLabel 
                                Private f32* %387 = OpAccessChain %79 %58 
                                         f32 %388 = OpLoad %387 
                                                      OpStore %381 %388 
                                                      OpBranch %383 
                                             %383 = OpLabel 
                                         f32 %389 = OpLoad %381 
                                Private f32* %390 = OpAccessChain %79 %58 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %261 %108 
                                         f32 %392 = OpLoad %391 
                                Private f32* %393 = OpAccessChain %261 %108 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFNegate %394 
                                         f32 %396 = OpFMul %392 %395 
                                Private f32* %397 = OpAccessChain %261 %58 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %261 %58 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpExtInst %1 29 %399 
                                Private f32* %401 = OpAccessChain %261 %58 
                                                      OpStore %401 %400 
                               Private bool* %402 = OpAccessChain %141 %72 
                                        bool %403 = OpLoad %402 
                                                      OpSelectionMerge %406 None 
                                                      OpBranchConditional %403 %405 %409 
                                             %405 = OpLabel 
                                Private f32* %407 = OpAccessChain %261 %58 
                                         f32 %408 = OpLoad %407 
                                                      OpStore %404 %408 
                                                      OpBranch %406 
                                             %409 = OpLabel 
                                Private f32* %410 = OpAccessChain %79 %58 
                                         f32 %411 = OpLoad %410 
                                                      OpStore %404 %411 
                                                      OpBranch %406 
                                             %406 = OpLabel 
                                         f32 %412 = OpLoad %404 
                                Private f32* %413 = OpAccessChain %79 %58 
                                                      OpStore %413 %412 
                                Private f32* %414 = OpAccessChain %79 %58 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpExtInst %1 43 %415 %128 %76 
                                Private f32* %417 = OpAccessChain %79 %58 
                                                      OpStore %417 %416 
                                Private f32* %418 = OpAccessChain %79 %58 
                                         f32 %419 = OpLoad %418 
                                         f32 %420 = OpFAdd %419 %243 
                                Private f32* %421 = OpAccessChain %261 %58 
                                                      OpStore %421 %420 
                                Uniform f32* %423 = OpAccessChain %42 %422 %58 
                                         f32 %424 = OpLoad %423 
                                Private f32* %425 = OpAccessChain %261 %58 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFMul %424 %426 
                                         f32 %428 = OpFAdd %427 %76 
                                Private f32* %429 = OpAccessChain %261 %58 
                                                      OpStore %429 %428 
                                        bool %430 = OpLoad %117 
                                                      OpSelectionMerge %433 None 
                                                      OpBranchConditional %430 %432 %436 
                                             %432 = OpLabel 
                                Private f32* %434 = OpAccessChain %261 %58 
                                         f32 %435 = OpLoad %434 
                                                      OpStore %431 %435 
                                                      OpBranch %433 
                                             %436 = OpLabel 
                                Private f32* %437 = OpAccessChain %79 %58 
                                         f32 %438 = OpLoad %437 
                                                      OpStore %431 %438 
                                                      OpBranch %433 
                                             %433 = OpLabel 
                                         f32 %439 = OpLoad %431 
                                                      OpStore %60 %439 
                              Uniform i32_4* %441 = OpAccessChain %42 %142 
                                       i32_4 %442 = OpLoad %441 
                                       i32_4 %443 = OpVectorShuffle %442 %442 2 2 2 2 
                                      bool_4 %445 = OpIEqual %443 %444 
                                      bool_2 %446 = OpVectorShuffle %445 %445 0 1 
                                                      OpStore %440 %446 
                               Private bool* %447 = OpAccessChain %440 %58 
                                        bool %448 = OpLoad %447 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %468 
                                             %449 = OpLabel 
                                         f32 %451 = OpLoad %50 
                                Uniform f32* %453 = OpAccessChain %42 %452 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFDiv %451 %454 
                                Private f32* %456 = OpAccessChain %195 %58 
                                                      OpStore %456 %455 
                                Private f32* %457 = OpAccessChain %195 %108 
                                                      OpStore %457 %128 
                         read_only Texture2D %459 = OpLoad %458 
                                     sampler %460 = OpLoad %30 
                  read_only Texture2DSampled %461 = OpSampledImage %459 %460 
                                       f32_3 %462 = OpLoad %195 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_4 %464 = OpImageSampleImplicitLod %461 %463 
                                       f32_3 %465 = OpVectorShuffle %464 %464 0 1 2 
                                       f32_4 %466 = OpLoad %79 
                                       f32_4 %467 = OpVectorShuffle %466 %465 4 1 5 6 
                                                      OpStore %79 %467 
                                                      OpBranch %450 
                                             %468 = OpLabel 
                              Uniform f32_4* %470 = OpAccessChain %42 %469 
                                       f32_4 %471 = OpLoad %470 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_4 %473 = OpLoad %79 
                                       f32_4 %474 = OpVectorShuffle %473 %472 4 1 5 6 
                                                      OpStore %79 %474 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                               Private bool* %475 = OpAccessChain %440 %108 
                                        bool %476 = OpLoad %475 
                                                      OpSelectionMerge %478 None 
                                                      OpBranchConditional %476 %477 %478 
                                             %477 = OpLabel 
                         read_only Texture2D %480 = OpLoad %479 
                                     sampler %481 = OpLoad %30 
                  read_only Texture2DSampled %482 = OpSampledImage %480 %481 
                                       f32_2 %484 = OpLoad vs_TEXCOORD0 
                                       f32_4 %485 = OpImageSampleExplicitLod %482 %484 Lod %7 
                                       f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                                       f32_4 %487 = OpLoad %79 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 1 5 6 
                                                      OpStore %79 %488 
                                                      OpBranch %478 
                                             %478 = OpLabel 
                                       f32_3 %489 = OpLoad vs_TEXCOORD2 
                              Uniform f32_4* %491 = OpAccessChain %42 %490 
                                       f32_4 %492 = OpLoad %491 
                                       f32_3 %493 = OpVectorShuffle %492 %492 0 1 2 
                                         f32 %494 = OpDot %489 %493 
                                                      OpStore %50 %494 
                                         f32 %495 = OpLoad %50 
                                         f32 %496 = OpExtInst %1 43 %495 %128 %76 
                                                      OpStore %50 %496 
                                         f32 %497 = OpLoad %50 
                                Uniform f32* %498 = OpAccessChain %42 %490 %72 
                                         f32 %499 = OpLoad %498 
                                         f32 %500 = OpFMul %497 %499 
                                                      OpStore %50 %500 
                                       f32_4 %501 = OpLoad %79 
                                       f32_3 %502 = OpVectorShuffle %501 %501 0 2 3 
                                       f32_3 %503 = OpFNegate %502 
                              Uniform f32_4* %505 = OpAccessChain %42 %504 
                                       f32_4 %506 = OpLoad %505 
                                       f32_3 %507 = OpVectorShuffle %506 %506 0 1 2 
                                       f32_3 %508 = OpFAdd %503 %507 
                                                      OpStore %195 %508 
                                         f32 %509 = OpLoad %50 
                                       f32_3 %510 = OpCompositeConstruct %509 %509 %509 
                                       f32_3 %511 = OpLoad %195 
                                       f32_3 %512 = OpFMul %510 %511 
                                       f32_4 %513 = OpLoad %79 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 2 3 
                                       f32_3 %515 = OpFAdd %512 %514 
                                       f32_4 %516 = OpLoad %79 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %79 %517 
                                       f32_3 %518 = OpLoad %27 
                              Uniform f32_4* %519 = OpAccessChain %42 %43 
                                       f32_4 %520 = OpLoad %519 
                                       f32_3 %521 = OpVectorShuffle %520 %520 1 1 1 
                                       f32_3 %522 = OpFMul %518 %521 
                                       f32_4 %523 = OpLoad %79 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 1 2 
                                       f32_3 %525 = OpFAdd %522 %524 
                                       f32_4 %526 = OpLoad %79 
                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
                                                      OpStore %79 %527 
                                       f32_3 %528 = OpLoad %27 
                                       f32_3 %529 = OpFNegate %528 
                              Uniform f32_4* %530 = OpAccessChain %42 %43 
                                       f32_4 %531 = OpLoad %530 
                                       f32_3 %532 = OpVectorShuffle %531 %531 1 1 1 
                                       f32_3 %533 = OpFMul %529 %532 
                                       f32_4 %534 = OpLoad %9 
                                       f32_3 %535 = OpVectorShuffle %534 %534 0 1 2 
                                       f32_3 %536 = OpFAdd %533 %535 
                                       f32_4 %537 = OpLoad %9 
                                       f32_4 %538 = OpVectorShuffle %537 %536 4 5 6 3 
                                                      OpStore %9 %538 
                                         f32 %539 = OpLoad %60 
                                       f32_3 %540 = OpCompositeConstruct %539 %539 %539 
                                       f32_4 %541 = OpLoad %9 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                                       f32_3 %543 = OpFMul %540 %542 
                                       f32_3 %544 = OpLoad %36 
                                       f32_3 %545 = OpFAdd %543 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_4 %547 = OpVectorShuffle %546 %545 4 5 6 3 
                                                      OpStore %9 %547 
                                       f32_4 %548 = OpLoad %79 
                                       f32_3 %549 = OpVectorShuffle %548 %548 0 1 2 
                                       f32_3 %550 = OpFNegate %549 
                                       f32_4 %551 = OpLoad %9 
                                       f32_3 %552 = OpVectorShuffle %551 %551 0 1 2 
                                       f32_3 %553 = OpFAdd %550 %552 
                                       f32_4 %554 = OpLoad %9 
                                       f32_4 %555 = OpVectorShuffle %554 %553 4 5 6 3 
                                                      OpStore %9 %555 
                                         f32 %558 = OpLoad %60 
                                       f32_3 %559 = OpCompositeConstruct %558 %558 %558 
                                       f32_4 %560 = OpLoad %9 
                                       f32_3 %561 = OpVectorShuffle %560 %560 0 1 2 
                                       f32_3 %562 = OpFMul %559 %561 
                                       f32_4 %563 = OpLoad %79 
                                       f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
                                       f32_3 %565 = OpFAdd %562 %564 
                                       f32_4 %566 = OpLoad %557 
                                       f32_4 %567 = OpVectorShuffle %566 %565 4 5 6 3 
                                                      OpStore %557 %567 
                                Private f32* %568 = OpAccessChain %9 %72 
                                         f32 %569 = OpLoad %568 
                                 Output f32* %571 = OpAccessChain %557 %72 
                                                      OpStore %571 %569 
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